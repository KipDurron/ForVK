//
//  Group+CoreDataProperties.swift
//  ForVK
//
//  Created by Илья Кадыров on 04.10.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//
//

import Foundation
import CoreData


extension CDGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDGroup> {
        return NSFetchRequest<CDGroup>(entityName: "CDGroup")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var avatarUrl: URL?

}

extension CDGroup : Identifiable {

}
