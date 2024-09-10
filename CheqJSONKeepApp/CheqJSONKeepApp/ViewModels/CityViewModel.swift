//
//  ViewModel.swift
//  CheqJSONKeepApp
//
//  Created by Purnachandra on 09/09/24.
//

import Foundation

class CityViewModel {

    var cityData:Dynamic<CityData> = Dynamic(CityData(data: []))
    var apiFetchError:Dynamic<Error?> = Dynamic(nil)
    let reachability:Reachability = Reachability()
    
    private var cityListService: CityBaseService!
    
    init(cityListService: CityBaseService?) {
        self.cityListService = cityListService
    }
    
    func fetchCitiesList() async -> (CityData?,Error?) {
        
        if self.reachability.isConnectedToNetwork() {
            
            let (result,error) = await cityListService.getCitisList()
            return (result,error)
        }
        return (nil,NSError(domain: "Network is not reachable", code: 500))
    }
    
    func getNumberOfCities() -> Int {
        return cityData.value.data.count
    }
    
    func getCity(index:NSInteger) -> City {
        return cityData.value.data[index]
    }
}

