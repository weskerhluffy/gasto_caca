class TipoEgresosController < ApplicationController
  # GET /tipo_egresos
  # GET /tipo_egresos.json
  def index
    @tipo_egresos = TipoEgreso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_egresos }
    end
  end

  # GET /tipo_egresos/1
  # GET /tipo_egresos/1.json
  def show
    @tipo_egreso = TipoEgreso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_egreso }
    end
  end

  # GET /tipo_egresos/new
  # GET /tipo_egresos/new.json
  def new
    @tipo_egreso = TipoEgreso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_egreso }
    end
  end

  # GET /tipo_egresos/1/edit
  def edit
    @tipo_egreso = TipoEgreso.find(params[:id])
  end

  # POST /tipo_egresos
  # POST /tipo_egresos.json
  def create
    @tipo_egreso = TipoEgreso.new(params[:tipo_egreso])

    respond_to do |format|
      if @tipo_egreso.save
        format.html { redirect_to @tipo_egreso, notice: 'Tipo egreso was successfully created.' }
        format.json { render json: @tipo_egreso, status: :created, location: @tipo_egreso }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_egreso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_egresos/1
  # PUT /tipo_egresos/1.json
  def update
    @tipo_egreso = TipoEgreso.find(params[:id])

    respond_to do |format|
      if @tipo_egreso.update_attributes(params[:tipo_egreso])
        format.html { redirect_to @tipo_egreso, notice: 'Tipo egreso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_egreso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_egresos/1
  # DELETE /tipo_egresos/1.json
  def destroy
    @tipo_egreso = TipoEgreso.find(params[:id])
    @tipo_egreso.destroy

    respond_to do |format|
      format.html { redirect_to tipo_egresos_url }
      format.json { head :no_content }
    end
  end
end
