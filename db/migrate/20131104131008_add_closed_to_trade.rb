class AddClosedToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :closed, :boolean, default: false, null: false
  end
end
