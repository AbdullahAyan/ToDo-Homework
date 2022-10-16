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
    
    var tasks = [Task]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        copyDatabase()
        
        MainRouter.createModule(viewController: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainPresenter?.showTasks()
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "Add"))!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "toDo", ofType: ".sqlite")!
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destinationPath).appendingPathExtension("toDo.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: copyPath.path) {
            
        }else {
            do {
                try fileManager.copyItem(atPath: bundlePath, toPath: copyPath.path)
            }catch {
                
            }
        }
    }
    
}

extension MainViewController: PresenterToViewMainProtocol {
    func sendDataToView(tasks: Array<Task>) {
        self.tasks = tasks
        self.tableView.reloadData()
    }
    
    
}






//MARK: - SearchBar Delegate

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            mainPresenter?.showTasks()
        }else {
            mainPresenter?.searchTask(searchText: searchText)
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
        cell.label.text = tasks[indexPath.row].yapilacak_is
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
            let task = self.tasks[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(task.yapilacak_is) silinsin mi?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.mainPresenter?.deleteTask(yapilacak_id: task.yapilacak_id)
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        tableView.reloadData()
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
