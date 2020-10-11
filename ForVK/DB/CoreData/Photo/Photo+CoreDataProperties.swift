//
//  Photo+CoreDataProperties.swift
//  ForVK
//
//  Created by Илья Кадыров on 04.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//
//

import Foundation
import CoreData


extension CDPhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPhoto> {
        return NSFetchRequest<CDPhoto>(entityName: "CDPhoto")
    }

    @NSManaged public var url: URL?
    @NSManaged public var countLike: Int64
    @NSManaged public var id: String

}

extension CDPhoto : Identifiable {

}
