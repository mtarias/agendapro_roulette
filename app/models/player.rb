class Player < ActiveRecord::Base
    validates :name, presence: true

    MIN_PERCENTAGE_RAIN = GlobalVariables::PercentageByBet::MinPercentageRain
    MAX_PERCENTAGE_RAIN = GlobalVariables::PercentageByBet::MaxPercentageRain
    MIN_PERCENTAGE = GlobalVariables::PercentageByBet::MinPercentage
    MAX_PERCENTAGE = GlobalVariables::PercentageByBet::MaxPercentage

    def get_money_bet(is_rain=false)
        if money <= 1000
            return money        
        elsif is_rain
            percentage_bet = rand(MIN_PERCENTAGE_RAIN..MAX_PERCENTAGE_RAIN)/100.to_f
            return (money*percentage_bet).to_i
        else
            percentage_bet = rand(MIN_PERCENTAGE..MAX_PERCENTAGE)/100.to_f
            return (money*percentage_bet).to_i
        end
    end
end
