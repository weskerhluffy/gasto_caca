class Deuda < ActiveRecord::Base
  belongs_to :credito
  attr_accessible :contraido, :monto, :credito_id
  has_and_belongs_to_many :egreso
end
