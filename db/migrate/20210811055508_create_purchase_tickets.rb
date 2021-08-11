class CreatePurchaseTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_tickets do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
