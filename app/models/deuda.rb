class Deuda < ActiveRecord::Base
  belongs_to :credito
  belongs_to :deuda_original, :foreign_key => 'deuda_original_id', :class_name => "Deuda"
  attr_accessible :contraido, :descripcion, :monto, :credito_id, :deuda_original_id
  has_and_belongs_to_many :egresos
  has_many :aplicacion_periodicas
# XXX: http://stackoverflow.com/questions/1163032/rails-has-many-with-alias-name
  has_many :extensiones_deuda, :foreign_key => 'deuda_original_id', :class_name => "Deuda"
end
