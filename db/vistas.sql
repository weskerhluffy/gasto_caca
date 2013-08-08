create view restante_deudas
as
select
d.*,
d.monto
-
(
select sum(e.monto)
from egresos e
join 
deudas_egresos de
on (e.id=de.egreso_id)
where de.deuda_id=d.id
) as restante
from deudas d;

create view egresos_aplicados
as
select *
from egresos e
where e.aplicacion is not null;