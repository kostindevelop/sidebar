//
//  HomeViewController.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 24.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class HomeViewController: BaseViewControlle {

    let transition = MenuAppearance()
    var topView = UIView()
    
    @IBOutlet weak private var usersView: UIView!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak private var settingsView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersView.isHidden = false
    }
    
    @IBAction func didTapMenuButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let menuViewController = storyboard.instantiateViewController(identifier: "MenuViewController") as? MenuTableViewController else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        menuViewController.didTapMenuType = { menuTappedType in
            self.presentingNewScreen(menuTappedType)
        }
        present(menuViewController, animated: true, completion: nil)
    }
    
    private func presentingNewScreen(_ menuType: MenuTappedType) {
        let titleController = String(describing: menuType).capitalized
        self.title = titleController
        topView.removeFromSuperview()
        switch menuType {
        case .users:
            usersView.isHidden = false
            listView.isHidden = true
            settingsView.isHidden = true
        case .list:
            usersView.isHidden = true
            listView.isHidden = false
            settingsView.isHidden = true
        case .settings:
            usersView.isHidden = true
            listView.isHidden = true
            settingsView.isHidden = false
        }
    }
}

@available(iOS 13.0, *)
extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
}
