class RenameOwnedCardExpansionCardIdToPrintingId < ActiveRecord::Migration
  def change
    rename_column :owned_cards, :expansion_card_id, :printing_id
  end
end
