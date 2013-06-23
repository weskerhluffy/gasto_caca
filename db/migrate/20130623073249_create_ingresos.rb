class CreateIngresos < ActiveRecord::Migration
  def change
    create_table :ingresos do |t|
      t.text :descripcion
      t.timestamp :aplicacion
      t.decimal :monto

      t.timestamps
    end
  end
end
