class AplicacionPeriodica < ActiveRecord::Base
  belongs_to :periodo
  attr_accessible :descripcion, :monto, :periodo_id
end
