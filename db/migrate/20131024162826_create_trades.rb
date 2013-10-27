class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :user_id
      t.string :partner
      t.date :date

      t.timestamps
    end
  end
end
