class CreatePagoDeudas < ActiveRecord::Migration
  def change
    create_table :pago_deudas, :id => false do |t|
      t.integer :deuda_id
      t.integer :egreso_id
    end
#    add_index :deudas, :deuda_id
#    add_index :egresos, :egreso_id
  end
end
