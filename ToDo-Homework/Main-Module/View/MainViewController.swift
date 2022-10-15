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
    var tempTasks = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        MainRouter.createModule(viewController: self)
        
        mainPresenter?.showTask()
        tempTasks = tasks
        
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "Add"))!
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
        
        if searchText == "" {
            
            tasks = tempTasks
            
        }else {
            
            tasks.removeAll()
            
            for task in tempTasks {
                if task.lowercased().contains(searchText.lowercased()) {
                    tasks.append(task)
                }
            }
            
        }
        
        self.tableView.reloadData()

        
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
