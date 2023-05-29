//
//  City.swift
//  Weather App
//
//  Created by Abdüssamed Söğüt on 27.05.2023.
//

import Foundation

class City: Codable {
    
    let id : Int
    let name: String
    let state: String
    let country: String
  //  let coord: Coordinate
    
    
    init(id: Int, name: String, state: String, country: String) {
        self.id = id
        self.name = name
        self.state = state
        self.country = country
   //     self.coord = coord
    }
}



