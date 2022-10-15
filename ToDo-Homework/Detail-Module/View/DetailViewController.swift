//
//  DetailViewController.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var presenter: ViewToPresenterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailRouter.createModule(viewController: self)
    }


    @IBAction func updateButtonTapped(_ sender: Any) {
    }
}
