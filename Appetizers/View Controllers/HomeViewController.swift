//
//  ViewController.swift
//  Appetizers
//
//  Created by APPS2T on 10/12/21.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var tableview: UITableView!
    var request: Request?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "🍟 Appetizers"
        self.tabBarItem.title = "Home"
        
        tableview.delegate = self
        tableview.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        
        tableview.isHidden = true
        NetworkManager.shared.getAppetizer {
            request in
            
            DispatchQueue.main.async {
                self.request = request
                self.tableview.isHidden = false
                self.tableview.reloadData()
            }
        }
    }
    
    @objc func loadList(){
        if let appetizerLoad = tabBarController?.tabBar.items {
            let tabBarItems = appetizerLoad[2]
                if AppData.shared.order.count == 0 {
                        tabBarItems.badgeValue = nil

                } else {

                    tabBarItems.badgeValue = String (AppData.shared.order.count)
                    
                }
        }

            self.tableview.reloadData()

        }

    // MARK: - UITableView delegate & data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return request?.request.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "AppetizerCellId", for: indexPath) as! AppetizersCell
        cell.appetizer = request?.request[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: request?.request[indexPath.row])
        tableview.deselectRow(at: indexPath, animated: true)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let detail = segue.destination as? DetailViewController, let request = sender as? Appetizer {
                detail.appetizer = request
            }
        }
    }
    
    
}
        
 


    
   



    

    

    
    
    


