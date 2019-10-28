//
//  DetailUserController.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 28.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class DetailUserController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var usersModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuredUI()
        registerCell()
    }
    
    private func configuredUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: "UserCollectionCell", bundle: nil), forCellWithReuseIdentifier: "UserCollectionCell")
    }
}


// MARK: - UICollectionViewDataSource

extension DetailUserController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionCell", for: indexPath) as? UserCollectionCell else { return UICollectionViewCell() }
//        let userElement = usersModel?[indexPath.item]
//        
//        userCell.setupCell(userElement!)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        cell.backgroundColor = .blue
              
        return cell
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension DetailUserController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 20)
    }
}



// MARK: - UICollectionViewDelegate

extension DetailUserController: UICollectionViewDelegate {}
