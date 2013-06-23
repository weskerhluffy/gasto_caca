class EgresosController < ApplicationController
  # GET /egresos
  # GET /egresos.json
  def index
    @egresos = Egreso.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @egreso }
    end
  end

  # GET /egresos/1/edit
  def edit
    @egreso = Egreso.find(params[:id])
  end

  # POST /egresos
  # POST /egresos.json
  def create
    @egreso = Egreso.new(params[:egreso])

    respond_to do |format|
      if @egreso.save
        format.html { redirect_to @egreso, notice: 'Egreso was successfully created.' }
        format.json { render json: @egreso, status: :created, location: @egreso }
      else
        format.html { render action: "new" }
        format.json { render json: @egreso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /egresos/1
  # PUT /egresos/1.json
  def update
    @egreso = Egreso.find(params[:id])

    respond_to do |format|
      if @egreso.update_attributes(params[:egreso])
        format.html { redirect_to @egreso, notice: 'Egreso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @egreso.errors, status: :unprocessable_entity }
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
end
