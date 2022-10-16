//
//  MainInteractor.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import Foundation

class MainInteractor: PresenterToInteractorMainProtocol {
    var mainPresenter: InteractorToPresenterMainProtocol?
    
    let db: FMDatabase?
    
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destinationPath).appendingPathExtension("toDo.sqlite")
        db = FMDatabase(path: copyPath.path)
    }
    
    func showTasks() {
        
        db?.open()
        
        var tasks = [Task]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM tasks", values: nil)
            
            while result.next() {
                let task = Task(yapilacak_id: (result.string(forColumn: "yapilacak_id"))!, yapilacak_is: (result.string(forColumn: "yapilacak_is"))!)
                tasks.append(task)
            }
            mainPresenter?.sendDataToPresenter(tasks: tasks)

        } catch let error {
            print(error.localizedDescription)
        }
        
        
        
        db?.close()
    }
    
    func deleteTask(yapilacak_id: String) {
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM tasks WHERE yapilacak_id = ?", values: [yapilacak_id])
            showTasks()
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func searchTask(searchText: String) {
        
        db?.open()
        
        var tasks = [Task]()

        do {
            let result = try db!.executeQuery("SELECT * FROM tasks WHERE yapilacak_is like '%\(searchText)%'", values: nil)
            
            while result.next() {
                let task = Task(yapilacak_id: (result.string(forColumn: "yapilacak_id"))!, yapilacak_is: (result.string(forColumn: "yapilacak_is"))!)
                tasks.append(task)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        
        mainPresenter?.sendDataToPresenter(tasks: tasks)

        db?.close()
    }
    
    
    
    
}
