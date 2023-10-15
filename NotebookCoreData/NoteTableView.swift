//
//  NoteTableView.swift
//  NotebookCoreData
//
//  Created by Mommo Sadeghi on 12/10/23.
//

import UIKit
import CoreData


//var noteList = [Note]()


class NoteTableView: UITableViewController {
    
    var noteList = [Note]()
    var firstLoad = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        if firstLoad {
//            firstLoad = true
//        } else {
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
//            do {
//                let results = try context.fetch(request)
//                for result in results {
//                    guard let note = result as? Note else { return }
//                    noteList.append(note)
//                }
//            } catch  {
//                 print("Fetch failed!")
//            }
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    
}

extension NoteTableView {
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let noteCell = tableView.dequeueReusableCell(withIdentifier: "noteCellID", for: indexPath) as? NoteCell else { return UITableViewCell() }
        let theNote: Note!
        theNote = noteList[indexPath.row]
        noteCell.noteTitleLable.text = theNote.title_
        noteCell.noteDescriptionLable.text = theNote.description_
        return noteCell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editNote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editNote" {
            let indexPath = tableView.indexPathForSelectedRow
            let noteDetail = segue.destination as? NoteDetailViewController
            let selectedNote: Note
            selectedNote = noteList[indexPath?.row ?? 1]
            noteDetail?.selectedNote = selectedNote
            tableView.deselectRow(at: indexPath!, animated: true)
        }
    }
    
   
    
    
    
}
