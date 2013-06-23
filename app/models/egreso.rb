class Egreso < ActiveRecord::Base
  belongs_to :tipo_egreso
  attr_accessible :aplicacion, :descripcion, :monto, :tipo_egreso_id
  has_and_belongs_to_many :deuda
end
