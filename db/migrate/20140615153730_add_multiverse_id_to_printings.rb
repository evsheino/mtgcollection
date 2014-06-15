class AddMultiverseIdToPrintings < ActiveRecord::Migration
  def change
    add_column :printings, :multiverse_id, :integer
  end
end
