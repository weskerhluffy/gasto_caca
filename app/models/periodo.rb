class Periodo < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :aplicacion_periodicas
end
