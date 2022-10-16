//
//  DetailViewController.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var task = Task(yapilacak_id: "", yapilacak_is: "")
    
    @IBOutlet weak var textField: UITextField!
    
    var presenter: ViewToPresenterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = task.yapilacak_is
        DetailRouter.createModule(viewController: self)
    }


    @IBAction func updateButtonTapped(_ sender: Any) {
        
        presenter?.updateTask(yapilacak_id: task.yapilacak_id, yapilacak_is: textField.text!)
    }
}
