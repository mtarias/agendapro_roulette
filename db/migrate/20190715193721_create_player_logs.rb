class CreatePlayerLogs < ActiveRecord::Migration
  def change
    create_table :player_logs do |t|
      t.string :player_name
      t.integer :player_money_bet
      t.string :player_color_bet
      t.belongs_to :roulette_log

      t.timestamps null: false
    end
  end
end
