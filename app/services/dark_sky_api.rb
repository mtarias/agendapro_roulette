module DarkSkyApi

    API_TOKEN = "f5de17d8f50bb689f6fb4de6e22b65bf"
    LATITUDE = -33.442855
    LONGITUDE = -70.650296
    API_URL = "https://api.darksky.net/forecast/#{API_TOKEN}/#{LATITUDE},#{LONGITUDE}?exclude=currently,minutely,hourly,alerts"

    def self.get_rain_data()
        data = get_weather_data()

        if !data.nil?
            if data["daily"]["data"].map{|day| day["icon"]}.include?("rain")
                return true
            end
        end
        return false
        
    end
    
    def self.get_weather_data()
        res = RestClient.get(API_URL, headers={})

        if [200, 201].include?(res.code)
            res_body = JSON.parse(res.body)
            return res_body
        else
            return nil
        end
    end
end