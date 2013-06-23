module EgresosHelper
  def join_deudas(egreso)
    egreso.deudas.map { |t| t.descripcion }.join(", ")
  end
end
