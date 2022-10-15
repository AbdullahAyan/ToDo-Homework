//
//  DetailViewController.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var task = ""
    
    @IBOutlet weak var textField: UITextField!
    
    var presenter: ViewToPresenterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = task
        DetailRouter.createModule(viewController: self)
    }


    @IBAction func updateButtonTapped(_ sender: Any) {
    }
}
