class Credito < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :deudas
end
