create view totales_deudas
as
select
d.*,
d.monto
+
ifnull(
    (
        select sum(ed.monto)
        from deudas ed
        where ed.deuda_original_id=d.id
    ),
    0
)
-
(
select sum(e.monto)
from egresos e
join 
deudas_egresos de
on (e.id=de.egreso_id)
where de.deuda_id=d.id
) as restante
from deudas d
where d.deuda_original_id is null;

create view egresos_aplicados
as
select *
from egresos e
where e.aplicacion is not null;