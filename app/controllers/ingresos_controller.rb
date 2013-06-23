class IngresosController < ApplicationController
  # GET /ingresos
  # GET /ingresos.json
  def index
    @ingresos = Ingreso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ingresos }
    end
  end

  # GET /ingresos/1
  # GET /ingresos/1.json
  def show
    @ingreso = Ingreso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingreso }
    end
  end

  # GET /ingresos/new
  # GET /ingresos/new.json
  def new
    @ingreso = Ingreso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ingreso }
    end
  end

  # GET /ingresos/1/edit
  def edit
    @ingreso = Ingreso.find(params[:id])
  end

  # POST /ingresos
  # POST /ingresos.json
  def create
    @ingreso = Ingreso.new(params[:ingreso])

    respond_to do |format|
      if @ingreso.save
        format.html { redirect_to @ingreso, notice: 'Ingreso was successfully created.' }
        format.json { render json: @ingreso, status: :created, location: @ingreso }
      else
        format.html { render action: "new" }
        format.json { render json: @ingreso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ingresos/1
  # PUT /ingresos/1.json
  def update
    @ingreso = Ingreso.find(params[:id])

    respond_to do |format|
      if @ingreso.update_attributes(params[:ingreso])
        format.html { redirect_to @ingreso, notice: 'Ingreso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ingreso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingresos/1
  # DELETE /ingresos/1.json
  def destroy
    @ingreso = Ingreso.find(params[:id])
    @ingreso.destroy

    respond_to do |format|
      format.html { redirect_to ingresos_url }
      format.json { head :no_content }
    end
  end
end
