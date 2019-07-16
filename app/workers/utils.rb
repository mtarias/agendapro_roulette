module Utils
  extend self
  include PlayersHelper

  def get_random_color()
      case rand(100) + 1
        when  1..49   then :red
        when 50..98   then :black
        when 99..100  then :green
      end
  end

  def get_roulette_result(player, player_bet, player_color, roulette_color)
    if player_color == roulette_color
      gain = player_bet*gain_by_color[roulette_color]
      puts "JUGADOR #{player.name} HA GANADO #{gain}"
      return gain
    else
      return 0
    end
  end
end