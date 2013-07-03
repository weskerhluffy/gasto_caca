class AplicacionPeriodica < ActiveRecord::Base
  belongs_to :periodo
  belongs_to :deuda
  attr_accessible :descripcion, :monto, :periodo_id, :deuda_id
end
