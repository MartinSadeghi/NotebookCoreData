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
    @NSManaged var title_: NSNumber!
    @NSManaged var description_: NSNumber!
    @NSManaged var deletedDate_: NSNumber!
}
