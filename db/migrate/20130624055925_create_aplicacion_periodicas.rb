class CreateAplicacionPeriodicas < ActiveRecord::Migration
  def change
    create_table :aplicacion_periodicas do |t|
      t.references :periodo
      t.references :deuda
      t.decimal :monto
      t.text :descripcion

      t.timestamps
    end
    add_index :aplicacion_periodicas, :periodo_id
    add_index :aplicacion_periodicas, :deuda_id
  end
end
