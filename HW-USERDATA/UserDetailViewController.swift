//
//  UserDetailViewController.swift
//  HW-USERDATA
//
//  Created by yulin on 2021/3/7.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var userGenderLable: UILabel!
    @IBOutlet weak var userAgeLable: UILabel!
    @IBOutlet weak var userCountryLable: UILabel!
    @IBOutlet weak var userEmailLable: UILabel!
    @IBOutlet weak var userPhoneLable: UILabel!
    @IBOutlet weak var userLocationLable: UILabel!
    
    
    var userInfo : ResultsType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userInfor = userInfo {
            
            userImage.kf.setImage(with: userInfor.picture.large)
            userNameLable.text = "\(userInfor.name.title)\(userInfor.name.first)\(userInfor.name.last)"
            userGenderLable.text = "\(userInfor.gender)"
            userAgeLable.text = "\(userInfor.registered.age)"
            userCountryLable.text = "\(userInfor.location.country)"
            userEmailLable.text = "\(userInfor.email)"
            userLocationLable.text = "\(userInfor.location.street)\(userInfor.location.state)\(userInfor.location.city)"
        
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
