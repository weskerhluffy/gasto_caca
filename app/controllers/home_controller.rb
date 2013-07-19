class HomeController < ApplicationController
  def index
    @totales=[]
    @totales_disponibles=[]
    @totales_egresos=[]
    @totales=QuerysComplejos.totales
    @totales_disponibles= QuerysComplejos.totales_disponibles
    @totales_egresos= QuerysComplejos.totales_egresos
    @totales_banco=QuerysComplejos.totales_banco
  end
end
