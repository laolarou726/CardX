//
//  WeatherCardViewModel.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/3/2.
//

import Foundation
import Alamofire
import MapKit
import CoreLocation

extension WeatherCard{
    class WeatherCardViewModel : NSObject, ObservableObject, CLLocationManagerDelegate{
        fileprivate final let API_KEY = "fcfc88146a5fd0a390552926e2ea6f24"
        fileprivate let locationManager = CLLocationManager()
        
        fileprivate var lastLat: Double = 0
        fileprivate var lastLon: Double = 0
        
        @Published private(set) var weatherIconUrl: String! = "https://openweathermap.org/img/wn/01n@2x.png"
        @Published private(set) var weatherType: WeatherTypes! = .Sunny
        @Published private(set) var weather: String! = "-"
        @Published private(set) var weatherDescription: String! = "-"
        @Published private(set) var location: String! = "UNKNOWN LOCATION"
        @Published private(set) var feelLikeTemp: Double! = 0
        @Published private(set) var minTemp: Double! = 0
        @Published private(set) var maxTemp: Double! = 0
        @Published private(set) var windSpeed: Double! = 0
        @Published private(set) var humidity: Double! = 0
        
        override init() {
            super.init()
            // Ask for Authorisation from the User.
            self.locationManager.requestAlwaysAuthorization()

            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()

            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
            }
        }
        
        func refreshData(){
            
        }
        
        fileprivate func refreshWeather(lat: Double, lon: Double){
            let reqUrl = "https://api.openweathermap.org/data/2.5/weather?lat=\(Int(lat))&lon=\(Int(lon))&units=metric&appid=\(API_KEY)"
            
            AF.request(reqUrl).responseData{
                response in
                
                if(response.error != nil || response.response?.statusCode != 200)
                {
                    return
                }
                
                if let res = response.data{
                    let str = String(data: res, encoding: .utf8)
                    let result = WeatherResponseModel.deserialize(from: str)
                    if (result != nil){
                        self.location = result!.name ?? "UNKNOWN LOCATION"
                        
                        if let weather = result!.weather?[0]{
                            self.weather = weather.main ?? "-"
                            self.weatherDescription = weather.description ?? "-"
                            self.weatherType = WeatherHelper.getWeatherType(type: weather.main)
                            
                            if let iconId = weather.icon{
                                self.weatherIconUrl = "https://openweathermap.org/img/wn/\(iconId)@2x.png"
                            }
                        }
                        
                        if let main = result!.main{
                            self.feelLikeTemp = main.feels_like ?? 0
                            self.minTemp = main.temp_min ?? 0
                            self.maxTemp = main.temp_max ?? 0
                            self.humidity = main.humidity ?? 0
                        }
                        
                        if let wind = result!.wind{
                            self.windSpeed = wind.speed ?? 0
                        }
                    }
                }
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
                if let error = error as? CLError {
                    // Location updates are not authorized.
                    locationManager.stopUpdatingLocation()
                    debugPrint("xxx!!!")
                    debugPrint(error.localizedDescription)
                    return
                }
                // Notify the user of any errors.
            }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let locValue = locations.last else { return }
            
            let newLat = locValue.coordinate.latitude.magnitude
            let newLon = locValue.coordinate.longitude.magnitude
            
            if(lastLat == newLat && lastLon == newLon) {
                return
            }
                
            refreshWeather(lat: newLat, lon: newLon)
                
            lastLat = newLat
            lastLon = newLon
        }
    }
}
