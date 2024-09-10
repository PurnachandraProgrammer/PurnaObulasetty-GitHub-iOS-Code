//
//  City.swift
//  CheqJSONKeepApp
//
//  Created by Purnachandra on 09/09/24.
//

import Foundation

// MARK: - Welcome
struct CityData: Codable {
    let data: [City]
}

// MARK: - Datum
struct City: Codable {
    let cityName, country: String
    let population: Int
    let latitude, longitude: Double
    let timezone: String
    let touristAttractions, interestingFacts: [String]
    let economy: Economy

    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case country, population, latitude, longitude, timezone
        case touristAttractions = "tourist_attractions"
        case interestingFacts = "interesting_facts"
        case economy
    }
}

// MARK: - Economy
struct Economy: Codable {
    let majorIndustries: [String]
    let gdp, unemploymentRate: String

    enum CodingKeys: String, CodingKey {
        case majorIndustries = "major_industries"
        case gdp = "GDP"
        case unemploymentRate = "unemployment_rate"
    }
}
