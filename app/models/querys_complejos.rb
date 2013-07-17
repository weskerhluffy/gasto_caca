class QuerysComplejos < ActiveRecord::Base
  def self.my_query
    self.connection.execute("select * from egresos e join tipo_egresos te on (e.tipo_egreso_id=te.id) join tipo_ingresos ti on (e.tipo_ingreso_id=ti.id)")
  end
  def self.totales
    @totales=[]
    @totales_result=self.connection.execute("select (select sum(e.monto) 
from egresos e 
where month(e.aplicacion)=month(now())) as monto_ingresos,
(select sum(i.monto) 
from ingresos i
where month(i.aplicacion)=month(now())) as monto_egresos ,
(select sum(i.monto) 
from ingresos i
where month(i.aplicacion)=month(now()))-(select sum(e.monto) 
from egresos e 
where month(e.aplicacion)=month(now())) as monto_total")
    @totales_result.each do |total|
      @totales=total
    end
    return [@totales, ["Egresos","Ingresos","Balance"]]
  end
end