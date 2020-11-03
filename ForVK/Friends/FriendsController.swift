//
//  FriendsController.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit
import RealmSwift

class FriendsController: UITableViewController, UISearchResultsUpdating{

    var allFriend: Results<RUser>?
    var token: NotificationToken?
    var searchController: UISearchController!
    var searchFriend: Results<RUser>?
    var friendService = FriendService()
    var photoService = PhotoService()
    var dbUserService = RUserService()
    var dbPhotoService = RPhotoService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        friendService.loadAllFriendData(idUser: Session.instance.userId) { allFriend in
            self.dbUserService.saveAll(vkObjectList: allFriend)
            self.allFriend = self.dbUserService.loadResult()
            self.setToken()
        }

    }
    
    private func setToken() {
        self.token = allFriend!.observe { [weak self] (changes: RealmCollectionChange) in
                    guard let tableView = self?.tableView else { return }
                    switch changes {
                    case .initial:
                        tableView.reloadData()
                    case .update(_, let deletions, let insertions, let modifications):
                        tableView.beginUpdates()
                        tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                             with: .automatic)
                        tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                             with: .automatic)
                        tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                             with: .automatic)
                        tableView.endUpdates()

                    case .error(let error):
                        fatalError("\(error)")

                    }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PhotosController
        {
            let photosController = segue.destination as? PhotosController
            // Получаем индекс выделенной ячейки
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    guard (self.allFriend != nil) else {
                        return
                    }
                    let userId = self.allFriend![indexPath.row].id ?? "0"
                    photoService.getAllphotoUser(idUser: userId) { allPhoto in
                        self.dbPhotoService.saveAll(vkObjectList: allPhoto)
                        photosController?.photos = self.dbPhotoService.loadResultByUser(userId: userId)
                        photosController?.setToken()
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
        guard (self.allFriend != nil) else {
            return
        }
        searchFriend = allFriend!.filter("name LIKE %@", "*\(textSearch)*")
     
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive {
            return searchFriend?.count ?? 0
        } else {
            return allFriend?.count ?? 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        let currentFriend = (searchController.isActive) ? self.searchFriend![indexPath.row] : self.allFriend![indexPath.row]
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
    
}
