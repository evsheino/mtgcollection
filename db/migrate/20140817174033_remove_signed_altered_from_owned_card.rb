class RemoveSignedAlteredFromOwnedCard < ActiveRecord::Migration
  def change
    remove_column :owned_cards, :signed, :boolean
    remove_column :owned_cards, :altered, :boolean
  end
end
