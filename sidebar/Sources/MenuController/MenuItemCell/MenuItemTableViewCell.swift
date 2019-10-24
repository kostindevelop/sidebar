//
//  MenuItemTableViewCell.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 24.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak private var menuItemImage: UIImageView!
    @IBOutlet weak private var menuItemLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuredCell(for indexPath: IndexPath) {
        var image = UIImage()
        switch indexPath.row {
        case 0:
            image = #imageLiteral(resourceName: "usersIcon")
            menuItemLabel.text = "Users"
        case 1:
            image = #imageLiteral(resourceName: "listIcon")
            menuItemLabel.text = "List"
        case 2:
            image = #imageLiteral(resourceName: "settingsIcon")
            menuItemLabel.text = "Settings"
        default:
            break
        }
        menuItemImage.image = image
    }

}
