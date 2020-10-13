//
//  FriendsController.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class FriendsController: UITableViewController, UISearchResultsUpdating{

    var allFriend: [User] = []
    var searchController: UISearchController!
    var searchFriend: [User] = []
    var friendService = FriendService()
    var photoService = PhotoService()
    var dbUserService = RUserService()!
    var dbPhotoService = RPhotoService()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        friendService.loadAllFriendData(idUser: Session.instance.userId) { allFriend in
            allFriend.forEach({ friend in
                self.dbUserService.save(vkObject: friend)
            })
            self.allFriend = self.dbUserService.load()
            self.tableView.reloadData()
        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PhotosController
        {
            let photosController = segue.destination as? PhotosController
            // Получаем индекс выделенной ячейки
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    photoService.getAllphotoUser(idUser: self.allFriend[indexPath.row].id) { allPhoto in
                        allPhoto.forEach({ photo in
                            self.dbPhotoService.save(vkObject: photo)
                        })
                        photosController?.photos = self.dbPhotoService.load()
                        photosController?.collectionView.reloadData()
                        }
                    }
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filtrBySearch(textSearch: searchText)
            tableView.reloadData()
        }
    }
    
    func filtrBySearch(textSearch: String) {
        searchFriend = allFriend.filter({
            (friend: User) -> Bool in
            if friend.name.lowercased().range(of:textSearch.lowercased()) != nil {
                return true
            } else {
                return false
            }
        })
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive {
            return searchFriend.count
        } else {
            return allFriend.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        let currentFriend = (searchController.isActive) ? self.searchFriend[indexPath.row] : self.allFriend[indexPath.row]
        UIImage.load(from: currentFriend.avatarUrl) {image in
            cell.avatarView.avatarImage = image
        }
        
        cell.name?.text = currentFriend.name
        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

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
