class CreateTradedCards < ActiveRecord::Migration
  def change
    create_table :traded_cards do |t|
      t.integer :trade_id
      t.integer :printing_id
      t.boolean :foil
      t.integer :number

      t.timestamps
    end
  end
end
