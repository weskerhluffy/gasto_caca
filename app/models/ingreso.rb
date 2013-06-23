class Ingreso < ActiveRecord::Base
  belongs_to :tipo_ingreso
  attr_accessible :aplicacion, :descripcion, :monto,:tipo_ingreso_id
end
