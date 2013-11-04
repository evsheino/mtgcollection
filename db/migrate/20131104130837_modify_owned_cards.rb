class ModifyOwnedCards < ActiveRecord::Migration
  def change
    change_column :owned_cards, :foil, :boolean, default: false, null: false
    add_column :owned_cards, :altered, :boolean, default: false, null: false
    add_column :owned_cards, :signed, :boolean, default: false, null: false
  end
end
