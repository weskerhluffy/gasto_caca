class PeriodosController < ApplicationController
  # GET /periodos
  # GET /periodos.json
  def index
    @periodos = Periodo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @periodos }
    end
  end

  # GET /periodos/1
  # GET /periodos/1.json
  def show
    @periodo = Periodo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @periodo }
    end
  end

  # GET /periodos/new
  # GET /periodos/new.json
  def new
    @periodo = Periodo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @periodo }
    end
  end

  # GET /periodos/1/edit
  def edit
    @periodo = Periodo.find(params[:id])
  end

  # POST /periodos
  # POST /periodos.json
  def create
    @periodo = Periodo.new(params[:periodo])

    respond_to do |format|
      if @periodo.save
        format.html { redirect_to @periodo, notice: 'Periodo was successfully created.' }
        format.json { render json: @periodo, status: :created, location: @periodo }
      else
        format.html { render action: "new" }
        format.json { render json: @periodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /periodos/1
  # PUT /periodos/1.json
  def update
    @periodo = Periodo.find(params[:id])

    respond_to do |format|
      if @periodo.update_attributes(params[:periodo])
        format.html { redirect_to @periodo, notice: 'Periodo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @periodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodos/1
  # DELETE /periodos/1.json
  def destroy
    @periodo = Periodo.find(params[:id])
    @periodo.destroy

    respond_to do |format|
      format.html { redirect_to periodos_url }
      format.json { head :no_content }
    end
  end
end
