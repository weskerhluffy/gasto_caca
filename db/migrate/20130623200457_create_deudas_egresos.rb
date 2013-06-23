class CreateDeudasEgresos < ActiveRecord::Migration
  def change
    create_table :deudas_egresos, :id => false do |t|
      t.integer :deuda_id
      t.integer :egreso_id
    end
#    add_index :deudas, :deuda_id
#    add_index :egresos, :egreso_id
  end
end
