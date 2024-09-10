//
//  CityListTableViewCell.swift
//  CheqJSONKeepApp
//
//  Created by Purnachandra on 09/09/24.
//

import UIKit

class CityListTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var industriesListStackView: UIStackView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
