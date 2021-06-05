//
//  RequestType.swift
//  Weather
//
//  Created by Гнатюк Сергей on 05.06.2021.
//

import Foundation
import CoreLocation

enum RequestType {
    case cityName(city: String)
    case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
}
