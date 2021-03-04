//
//  UserListTableViewCell.swift
//  HW-USERDATA
//
//  Created by yulin on 2021/2/23.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
 
    
    @IBOutlet weak var userPicThumbnail: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAge: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
