//
//  ContactCell.swift
//  LastDz2session
//
//  Created by Руслан Мотин on 09.02.2022.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
