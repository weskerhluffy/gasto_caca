class TotalesDeuda < ActiveRecord::Base

  belongs_to :credito
  has_and_belongs_to_many :egresos
  has_many :aplicacion_periodicas
  
  scope :activas, -> { 
    logger.debug("Fairy tail #{:credito_id}")
# XXX: http://stackoverflow.com/questions/14078422/rails-simple-number-between-conditions-query-in-controller
# XXX: http://stackoverflow.com/questions/11317662/rails-using-greater-than-less-than-with-a-where-statement
    where.not(:restante => 0).where(:restante => 0..Float::INFINITY)
  }
end
