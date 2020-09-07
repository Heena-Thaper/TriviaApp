//
//  GameDetail+CoreDataProperties.swift
//  Trivia App
//
//  Created by heena thapar on 06/09/20.
//  Copyright © 2020 heena thapar. All rights reserved.
//
//

import Foundation
import CoreData


extension GameDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameDetail> {
        return NSFetchRequest<GameDetail>(entityName: "GameDetail")
    }

    @NSManaged public var name: String?
    @NSManaged public var dateTime: String?
    @NSManaged public var answerOne: String?
    @NSManaged public var answerTwo: String?

}
