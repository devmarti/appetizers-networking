//
//  DetailViewController.swift
//  Appetizers
//
//  Created by APPS2T on 13/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var detailCalories: UILabel!
    @IBOutlet weak var detailCarbs: UILabel!
    @IBOutlet weak var detailProtein: UILabel!
    @IBOutlet weak var adddOrderButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    var appetizerImage: UIImage?
    var appetizer: Appetizer?
    
    
    
    override func viewDidLoad() {
        
        
        guard let appetizer = appetizer else { return }
        self.detailName.text = appetizer.name
        self.detailDescription.text = appetizer.description
        self.detailCalories.text = "\(appetizer.calories)"
        self.detailCarbs.text = "\(appetizer.carbs) g"
        self.detailProtein.text = "\(appetizer.protein) g"
        self.detailCarbs.textColor = UIColor.gray
        self.detailCalories.textColor = UIColor.gray
        self.detailProtein.textColor = UIColor.gray
        adddOrderButton.layer.cornerRadius = 10
        adddOrderButton.setTitle("$\(appetizer.price) - Add To Order", for: .normal)
        loadImage()
            
    }
           
    
    func loadImage(){
        
        NetworkManager.shared.getImage(appetizerImageUrl:  appetizer?.imageURL ?? "") {
            appetizerImage in
            DispatchQueue.main.async {
                self.detailImage.image = appetizerImage
                
            }
        
        }
    }
    @IBAction func closeDetail(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addAppetizers(_ sender: Any) {
        guard let appetizer = appetizer else { return }
        AppData.shared.order.append(appetizer)
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
}




