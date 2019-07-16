module PlayerHelper
    def self.gain_by_color
        return {
            green: 15,
            red: 2,
            black: 2
        }
    end

    def self.get_roulette_result(player, player_bet, player_color, roulette_color)
        if player_color == roulette_color
          gain = player_bet*gain_by_color[roulette_color]
          puts "JUGADOR #{player.name} HA GANADO #{gain}"
          return gain
        else
          return 0
        end
    end
end
