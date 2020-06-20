//
//  FriendsController.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class FriendsController: UITableViewController {
    
    var friends: [User] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let friend1 = User(name: "Vasy", avatar: UIImage(systemName: "calendar"),
        photos: [UIImage(systemName: "calendar"),
                 UIImage(systemName: "calendar"),
                 UIImage(systemName: "trash"),
                 UIImage(systemName: "trash")])
        let friend2 = User(name: "Ilya", avatar: UIImage(systemName: "paperplane"),
                           photos: [UIImage(systemName: "pencil"),
                                    UIImage(systemName: "person"),
                                    UIImage(systemName: "trash"),
                                    UIImage(systemName: "paperplane")])
        let friend3 = User()
        friends.append(friend1)
        friends.append(friend2)
        friends.append(friend3)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PhotosController
        {
            let photosController = segue.destination as? PhotosController
            // Получаем индекс выделенной ячейки
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    photosController?.photos = friends[indexPath.row].photos
                    }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        let currentFriend = self.friends[indexPath.row]
        cell.avatar.image = currentFriend.avatar
        cell.name.text = currentFriend.name
        // Configure the cell...

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
