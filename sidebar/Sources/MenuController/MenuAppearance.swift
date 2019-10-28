//
//  MenuAppearance.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 24.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import UIKit

class MenuAppearance: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresenting = false
    var backgroundView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.33
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from)
        else { return }
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.5
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            backgroundView.backgroundColor = .black
            backgroundView.alpha = 0.0
            containerView.addSubview(backgroundView)
            backgroundView.frame = containerView.bounds
            containerView.addSubview(toViewController.view)
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        
        let transform = {
            self.backgroundView.alpha = 0.4
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        let identity = {
            self.backgroundView.alpha = 0.0
            fromViewController.view.transform = .identity
        }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
    }
}
