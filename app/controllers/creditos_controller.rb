class CreditosController < ApplicationController
  # GET /creditos
  # GET /creditos.json
  def index
    @creditos = Credito.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @creditos }
    end
  end

  # GET /creditos/1
  # GET /creditos/1.json
  def show
    @credito = Credito.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @credito }
    end
  end

  # GET /creditos/new
  # GET /creditos/new.json
  def new
    @credito = Credito.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @credito }
    end
  end

  # GET /creditos/1/edit
  def edit
    @credito = Credito.find(params[:id])
  end

  # POST /creditos
  # POST /creditos.json
  def create
    @credito = Credito.new(params[:credito])

    respond_to do |format|
      if @credito.save
        format.html { redirect_to @credito, notice: 'Credito was successfully created.' }
        format.json { render json: @credito, status: :created, location: @credito }
      else
        format.html { render action: "new" }
        format.json { render json: @credito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /creditos/1
  # PUT /creditos/1.json
  def update
    @credito = Credito.find(params[:id])

    respond_to do |format|
      if @credito.update_attributes(params[:credito])
        format.html { redirect_to @credito, notice: 'Credito was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @credito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creditos/1
  # DELETE /creditos/1.json
  def destroy
    @credito = Credito.find(params[:id])
    @credito.destroy

    respond_to do |format|
      format.html { redirect_to creditos_url }
      format.json { head :no_content }
    end
  end
end
