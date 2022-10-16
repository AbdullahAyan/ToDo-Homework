//
//  AddTaskViewController.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var addPresenter: ViewToPresenterAddProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddRouter.createModule(viewController: self)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        addPresenter?.addTask(yapilacak_is: textField.text!)
    }
    


}
