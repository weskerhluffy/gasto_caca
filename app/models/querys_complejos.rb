# TODO: Cambiar ids de tipos por constantes
class QuerysComplejos < ActiveRecord::Base
  def self.my_query
    self.connection.execute("select * from egresos_aplicados e join tipo_egresos te on (e.tipo_egreso_id=te.id) join tipo_ingresos ti on (e.tipo_ingreso_id=ti.id)")
  end
  def self.totales
    @totales=[]
    @totales_result=self.connection.execute("
      select 
        (
          select sum(e.monto) 
          from egresos_aplicados e 
          where e.id not in 
          (
            select distinct i.egreso_id 
            from ingresos i 
            where i.egreso_id is not null
          )
        ) as monto_ingresos,
        (
          select sum(i.monto)
          -
          (
            select sum(rd.restante)
            from totales_deudas rd
          )
          from ingresos i
          where i.egreso_id is null
        ) as monto_egresos,
        (
          select sum(i.monto)
          -
          (
            select sum(rd.restante)
            from totales_deudas rd
          ) 
          from ingresos i
          where i.egreso_id is null
        )
        -
        (
          select sum(e.monto) 
          from egresos_aplicados e 
          where e.id not in 
          (
            select distinct i.egreso_id 
            from ingresos i 
            where i.egreso_id is not null
          )
        ) as monto_total
    ")
    @totales_result.each do |total|
      @totales=total
    end
    return Hash["Egresos"=> @totales[0],"Ingresos"=> @totales[1], "Balance"=> @totales[2]]
  end
  
  def self.totales_disponibles
# XXX: http://stackoverflow.com/questions/265725/what-is-the-best-way-to-handle-constants-in-ruby-when-using-rails
    @totales_result=self.connection.execute("
      select 
      ti.descripcion as descripcion,
      (select sum(i.monto)
      from ingresos i
      where i.tipo_ingreso_id=ti.id
      )
      -
      if(
        ti.id=1
      ,
        (
            select sum(e.monto)
            from egresos_aplicados e
            where (e.tipo_ingreso_id =ti.id
            and e.tipo_egreso_id!=6)
            or e.tipo_ingreso_id =5
        )
      ,
        (
            select sum(e.monto)
            from egresos_aplicados e
            where e.tipo_ingreso_id=ti.id
        )
      )
      as monto
      from tipo_ingresos ti
      where ti.id!=#{TipoIngreso::PRESTAMO}
      order by monto desc
    ")
#      having monto>0
    return @totales_result
  end
  
  def self.totales_egresos
    @totales_result=self.connection.execute("
      select te.descripcion,sum(e.monto) monto
      from egresos_aplicados e
      join tipo_egresos te
      on (e.tipo_egreso_id=te.id)
      where e.aplicacion between DATE_SUB(CURDATE(),interval 1 month)- interval day(curdate()) day + interval 1 day + interval 12 day and curdate()+ interval 1 day
      and e.id not in (select distinct i.egreso_id from ingresos i where i.egreso_id is not null)
      group by e.tipo_egreso_id,te.descripcion
      order by monto desc
    ")
    return @totales_result
  end
  
  
  def self.totales_banco
    banco_neto=""
    banco_fisico=""
    @total_fisico=self.connection.execute("
      select 
      sum(i.monto)
      -
      (
          select sum(e.monto) 
          from egresos_aplicados e
          where (e.tipo_ingreso_id =1
          and e.tipo_egreso_id!=6)
          or e.tipo_ingreso_id =5
      ) as banco_fisico
      from ingresos i
      where i.tipo_ingreso_id=1
    ")
    @total_neto=self.connection.execute("
      select 
      sum(i.monto)
      -
      (
          select sum(e.monto) 
          from egresos_aplicados e
          where e.tipo_ingreso_id=1
      )
      -
      (
          select sum(rd.restante)
          from totales_deudas rd
      ) as banco_neto
      from ingresos i
      where i.tipo_ingreso_id=1
    ")
    @total_neto.each do |caca,mierda|
      banco_neto=caca
    end
    @total_fisico.each do |caca,mierda|
      banco_fisico=caca
    end
    return Hash["Neto"=>banco_neto,"Fisico"=>banco_fisico]
  end
end
