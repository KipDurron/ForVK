//
//  NewsViewController.swift
//  ForVK
//
//  Created by Илья Кадыров on 19.09.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {

    let newsPhotoCellId = "NewsPhotoCell"
    let newsPostCellId = "NewsPostCell"
    
    var news: [News] = []
    var newsService = NewsService()
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Новости"
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(NewsPostCell.self, forCellReuseIdentifier: newsPostCellId)
        self.tableView.register(NewsPhotoCell.self, forCellReuseIdentifier: newsPhotoCellId)
        newsService.getNews() {news in
            self.news = news
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = news[indexPath.row]
        if currentCell.type == "photo" || currentCell.type == "wall_photo" {
         let cell = tableView.dequeueReusableCell(withIdentifier: newsPhotoCellId, for: indexPath) as! NewsPhotoCell
            cell.configure(item: currentCell as! PhotoNews, dateFormatter: dateFormatter)
            return cell
        } else {
           let cell = tableView.dequeueReusableCell(withIdentifier: newsPostCellId, for: indexPath) as! NewsPostCell
            cell.configure(item: currentCell as! PostNews, dateFormatter: dateFormatter)
            return cell
        }
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        let currentCell = news[indexPath.row]
////        if currentCell.type == "photo" || currentCell.type == "wall_photo"{
////            return 510;
////        } else {
////            return 320
////        }
//        return self.view.bounds.size.width / 1.2
//    }

}
