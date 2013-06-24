class CreatePeriodos < ActiveRecord::Migration
  def change
    create_table :periodos do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
