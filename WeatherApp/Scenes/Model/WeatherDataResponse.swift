// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherDataResponse = try? newJSONDecoder().decode(WeatherDataResponse.self, from: jsonData)

import Foundation

// MARK: - WeatherDataResponse
class WeatherDataResponse: Codable {
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let daily: [Daily]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case daily
    }

    init(lat: Double?, lon: Double?, timezone: String?, timezoneOffset: Int?, daily: [Daily]?) {
        self.lat = lat
        self.lon = lon
        self.timezone = timezone
        self.timezoneOffset = timezoneOffset
        self.daily = daily
    }
}
typealias Dailyy = [Daily]
// MARK: - Daily
class Daily: Codable{
    let dt, sunrise, sunset, moonrise: Int?
    let moonset: Int?
    let moonPhase: Double?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [Weather]?
    let clouds: Int?
    let pop, uvi, rain, snow: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi, rain, snow
    }

    init(dt: Int?, sunrise: Int?, sunset: Int?, moonrise: Int?, moonset: Int?, moonPhase: Double?, temp: Temp?, feelsLike: FeelsLike?, pressure: Int?, humidity: Int?, dewPoint: Double?, windSpeed: Double?, windDeg: Int?, windGust: Double?, weather: [Weather]?, clouds: Int?, pop: Double?, uvi: Double?, rain: Double?, snow: Double?) {
        self.dt = dt
        self.sunrise = sunrise
        self.sunset = sunset
        self.moonrise = moonrise
        self.moonset = moonset
        self.moonPhase = moonPhase
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.dewPoint = dewPoint
        self.windSpeed = windSpeed
        self.windDeg = windDeg
        self.windGust = windGust
        self.weather = weather
        self.clouds = clouds
        self.pop = pop
        self.uvi = uvi
        self.rain = rain
        self.snow = snow
    }
}

// MARK: - FeelsLike
class FeelsLike: Codable {
    let day, night, eve, morn: Double?

    init(day: Double?, night: Double?, eve: Double?, morn: Double?) {
        self.day = day
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}

// MARK: - Temp
class Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?

    init(day: Double?, min: Double?, max: Double?, night: Double?, eve: Double?, morn: Double?) {
        self.day = day
        self.min = min
        self.max = max
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}

// MARK: - Weather
class Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }

    init(id: Int?, main: String?, weatherDescription: String?, icon: String?) {
        self.id = id
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
}
