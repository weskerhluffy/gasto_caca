class CreateEgresos < ActiveRecord::Migration
  def change
    create_table :egresos do |t|
      t.text :descripcion
      t.timestamp :aplicacion
      t.decimal :monto, :precision => 10, :scale => 4
      t.references :tipo_egreso
      t.references :aplicacion_periodica
      t.references :tipo_ingreso

      t.timestamps
    end
    add_index :egresos, :tipo_egreso_id
    add_index :egresos, :aplicacion_periodica_id
    add_index :egresos, :tipo_ingreso_id
  end
end
