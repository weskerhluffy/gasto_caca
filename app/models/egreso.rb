class Egreso < ActiveRecord::Base
  belongs_to :tipo_egreso
  belongs_to :tipo_ingreso
  belongs_to :aplicacion_periodica
  attr_accessible :aplicacion, :descripcion, :monto, :tipo_egreso_id, :deuda_ids, :aplicacion_periodica_ids, :tipo_ingreso_id
  has_and_belongs_to_many :deudas
  has_many :ingresos
  has_many :aplicacion_periodicas
  
end
