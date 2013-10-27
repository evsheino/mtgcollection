class AddFoilToOwnedCard < ActiveRecord::Migration
  def change
    add_column :owned_cards, :foil, :boolean
  end
end
