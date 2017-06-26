

//
//  DealCell.swift
//  Yelp
//
//  Created by Lon on 6/26/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit
protocol DealCellDelegate {
    func dealCellDelegate(dealCell: DealCell, didValueChange value:Bool)
}
class DealCell: UITableViewCell {

    @IBOutlet weak var dealSwitch: UISwitch!
    @IBOutlet weak var dealLabel: UILabel!
    
    var delegate: DealCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onDeal(_ sender: UISwitch) {
        delegate.dealCellDelegate(dealCell: self, didValueChange: dealSwitch.isOn)
    }

}
