class CreateCreditos < ActiveRecord::Migration
  def change
    create_table :creditos do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
