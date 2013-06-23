class CreateEgresos < ActiveRecord::Migration
  def change
    create_table :egresos do |t|
      t.text :descripcion
      t.timestamp :aplicacion
      t.decimal :monto
      t.references :tipo_egreso

      t.timestamps
    end
    add_index :egresos, :tipo_egreso_id
  end
end
