class DeudasController < ApplicationController
  # GET /deudas
  # GET /deudas.json
  def index
    @deudas = Deuda.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deudas }
    end
  end

  # GET /deudas/1
  # GET /deudas/1.json
  def show
    @deuda = Deuda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deuda }
    end
  end

  # GET /deudas/new
  # GET /deudas/new.json
  def new
    @deuda = Deuda.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deuda }
    end
  end

  # GET /deudas/1/edit
  def edit
    @deuda = Deuda.find(params[:id])
  end

  # POST /deudas
  # POST /deudas.json
  def create
    logger.debug("Creando calabaza aa #{params[:deuda][:deuda_original_id]}  #{params}")
    @deuda = Deuda.new(params[:deuda])
    if(params[:deuda].has_key?(:deuda_original_id))
      logger.debug("Se slecciono deuda original")
      if(@deuda.credito.present?)
        logger.debug("Estaba asociado con un credito")
        @deuda.credito.deudas.delete(@deuda)
      end
      @deuda.credito_id=nil
    end

    respond_to do |format|
      if @deuda.save
        format.html { redirect_to @deuda, notice: 'Deuda was successfully created.' }
        format.json { render json: @deuda, status: :created, location: @deuda }
      else
        format.html { render action: "new" }
        format.json { render json: @deuda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deudas/1
  # PUT /deudas/1.json
  def update
    @deuda = Deuda.find(params[:id])

    if(params[:deuda].has_key?(:deuda_original_id))
      logger.debug("Se slecciono deuda original")
      if(@deuda.credito.present?)
        logger.debug("Estaba asociado con un credito")
        @deuda.credito.deudas.delete(@deuda)
      end
      @deuda.credito_id=nil
    end

    respond_to do |format|
      if @deuda.update_attributes(params[:deuda])
        format.html { redirect_to @deuda, notice: 'Deuda was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deuda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deudas/1
  # DELETE /deudas/1.json
  def destroy
    @deuda = Deuda.find(params[:id])
    @deuda.destroy

    respond_to do |format|
      format.html { redirect_to deudas_url }
      format.json { head :no_content }
    end
  end
end
