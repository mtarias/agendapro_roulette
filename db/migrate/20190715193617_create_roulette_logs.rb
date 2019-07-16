class CreateRouletteLogs < ActiveRecord::Migration
  def change
    create_table :roulette_logs do |t|
      t.string :roulette_round
      t.string :roulette_bet

      t.timestamps null: false
    end
  end
end
