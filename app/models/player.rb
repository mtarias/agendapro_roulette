class Player < ActiveRecord::Base
    validates :name, presence: true
    def get_money_bet(is_rain=false)
        if money <= 1000
            return money        
        elsif is_rain
            percentage_bet = rand(4.0..10.0)/100.to_f
            return (money*percentage_bet).to_i
        else
            percentage_bet = rand(8.0..15.0)/100.to_f
            return (money*percentage_bet).to_i
        end
    end
end
