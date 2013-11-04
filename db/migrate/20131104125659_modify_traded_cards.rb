class ModifyTradedCards < ActiveRecord::Migration
  def change
    change_column :traded_cards, :foil, :boolean, default: false, null: false
    add_column :traded_cards, :signed, :boolean, default: false, null: false
    add_column :traded_cards, :altered, :boolean, default: false, null: false
  end
end
