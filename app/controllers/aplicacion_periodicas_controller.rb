class AplicacionPeriodicasController < ApplicationController
  # GET /aplicacion_periodicas
  # GET /aplicacion_periodicas.json
  def index
    @aplicacion_periodicas = AplicacionPeriodica.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aplicacion_periodicas }
    end
  end

  # GET /aplicacion_periodicas/1
  # GET /aplicacion_periodicas/1.json
  def show
    @aplicacion_periodica = AplicacionPeriodica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aplicacion_periodica }
    end
  end

  # GET /aplicacion_periodicas/new
  # GET /aplicacion_periodicas/new.json
  def new
    @aplicacion_periodica = AplicacionPeriodica.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aplicacion_periodica }
    end
  end

  # GET /aplicacion_periodicas/1/edit
  def edit
    @aplicacion_periodica = AplicacionPeriodica.find(params[:id])
  end

  # POST /aplicacion_periodicas
  # POST /aplicacion_periodicas.json
  def create
    @aplicacion_periodica = AplicacionPeriodica.new(params[:aplicacion_periodica])

    respond_to do |format|
      if @aplicacion_periodica.save
        format.html { redirect_to @aplicacion_periodica, notice: 'Aplicacion periodica was successfully created.' }
        format.json { render json: @aplicacion_periodica, status: :created, location: @aplicacion_periodica }
      else
        format.html { render action: "new" }
        format.json { render json: @aplicacion_periodica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aplicacion_periodicas/1
  # PUT /aplicacion_periodicas/1.json
  def update
    @aplicacion_periodica = AplicacionPeriodica.find(params[:id])

    respond_to do |format|
      if @aplicacion_periodica.update_attributes(params[:aplicacion_periodica])
        format.html { redirect_to @aplicacion_periodica, notice: 'Aplicacion periodica was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aplicacion_periodica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aplicacion_periodicas/1
  # DELETE /aplicacion_periodicas/1.json
  def destroy
    @aplicacion_periodica = AplicacionPeriodica.find(params[:id])
    @aplicacion_periodica.destroy

    respond_to do |format|
      format.html { redirect_to aplicacion_periodicas_url }
      format.json { head :no_content }
    end
  end
end
