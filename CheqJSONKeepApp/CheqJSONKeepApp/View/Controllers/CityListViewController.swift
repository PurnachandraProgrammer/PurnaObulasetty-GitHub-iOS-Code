//
//  ViewController.swift
//  CheqJSONKeepApp
//
//  Created by Purnachandra on 09/09/24.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cityListTableView: UITableView! {
        
        didSet {
            cityListTableView.delegate = self
            cityListTableView.dataSource = self
            cityListTableView.tableFooterView = .init()
            cityListTableView.accessibilityIdentifier = "CitiesVCTableViewAccessID"
        }
    }
    
    var cityViewModel : CityViewModel = CityViewModel(cityListService: CityListApiService())

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    
    func configure() {
        
        self.cityListTableView.delegate = self
        self.cityListTableView.dataSource = self
        fetchCities()
    }
    
    func fetchCities() {

        Task {
             let (result,error) = await cityViewModel.fetchCitiesList()

            if let error = error {
                self.showAlert(for: (error as NSError))
                return
            }
            
            if let result = result {
                cityViewModel.cityData.value = result
                self.cityListTableView.reloadData()
            }
        }
    }
    
    func showAlert(for error: NSError) {
        
        let alert = UIAlertController(title: error.domain, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // Present the alert on the main thread
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension CityListViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityViewModel.getNumberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CityListTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CityListTableViewCell
        let object = cityViewModel.getCity(index: indexPath.row)
        
        cell.cityNameLabel.text = object.cityName
        cell.countryNameLabel.text = object.country
        
        for view in cell.industriesListStackView.subviews {
            view.removeFromSuperview()
        }
        
        for industryName in object.economy.majorIndustries {

            let label = UILabel()
            label.text = industryName
            label.textColor = .black
            
            cell.industriesListStackView.addArrangedSubview(label)

        }
        
        return cell
    }
}



