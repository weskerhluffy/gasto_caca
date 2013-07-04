class CreateIngresos < ActiveRecord::Migration
  def change
    create_table :ingresos do |t|
      t.text :descripcion
      t.timestamp :aplicacion
      t.decimal :monto, :precision => 10, :scale => 4
      t.references :tipo_ingreso

      t.timestamps
    end
    add_index :ingresos, :tipo_ingreso_id
  end
end
