class AddNoteToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :note, :text
  end
end
