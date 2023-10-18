//
//  ViewController.swift
//  NotebookCoreData
//
//  Created by Mommo Sadeghi on 12/10/23.
//

import UIKit
import CoreData


protocol NoteDetailDelegate: AnyObject {
    func didAddNewNote(noteID: Int, noteTitle: String, noteDescription: String)
}



class NoteDetailViewController: UIViewController {
    
    
    var noteList: [NoteCoreData] = []
    var selectedNote: NoteCoreData?
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    weak var noteDetailDelegate: NoteDetailDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedNote != nil {
            titleTextField.text = selectedNote?.title_
            descriptionTextView.text = selectedNote?.description_
        }
    }
    
    @IBAction func SaveNoteButtonTapped(_ sender: UIButton) {
        
        
        guard let newNoteTitle = titleTextField.text else { return }
        guard let newNoteDescription = descriptionTextView.text else { return }
        noteDetailDelegate?.didAddNewNote(noteID: 1, noteTitle: newNoteTitle, noteDescription: newNoteDescription)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "NoteCoreData", in: context) else { return }
        
        let newNote = NoteCoreData(id_: 1, title_: newNoteTitle, description_: newNoteDescription, deletedDate_: Date(timeIntervalSinceNow: 1), context: context)
        do {
            try context.save()
            navigationController?.popViewController(animated: true )
        } catch {
            print("Context save error")
        }
        
        
        navigationController?.popViewController(animated: true )
        print("\(newNoteTitle) and \(newNoteDescription)")
    }
    
}


