class TipoEgreso < ActiveRecord::Base
  attr_accessible :descripcion
  has_many :egresos
end
