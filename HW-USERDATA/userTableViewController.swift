//
//  userTableViewController.swift
//  HW-USERDATA
//
//  Created by yulin on 2021/3/4.
//

import Kingfisher
import UIKit

class userTableViewController: UITableViewController {

    
    
    var userInfos = [ResultsType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: "https://randomuser.me/api/?results=10"){
            
            URLSession.shared.dataTask(with: url) {[self] (data, response, error) in
                
                let decorder = JSONDecoder()
                
                if let data = data{
                    
                    do{
                        
                        let results = try decorder.decode(UserinfosArry.self, from: data)
                       
                        self.userInfos = results.results
                        
                        DispatchQueue.main.async {
                            
                            self.tableView.reloadData()
                            
                        }
                        
                
                        
                        
                    }catch{
                        print (error)
                        print(String(data: data, encoding: .utf8)!)
                        print (userInfos)
                        
                        
                    }
                    
                    
                }
                
                
            }.resume()
            
            
        }
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 132, height: 32))
        imageView.contentMode = .scaleAspectFit
            let image = UIImage(named: "Logo.png")
            imageView.image = image
            navigationItem.titleView = imageView
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userInfos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        
        let userinfo = userInfos[indexPath.row]
        cell.userName.text = "\(userinfo.name.first)\(userinfo.name.last)"
        cell.userAge.text = "Age: \(userinfo.registered.age)"
        cell.userPicThumbnail.kf.setImage(with: userinfo.picture.thumbnail)
        cell.userPicThumbnail.layer.cornerRadius = cell.userPicThumbnail.frame.width/2

        return cell

    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
