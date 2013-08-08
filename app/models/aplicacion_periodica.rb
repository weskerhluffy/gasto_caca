class AplicacionPeriodica < ActiveRecord::Base
  PERIODO_DIARIO=1
  PERIODO_SEMANAL=2
  PERIODO_MENSUAL=3
  PERIODO_ANUAL=4
  belongs_to :periodo
  belongs_to :deuda
  belongs_to :tipo_egreso
  belongs_to :tipo_ingreso
  attr_accessible :descripcion, :monto, :periodo_id, :deuda_id,:tipo_egreso_id, :tipo_ingreso_id
end
