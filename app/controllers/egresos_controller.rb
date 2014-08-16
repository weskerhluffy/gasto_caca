class EgresosController < ApplicationController
  # GET /egresos
  # GET /egresos.json
  def index
#    @egresos = Egreso.all
# XXX: http://www.justinweiss.com/blog/2014/02/17/search-and-filter-rails-models-without-bloating-your-controller/
    @egresos = Egreso.filter({"recientes"=>true})
#    @egresos = Egreso.recientes()
    logger.debug "mierdaaaaaaaaaaaaa"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @egresos }
    end
  end

  # GET /egresos/1
  # GET /egresos/1.json
  def show
    @egreso = Egreso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @egreso }
    end
  end

  # GET /egresos/new
  # GET /egresos/new.json
  def new
    @egreso = Egreso.new
    @tipo_ingreso_conversion=nil

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @egreso }
    end
  end

  # GET /egresos/1/edit
  def edit
    @egreso = Egreso.find(params[:id])
    if (@egreso.ingresos.blank?)
      @tipo_ingreso_conversion=nil
    else
      @tipo_ingreso_conversion=@egreso.ingresos[0].tipo_ingreso_id
    end
  end

  # POST /egresos
  # POST /egresos.json
  def create
    ingreso_asociado=nil
    @egreso = Egreso.new(params[:egreso])
    @tipo_ingreso_conversion=params[:tipo_ingreso_conversion]
    
    logger.debug "la puta madre #{@tipo_ingreso_conversion}"

    respond_to do |format|
      if @egreso.save
        format.html { redirect_to @egreso, notice: 'Egreso was successfully created.' }
        format.json { render json: @egreso, status: :created, location: @egreso }
      else
        format.html { render action: "new" }
        format.json { render json: @egreso.errors, status: :unprocessable_entity }
      end
    end
    unless @tipo_ingreso_conversion.nil? || @tipo_ingreso_conversion == "" || @tipo_ingreso_conversion.to_i<1
      ingreso_asociado=Ingreso.new
      ingreso_asociado.aplicacion=@egreso.aplicacion
      ingreso_asociado.descripcion=@egreso.descripcion
      ingreso_asociado.monto=@egreso.monto
      ingreso_asociado.egreso_id=@egreso.id
      ingreso_asociado.tipo_ingreso_id=@tipo_ingreso_conversion.to_i
      unless ingreso_asociado.save
        format.html { render action: "new" }
      end
    end
  end

  # PUT /egresos/1
  # PUT /egresos/1.json
  def update
    @egreso = Egreso.find(params[:id])
    @tipo_ingreso_conversion=params[:tipo_ingreso_conversion]
    logger.debug "el nuevo tipo de ingreso a convertir shit #{@tipo_ingreso_conversion}"

    respond_to do |format|
      if @egreso.update_attributes(params[:egreso])
        format.html { redirect_to @egreso, notice: 'Egreso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @egreso.errors, status: :unprocessable_entity }
      end
    end
    unless (@egreso.ingresos.blank?)
      logger.debug "mandando a la verga anterior ingreso asociado #{@egreso.ingresos[0].tipo_ingreso_id}"
      @egreso.ingresos[0].destroy
    end
    unless @tipo_ingreso_conversion.nil? || @tipo_ingreso_conversion == "" || @tipo_ingreso_conversion.to_i<1
      logger.debug "creando nuevo ingreso asociado #{@tipo_ingreso_conversion}"
      ingreso_asociado=Ingreso.new
      ingreso_asociado.aplicacion=@egreso.aplicacion
      ingreso_asociado.descripcion=@egreso.descripcion
      ingreso_asociado.monto=@egreso.monto
      ingreso_asociado.egreso_id=@egreso.id
      ingreso_asociado.tipo_ingreso_id=@tipo_ingreso_conversion.to_i
      unless ingreso_asociado.save
        format.html { render action: "new" }
      end
    end
  end

  # DELETE /egresos/1
  # DELETE /egresos/1.json
  def destroy
    @egreso = Egreso.find(params[:id])
    @egreso.destroy

    respond_to do |format|
      format.html { redirect_to egresos_url }
      format.json { head :no_content }
    end
  end
  
  
   def historico
#    @egresos = Egreso.all
# XXX: http://www.justinweiss.com/blog/2014/02/17/search-and-filter-rails-models-without-bloating-your-controller/
    @egresos = Egreso.all()
#    @egresos = Egreso.recientes()
    logger.debug "rock city boy"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @egresos }
    end
  end
end
