//
//  ViewController.swift
//  NotebookCoreData
//
//  Created by Mommo Sadeghi on 12/10/23.
//

import UIKit
import CoreData

class NoteDetailViewController: UIViewController {


    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func SaveNoteButton(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Note", in: context) else { return }
        let newNote = Note(entity: entity, insertInto: context)
        newNote.id_ = noteList.count as NSNumber
        newNote.title_ = titleTextField.text
        newNote.description_ = descriptionTextView.text
        do {
            try context.save()
            noteList.append(newNote)
            navigationController?.popViewController(animated: true )
        } catch {
            print("Context save error")
        }
    }
    
}

