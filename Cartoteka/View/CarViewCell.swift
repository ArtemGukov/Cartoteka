//
//  TableViewCell.swift
//  Cartoteka
//
//  Created by Артем on 02/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit

class CarViewCell: UITableViewCell {
    
    @IBOutlet weak var labelModel: UILabel!    
    @IBOutlet weak var labelEngineType: UILabel!
    @IBOutlet weak var labelTransmissionType: UILabel!
    
    @IBOutlet weak var labelBodyType: UILabel!
    @IBOutlet weak var labelBodyColor: UILabel!
    
    @IBOutlet weak var imageLogo: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
