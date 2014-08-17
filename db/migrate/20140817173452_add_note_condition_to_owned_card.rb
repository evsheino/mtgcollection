class AddNoteConditionToOwnedCard < ActiveRecord::Migration
  def change
    add_column :owned_cards, :condition, :string
    add_column :owned_cards, :note, :string
  end
end
