//
//  Contact+CoreDataProperties.swift
//  KleverChallenger
//
//  Created by Helio Junior on 28/07/21.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var cellphone: String?
    @NSManaged public var isFavorite: Bool

}

extension Contact : Identifiable {

}
