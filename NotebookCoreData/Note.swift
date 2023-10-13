//
//  Note.swift
//  NotebookCoreData
//
//  Created by Mommo Sadeghi on 12/10/23.
//

import CoreData



@objc(Note)
class Note: NSManagedObject {
    
    @NSManaged var id_: NSNumber!
    @NSManaged var title_: String!
    @NSManaged var description_: String!
    @NSManaged var deletedDate_: Date!
}
