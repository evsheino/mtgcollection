class CreateOwnedCards < ActiveRecord::Migration
  def change
    create_table :owned_cards do |t|
      t.integer :printing_id
      t.integer :user_id
      t.integer :number

      t.timestamps
    end
  end
end
