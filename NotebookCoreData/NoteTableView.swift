//
//  NoteTableView.swift
//  NotebookCoreData
//
//  Created by Mommo Sadeghi on 12/10/23.
//

import UIKit
import CoreData


var noteList = [Note]()


class NoteTableView: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    
    
}
