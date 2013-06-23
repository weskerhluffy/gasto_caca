class TipoIngreso < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :ingresos
end
