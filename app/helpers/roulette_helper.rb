module RouletteHelper

  RED_MIN_PERCENTAGE = GlobalVariables::RoulettePercentage::RedMinPercentage
  RED_MAX_PERCENTAGE = GlobalVariables::RoulettePercentage::RedMaxPercentage
  BLACK_MIN_PERCENTAGE = GlobalVariables::RoulettePercentage::BlackMinPercentage
  BLACK_MAX_PERCENTAGE = GlobalVariables::RoulettePercentage::BlackMaxPercentage
  GREEN_MIN_PERCENTAGE = GlobalVariables::RoulettePercentage::GreenMinPercentage
  GREEN_MAX_PERCENTAGE = GlobalVariables::RoulettePercentage::GreenMaxPercentage

    def self.get_random_color()
        case rand(100) + 1
          when RED_MIN_PERCENTAGE..RED_MAX_PERCENTAGE     then :red
          when BLACK_MIN_PERCENTAGE..BLACK_MAX_PERCENTAGE then :black
          when GREEN_MIN_PERCENTAGE..GREEN_MAX_PERCENTAGE then :green
        end
    end

end