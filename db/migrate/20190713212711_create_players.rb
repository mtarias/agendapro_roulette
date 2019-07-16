class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :money, default: 10000
      t.integer :current_bet

      t.timestamps null: false
    end
  end
end
