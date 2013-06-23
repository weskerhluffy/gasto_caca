class TipoIngresosController < ApplicationController
  # GET /tipo_ingresos
  # GET /tipo_ingresos.json
  def index
    @tipo_ingresos = TipoIngreso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_ingresos }
    end
  end

  # GET /tipo_ingresos/1
  # GET /tipo_ingresos/1.json
  def show
    @tipo_ingreso = TipoIngreso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_ingreso }
    end
  end

  # GET /tipo_ingresos/new
  # GET /tipo_ingresos/new.json
  def new
    @tipo_ingreso = TipoIngreso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_ingreso }
    end
  end

  # GET /tipo_ingresos/1/edit
  def edit
    @tipo_ingreso = TipoIngreso.find(params[:id])
  end

  # POST /tipo_ingresos
  # POST /tipo_ingresos.json
  def create
    @tipo_ingreso = TipoIngreso.new(params[:tipo_ingreso])

    respond_to do |format|
      if @tipo_ingreso.save
        format.html { redirect_to @tipo_ingreso, notice: 'Tipo ingreso was successfully created.' }
        format.json { render json: @tipo_ingreso, status: :created, location: @tipo_ingreso }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_ingreso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_ingresos/1
  # PUT /tipo_ingresos/1.json
  def update
    @tipo_ingreso = TipoIngreso.find(params[:id])

    respond_to do |format|
      if @tipo_ingreso.update_attributes(params[:tipo_ingreso])
        format.html { redirect_to @tipo_ingreso, notice: 'Tipo ingreso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_ingreso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_ingresos/1
  # DELETE /tipo_ingresos/1.json
  def destroy
    @tipo_ingreso = TipoIngreso.find(params[:id])
    @tipo_ingreso.destroy

    respond_to do |format|
      format.html { redirect_to tipo_ingresos_url }
      format.json { head :no_content }
    end
  end
end
