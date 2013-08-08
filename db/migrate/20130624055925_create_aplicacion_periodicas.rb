class CreateAplicacionPeriodicas < ActiveRecord::Migration
  def change
    create_table :aplicacion_periodicas do |t|
      t.references :periodo
      t.references :deuda
      t.references :tipo_egreso
      t.references :tipo_ingreso
      t.decimal :monto, :precision => 10, :scale => 4
      t.text :descripcion

      t.timestamps
    end
    add_index :aplicacion_periodicas, :periodo_id
    add_index :aplicacion_periodicas, :deuda_id
    add_index :aplicacion_periodicas, :tipo_egreso_id
    add_index :aplicacion_periodicas, :tipo_ingreso_id
  end
end
