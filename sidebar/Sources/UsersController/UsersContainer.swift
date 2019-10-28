//
//  UsersContainer.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 24.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class UsersContainer: UIViewController {
    
    private let networker = Networker()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var usersModel = UserModel() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuredUI()
        registerCell()
        loadData()
    }
    
    private func configuredUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: "UsersCell", bundle: nil), forCellWithReuseIdentifier: "UsersCell")
    }
    
    private func loadData() {
        networker.loadUser { (userModel, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let users = userModel else { return }
            self.usersModel = users
        }
    }
    
    
}


// MARK: - UICollectionViewDataSource

extension UsersContainer: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersCell", for: indexPath) as? UsersCell else { return UICollectionViewCell() }
        let userElement = usersModel[indexPath.item]
        
        userCell.setupCell(userElement)
              
        return userCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            guard let detailUserController = storyboard?.instantiateViewController(identifier: "DetailUserController") as? DetailUserController else { return }
            detailUserController.usersModel = self.usersModel
            show(detailUserController, sender: nil)
        }
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout

extension UsersContainer: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width - 48
        return CGSize(width: width, height: 95)
    }
}

// MARK: - UICollectionViewDelegate

extension UsersContainer: UICollectionViewDelegate {}
