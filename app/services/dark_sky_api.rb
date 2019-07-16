module DarkSkyApi

    API_TOKEN = Rails.application.secrets.dark_sky_token
    LATITUDE = GlobalVariables::DarkSkyData::Latitude
    LONGITUDE = GlobalVariables::DarkSkyData::Longitude
    
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