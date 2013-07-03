class Ingreso < ActiveRecord::Base
  belongs_to :tipo_ingreso
  belongs_to :egreso
  attr_accessible :aplicacion, :descripcion, :monto,:tipo_ingreso_id, :egreso_id
end
