//
//  AddInteractor.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class AddInteractor: PresenterToInteractorAddProtocol {
    
    let db: FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destinationPath).appendingPathExtension("toDo.sqlite")
        db = FMDatabase(path: copyPath.path)
    }
    
    func addTask(yapilacak_is: String) {
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO tasks (yapilacak_is) VALUES (?)", values: [yapilacak_is])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
