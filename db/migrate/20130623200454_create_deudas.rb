class CreateDeudas < ActiveRecord::Migration
  def change
    create_table :deudas do |t|
      t.decimal :monto
      t.timestamp :contraido
      t.references :credito

      t.timestamps
    end
    add_index :deudas, :credito_id
  end
end
