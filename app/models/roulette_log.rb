class RouletteLog < ActiveRecord::Base
    has_many :player_logs

    validates :roulette_round, presence: true
    validates :roulette_bet, presence: true
end
