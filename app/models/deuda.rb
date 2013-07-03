class Deuda < ActiveRecord::Base
  belongs_to :credito
  attr_accessible :contraido, :descripcion, :monto, :credito_id
  has_and_belongs_to_many :egresos
  has_many :aplicacion_periodicas
end
