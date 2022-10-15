//
//  ViewController.swift
//  ToDo-Homework
//
//  Created by Abdullah Ayan on 15.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var mainPresenter: ViewToPresenterMainProtocol?
    
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        MainRouter.createModule(viewController: self)
        
        mainPresenter?.showTask()
        
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "AddTask"))!
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MainViewController: PresenterToViewMainProtocol {
    func sendDataToView(tasks: Array<String>) {
        self.tasks = tasks
    }
    
    
}






//MARK: - SearchBar Delegate

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

//MARK: - TableView Delegate

extension MainViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.label.text = tasks[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
