//
//  Note.swift
//  NotebookCoreData
//
//  Created by Mommo Sadeghi on 12/10/23.
//

import CoreData



@objc(NoteCoreData)

class NoteCoreData: NSManagedObject {
    
    @NSManaged var id_: NSNumber
    @NSManaged var title_: String
    @NSManaged var description_: String
    @NSManaged var deletedDate_: Date
    
    init(id_: NSNumber, title_: String, description_: String, deletedDate_: Date, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "NoteCoreData", in: context)
        super.init(entity: entity!, insertInto: context)
        
        self.id_ = id_
        self.title_ = title_
        self.description_ = description_
        self.deletedDate_ = deletedDate_
    }
}
