class RenameExpansionCardToPrinting < ActiveRecord::Migration
  def change
    rename_table :expansion_cards, :printings
  end
end
