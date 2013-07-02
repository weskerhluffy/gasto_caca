class TipoIngreso < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :ingresos
  has_many :egresos
end
