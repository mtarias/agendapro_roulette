class PlayerLog < ActiveRecord::Base
    belongs_to :roulette_logs
    validates :player_name, presence: true
    validates :player_money_bet, presence: true
    validates :player_color_bet, presence: true
end
