require 'test_helper'
#require 'EgresosPeriodicos'

class EgresosPeriodicosTest < ActiveSupport::TestCase
  setup do
  end

  test "should cagar mensual" do
    EgresosPeriodicos.perform(AplicacionPeriodica::PERIODO_DIARIO)
    assert EgresosPeriodicos.generacion_exitosa
  end
  
  test "should fallar mensual" do
    assert_raises(RuntimeError) {EgresosPeriodicos.perform(-1)}
  end

end
