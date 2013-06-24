class CreateAplicacionPeriodicas < ActiveRecord::Migration
  def change
    create_table :aplicacion_periodicas do |t|
      t.references :periodo
      t.decimal :monto
      t.text :descripcion

      t.timestamps
    end
    add_index :aplicacion_periodicas, :periodo_id
  end
end
