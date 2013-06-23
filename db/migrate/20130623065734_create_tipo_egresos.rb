class CreateTipoEgresos < ActiveRecord::Migration
  def change
    create_table :tipo_egresos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
