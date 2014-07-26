class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :owner_id
      t.integer :borrower_id
      t.integer :owned_card_id
      t.integer :number
      t.string :note

      t.timestamps
    end
  end
end
