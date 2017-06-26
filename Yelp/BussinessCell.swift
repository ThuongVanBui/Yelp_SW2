//
//  BussinessCell.swift
//  Yelp
//
//  Created by Lon on 6/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

class BussinessCell: UITableViewCell {

    
    
    @IBOutlet weak var bussinessView: UIImageView!
    @IBOutlet weak var toprateImageView: UIImageView!
    @IBOutlet weak var catagoryLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var numberreviewLabel: UILabel!
    @IBOutlet weak var namebussinessLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    var bussiness: Business!{
        didSet{
            bussinessView.setImageWith(bussiness.imageURL!)
            toprateImageView.setImageWith(bussiness.ratingImageURL!)
            catagoryLabel.text = bussiness.categories
            adressLabel.text = bussiness.address
            numberreviewLabel.text = "\(bussiness.reviewCount!) Reviews"
            distanceLabel.text = bussiness.distance
            namebussinessLabel.text = bussiness.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        bussinessView.layer.cornerRadius = 3
        bussinessView.clipsToBounds = true
        
        namebussinessLabel.preferredMaxLayoutWidth = namebussinessLabel.frame.size.width
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
