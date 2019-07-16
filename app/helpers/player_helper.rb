module PlayerHelper
    def self.gain_by_color
        return {
            green: 15,
            red: 2,
            black: 2
        }
    end

    # Check player roulette result
    def self.get_roulette_result(player, player_bet, player_color, roulette_color)
        if player_color == roulette_color
          gain = player_bet*gain_by_color[roulette_color]
          puts "#{I18n.t(:player, scope: :roulette)} #{player.name} #{I18n.t(:has_won, scope: :roulette)} #{gain}"
          return gain
        else
          return 0
        end
    end
end
