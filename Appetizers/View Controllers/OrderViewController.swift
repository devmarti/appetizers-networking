//
//  OrderViewController.swift
//  Appetizers
//
//  Created by APPS2T on 10/12/21.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var ordersButton: UIButton!
    @IBOutlet weak var orderLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "📝 Order"
        self.tabBarItem.title = "Order"
        tableview.dataSource = self
        tableview.delegate = self
        tableview.tableFooterView = UIView(frame: .zero)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewLoadData()
        tableview.reloadData()
    }
    
    func viewLoadData(){
        var totalPrice: Double = 0.0
        if AppData.shared.order.isEmpty {
            orderLabel.isHidden = false
            orderImage.isHidden = false
            tableview.isHidden = true
            ordersButton.isHidden = true
            
        }
        else{
            orderLabel.isHidden = true
            orderImage.isHidden = true
            tableview.isHidden = false
            ordersButton.isHidden = false
            
        }
        
        for i in 0..<AppData.shared.order.count {
            totalPrice += AppData.shared.order[i].price
            
        }
        ordersButton.setTitle("$\(totalPrice) - Place Order", for: .normal)
        ordersButton.layer.cornerRadius = 10
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.shared.order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCellId", for: indexPath) as? AppetizersCell {
            cell.appetizer = AppData.shared.order[indexPath.row]
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableview: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableview.beginUpdates()
            AppData.shared.order.remove(at: indexPath.row)
            tableview.deleteRows(at: [indexPath], with: .fade)
            tableview.endUpdates()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            viewLoadData()
        }
        
    }
    
}


    

    
    
   



