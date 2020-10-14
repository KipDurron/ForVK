//
//  UserGroupsController.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class UserGroupsController: UITableViewController {
    
    var dbGroupService = RGroupService()
    var userGroups: [Group] = []
    var groupService = GroupService()

    override func viewDidLoad() {
        super.viewDidLoad()
        groupService.getGroupUser(idUser: Session.instance.userId){userGroups in
            self.dbGroupService.saveAll(vkObjectList: userGroups)
            self.userGroups = self.dbGroupService.load()
            self.tableView.reloadData()
        }

        
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
        if segue.identifier == "addGroup" {
        // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let allGroupController = segue.source as? AllGroupController else { return }
        // Получаем индекс выделенной ячейки
            if let indexPath = allGroupController.tableView.indexPathForSelectedRow {
        // Получаем город по индексу
                let group = allGroupController.allGroups[indexPath.row]
        // Проверяем, что такого города нет в списке
                if !self.userGroups.contains(where: { $0.name == group.name }) {
        // Добавляем город в список выбранных
                    self.userGroups.append(group)
        // Обновляем таблицу
                    tableView.reloadData()
                }
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
        return self.userGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! GroupsCell
        let currentGroup = self.userGroups[indexPath.row]
        cell.name.text = currentGroup.name
        UIImage.load(from: currentGroup.avatarUrl) {image in
            cell.avatar.image = image
        }
        

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

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
        // Удаляем город из массива
            self.userGroups.remove(at: indexPath.row)
        // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }

    }
    

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
