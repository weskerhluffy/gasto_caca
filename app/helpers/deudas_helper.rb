module DeudasHelper
  def join_extensiones(deuda)
    deuda.extensiones_deuda.map { |extension_deuda| extension_deuda.descripcion }.join(", ")
  end
end
