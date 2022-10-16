//
//  AddInteractor.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class DetailInteractor: PresenterToInteractorDetailProtocol {
    
    let db: FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destinationPath).appendingPathExtension("toDo.sqlite")
        db = FMDatabase(path: copyPath.path)
    }
    
    func updateTask(yapilacak_id: String,yapilacak_is: String) {
        
        db?.open()
        do{
            try db!.executeUpdate("UPDATE tasks SET yapilacak_is = ? WHERE yapilacak_id = ?", values: [yapilacak_is,yapilacak_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
}
