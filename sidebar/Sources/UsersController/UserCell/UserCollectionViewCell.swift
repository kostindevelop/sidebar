//
//  UserCollectionViewCell.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 24.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var userImage: CacheImageView!
    @IBOutlet weak private var userName: UILabel!
    @IBOutlet weak private var userCreateDate: UILabel!
    
    
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configuredCellInterface()
    }
    
    func configuredCell(with userModelElement: UserModelElement) {
        guard let imageUrl = userModelElement.image else { return }
        userImage.downloadImage(from: imageUrl, activity: activityIndicator)
        userName.text = userModelElement.name
        userCreateDate.text = convertedDate(with: userModelElement.time ?? "")
    }
    
    private func convertedDate(with timeString: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeString)!)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.timeZone = .current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.dateFormat = "dd-MMM-yyyy HH:mm"
        let timeStamp = dateFormatter.string(from: date)
        return timeStamp
        
    }
    
    private func configuredCellInterface() {
        contentView.layer.cornerRadius = 7
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
    }

}
