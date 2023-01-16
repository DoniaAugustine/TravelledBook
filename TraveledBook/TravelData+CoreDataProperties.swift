//
//  TravelData+CoreDataProperties.swift
//  TraveledBook
//
//  Created by Deep shah on 2022-09-14.
//
//

import Foundation
import CoreData


extension TravelData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TravelData> {
        return NSFetchRequest<TravelData>(entityName: "TravelData")
    }

    @NSManaged public var destinationName: String?
    @NSManaged public var destLatitude: Double
    @NSManaged public var destLongitude: Double
    @NSManaged public var images: Data?
    @NSManaged public var videoLink: String?

}

extension TravelData : Identifiable {

}
