class CreateExpansionCards < ActiveRecord::Migration
  def change
    create_table :expansion_cards do |t|
      t.integer :card_id
      t.integer :expansion_id

      t.timestamps
    end
  end
end
