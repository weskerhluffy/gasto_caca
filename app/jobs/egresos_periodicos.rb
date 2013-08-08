class EgresosPeriodicos
#  @@logger=Logger.new(STDOUT)
  @@logger=Rails::logger
  @queue = :pagos_periodicos #this class variable will be used as queue name in resque, so you can fill in different name
  @@generacion_exitosa=false
  def self.perform(periodo_id) 
    filtro_periodo=""
    valor_filtro=nil
    
    @@logger.level = Logger::DEBUG
    
    case periodo_id
    when AplicacionPeriodica::PERIODO_ANUAL
      filtro_periodo="and year(created_at)=?"
      valor_filtro=Time.now.year
    when AplicacionPeriodica::PERIODO_MENSUAL
      filtro_periodo="and month(created_at)=?"
      valor_filtro=Time.now.month
    when AplicacionPeriodica::PERIODO_SEMANAL
      filtro_periodo="and week(created_at)=?"
      valor_filtro=Time.now.strftime("%W")
    when AplicacionPeriodica::PERIODO_DIARIO
      filtro_periodo="and created_at=?"
      valor_filtro=Time.now
    else
      @@logger.fatal "tipo de periodo #{periodo_id} no soportado, abortando al maximo"
      raise "tipo de periodo #{periodo_id} no soportado, abortando al maximo"
    end
    aplicaciones_periodicas=AplicacionPeriodica.where(periodo_id: periodo_id)
    @@logger.info "cacassss #{aplicaciones_periodicas}"
    
    aplicaciones_periodicas.each do |aplicacion_periodica|
      egreso_existente=Egreso.where("aplicacion_periodica_id=? "+filtro_periodo, aplicacion_periodica.id,valor_filtro)     
      egreso_existente.each do |egreso_caca|
        @@logger.debug("el egreso q ya esta #{egreso_caca}")
      end
      @@logger.info "no existen egresos ya registrados: #{egreso_existente.empty?}"
      if(egreso_existente.blank?)
        egreso_nuevo=Egreso.new
        egreso_nuevo.descripcion=aplicacion_periodica.descripcion
        egreso_nuevo.monto=aplicacion_periodica.monto
        egreso_nuevo.tipo_egreso_id=aplicacion_periodica.tipo_egreso_id
        egreso_nuevo.tipo_ingreso_id=aplicacion_periodica.tipo_ingreso_id
        egreso_nuevo.aplicacion_periodica_id=aplicacion_periodica.id
        unless egreso_nuevo.save
          raise "mierda, no se pudo salvar el egreso #{egreso_nuevo}"
        end
        if(!aplicacion_periodica.deuda.blank?)
          aplicacion_periodica.deuda.egresos.push(egreso_nuevo)
          unless aplicacion_periodica.deuda.save
            raise "no se pudo asociar la deuda #{aplicacion_periodica.deuda.descripcion} al egreso #{egreso_nuevo.descripcion}"
          end
        end
        
      end 
    end
    @@generacion_exitosa=true
  end

  def self.generacion_exitosa
    @@generacion_exitosa
  end
end