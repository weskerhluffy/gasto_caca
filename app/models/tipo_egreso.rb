class TipoEgreso < ActiveRecord::Base
  AHORRO=6
  attr_accessible :descripcion
  has_many :egresos
end
