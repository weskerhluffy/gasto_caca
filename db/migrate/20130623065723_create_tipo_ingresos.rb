class CreateTipoIngresos < ActiveRecord::Migration
  def change
    create_table :tipo_ingresos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
