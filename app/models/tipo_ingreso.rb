class TipoIngreso < ActiveRecord::Base
  BANCO=1
  PRESTAMO=4
  AHORRO=5
  attr_accessible :descripcion
  has_many :ingresos
  has_many :egresos
end
