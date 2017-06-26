//
//  FiltersCell.swift
//  Yelp
//
//  Created by Lon on 6/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit
protocol FiltersCellDelegate {
    func filterCell(filterCell: FiltersCell,  didValueChange value: Bool)
}


class FiltersCell: UITableViewCell {

    @IBOutlet weak var namecatagoryLabel: UILabel!
    @IBOutlet weak var searchSwitch: UISwitch!
    
    
    var delegate: FiltersCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onSearch(_ sender: UISwitch) {
        print(sender.isOn)
        delegate.filterCell(filterCell: self, didValueChange: sender.isOn)
    }
}
