//
//  PhotosController.swift
//  ForVK
//
//  Created by Илья Кадыров on 20.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit
import RealmSwift


class PhotosController: UIViewController {
    
    var collectionView: UICollectionView?
    
    let cellId = "PhotoCell"
    
    var photos: Results<RPhoto>?
    var token: NotificationToken?

    override func loadView() {
        super.loadView()
        let layout = UICollectionViewFlowLayout()
        layout.sectionInsetReference = .fromSafeArea
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let widthCell = self.view.bounds.size.width / 1.2

        layout.itemSize = CGSize(width: widthCell, height: widthCell)

        self.collectionView =  UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        self.collectionView?.backgroundColor = .white
        self.view = self.collectionView
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Фотографии"
        self.collectionView?.register(PhotosCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView?.dataSource = self;
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       
        // Do any additional setup after loading the view.
        
    }

    func setToken() {
        self.token = photos!.observe { [weak self] (changes: RealmCollectionChange) in
                    guard let collectionView = self?.collectionView else { return }
                    switch changes {
                    case .initial:
                        collectionView.reloadData()
                    case .update(_, let deletions, let insertions, let modifications):
                        collectionView.reloadData()
                    case .error(let error):
                        fatalError("\(error)")

                    }
        }
    }
    

}



extension PhotosController:  UICollectionViewDataSource {
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.photos?.count ?? 0
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PhotosCell
        cell.likeControl.countLikes = self.photos![indexPath.row].countLike
        UIImage.load(from: self.photos![indexPath.row].url) {image in
            cell.photo.image = image
        }
//        cell.photo.image = self.photos[indexPath.row]
    
        return cell
    }
}
