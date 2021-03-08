//
//  userTableViewController.swift
//  HW-USERDATA
//
//  Created by yulin on 2021/3/4.
//

import Kingfisher
import UIKit

class userTableViewController: UITableViewController, UISearchResultsUpdating {
   
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text!
        
        filterUserResult = userInfos.filter({ (user) -> Bool in
            return user.name.first == searchText || user.name.last == searchText
        })
        
        tableView.reloadData()
        
        
        
    }
    
    
    var userInfos = [ResultsType]()
    var filterUserResult = [ResultsType]()
    
    var userSearchBarController: UISearchController?
    var hidesSearchBarWhenScrolling : Bool?
    
    func settingSearchController(){
        
        userSearchBarController = UISearchController(searchResultsController:nil) //去實例化 UISearchController，而我們回傳 nil，代表我們搜尋的結果會顯示於我們正在搜尋的 ViewController 上。
        userSearchBarController!.searchResultsUpdater = self
        //告知 SearchController，究竟是哪一個物件會負責更新我們搜尋的結果。
        userSearchBarController?.obscuresBackgroundDuringPresentation = false
        
        navigationItem.searchController = userSearchBarController
        //Navigation Bar 上加上 Search Bar
        
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        getData()
        
        settingSearchController()
        
        
        
    
        
        
        
        
    }
    
    func getData() {
        
        
        if let url = URL(string: "https://randomuser.me/api/?results=10"){
            
            URLSession.shared.dataTask(with: url) {[self] (data, response, error) in
                
                let decorder = JSONDecoder()
                
                if let data = data{
                    
                    do{
                        
                        let results = try decorder.decode(UserinfosArry.self, from: data)
                        
                        self.userInfos = results.results
                        
                        userInfos.sort { (use1, use2) -> Bool in
                            return use1.name.first < use2.name.first
                        }
                        
                        
                        
                        DispatchQueue.main.async {
                            
                            self.tableView.reloadData()
                            refreshControl?.endRefreshing()
                        
                        }
                        
                        
                        
                        
                        
                        
                    }catch{
                        print (error)
                        
                        print(String(data: data, encoding: .utf8)!)
                        print (userInfos)
                        
                        
                    }
                    
                    
                } else {
                    
                    
                    DispatchQueue.main.async {
                        
                        
                        
                        
                        let controller =  UIAlertController(title: "網路錯誤", message: "請重新連線", preferredStyle: .alert)
                        
                        let action = UIAlertAction(title: "豪", style: .default) { (UIAlertAction) in
                            getData()
                        }
                        controller.addAction(action)
                        present(controller, animated: true) {
                        }
                    }
                    
                    
                    
                }
                
                
            }.resume()
            
            
            
            
            
           
            
        }
        //        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        //        self.navigationController?.navigationBar.shadowImage = UIImage()
        //        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 132, height: 32))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "Logo.png")
        imageView.image = image
        navigationItem.titleView = imageView
        
        
    }
    
    // MARK: - Table view data source
    
    @IBAction func refreshData(_ sender: UIRefreshControl) {

        getData()

        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      
        var userinfoCount = userInfos.count
        if userSearchBarController?.isActive == true {
            userinfoCount = filterUserResult.count
        }
        return userinfoCount
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        
        var userinfo = userInfos[indexPath.row]
        if userSearchBarController?.isActive == true {
            userinfo = filterUserResult[indexPath.row]
        }else{
            
        }
        
        cell.userName.text = "\(userinfo.name.first)\(userinfo.name.last)"
        cell.userAge.text = "Age: \(userinfo.registered.age)"
        cell.userPicThumbnail.kf.setImage(with: userinfo.picture.thumbnail)
        cell.userPicThumbnail.layer.cornerRadius = cell.userPicThumbnail.frame.width/2
        return cell
        
        
    }
    
    @IBSegueAction func sendData(_ coder: NSCoder) -> UserDetailViewController? {
        
        let controller = UserDetailViewController(coder: coder)
        controller?.userInfo = userInfos[tableView.indexPathForSelectedRow!.row]
        
        return controller
        
    }
    
    
    

    
    
    
    //        let controller = UserDetailViewController()
    //
    //        controller.userInfo = userInfos[tableView.indexPathForSelectedRow!.row]
    //        print("\(controller.userInfo)")
    //
    //        return controller
    
    
    
    
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
