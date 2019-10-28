//
//  UserCollectionCell.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 28.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class UserCollectionCell: UICollectionViewCell {

    @IBOutlet weak private var userImage: CacheImageView!
    @IBOutlet weak private var userName: UILabel!
    @IBOutlet weak private var userDate: UILabel!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    
     override func awakeFromNib() {
           super.awakeFromNib()
           configuredUI()
       }
       
       func setupCell(_ userModelElement: UserModelElement) {
           userImage.downloadImage(from: userModelElement.image ?? "", activity: activityIndicator)
           userName.text = userModelElement.name
           userDate.text = userModelElement.time?.convertedTimeIntervalToStringDate()
           
       }
       
       private func configuredUI() {
           contentView.layer.cornerRadius = 10
           contentView.layer.borderColor = UIColor.clear.cgColor
           contentView.layer.masksToBounds = true
           layer.shadowColor = UIColor.black.cgColor
           layer.shadowOffset = CGSize(width: 0, height: 0.5)
           layer.shadowRadius = 6.0
           layer.shadowOpacity = 0.1
           layer.masksToBounds = false
       }

}
