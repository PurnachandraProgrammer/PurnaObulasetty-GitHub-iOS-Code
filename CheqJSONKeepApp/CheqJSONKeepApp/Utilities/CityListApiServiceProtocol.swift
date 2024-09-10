//
//  CityListApiServiceProtocol.swift
//  CheqJSONKeepApp
//
//  Created by Purnachandra on 09/09/24.
//

import Foundation

protocol CityBaseService {
    func getCitisList() async  -> (CityData?,Error?)
}

// PlanetApiResourceService protocol for Apiresource
protocol CityApiResourceService : CityBaseService {

}

