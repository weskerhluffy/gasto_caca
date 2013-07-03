# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Periodo.delete_all
Periodo.create([
        { descripcion: 'Dias' },
        { descripcion: 'Semanas' },
        { descripcion: 'Meses' },
        { descripcion: 'Años' }
])
TipoEgreso.delete_all
TipoEgreso.create([
        { descripcion: 'Transporte' },
        { descripcion: 'Comida' },
        { descripcion: 'Medico' },
        { descripcion: 'Escolar' },
        { descripcion: 'Miscelaneo' }
])
TipoIngreso.delete_all
TipoIngreso.create([
        { descripcion: 'Banco' },
        { descripcion: 'Efectivo' },
        { descripcion: 'Si vale' },
        { descripcion: 'Prestamo' }
])
Credito.delete_all
Credito.create([
        { descripcion: 'Tarjeta de credito banorte' },
        { descripcion: 'Carro' }
])
