//
//  AppetizersCell.swift
//  Appetizers
//
//  Created by APPS2T on 13/12/21.
//

import UIKit

class AppetizersCell: UITableViewCell {
    

    
    @IBOutlet weak var appetizerImage: UIImageView!
    @IBOutlet weak var appetizerPrice: UILabel!
    @IBOutlet weak var appetizerName: UILabel!
    var appetizerFront: UIImage?
    
    
    var appetizer: Appetizer? {
        didSet { renderUI()  }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        appetizerImage?.layer.cornerRadius = 6
        self.appetizerImage.image = nil
    }
    
    private func renderUI() {
        guard let appetizer = appetizer else {return}
        appetizerName.text = appetizer.name
        appetizerPrice.text = "$\(appetizer.price)"
        appetizerPrice.textColor = UIColor.gray
        loadImage()
        
    }
    
    func loadImage(){
        NetworkManager.shared.getImage(appetizerImageUrl: appetizer?.imageURL ?? "") {
            appetizerFront in
            DispatchQueue.main.async {
                self.appetizerImage.image = appetizerFront
                
            }
        
        }
    }

}
    
    

