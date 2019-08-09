//
//  SAPPopupWrapperNavigationViewController.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/9/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

class SAPPopupWrapperNavigationViewController: NavigationPage {
    var widthConstraint: NSLayoutConstraint!
    var heightConstraint: NSLayoutConstraint!
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.adjustPopupSize()
        }, completion: nil)
    }
    
    private func adjustPopupSize() {
        guard let superview = self.view.superview else { return }
        if superview.bounds.height < self.heightConstraint.constant {
            self.heightConstraint.constant = superview.bounds.height - 20
        } else {
            self.heightConstraint.constant = 480
        }
        
        if superview.bounds.width < self.widthConstraint.constant {
            self.widthConstraint.constant = superview.bounds.width - 20
        } else {
            self.widthConstraint.constant = 320
        }
        
        self.view.layoutIfNeeded()
    }
}

extension SAPPopupWrapperNavigationViewController: IPopupView {
    func popupLayout() {
        self.view.cornerRadius = 7
        self.view.autoCenterInSuperview()
        self.widthConstraint = self.view.autoSetDimension(.width, toSize: 320)
        self.heightConstraint = self.view.autoSetDimension(.height, toSize: 480)
    }
    
    func show(overlayView: UIView) {
        self.adjustPopupSize()
        
        self.view.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.view.isHidden = false
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: { [weak self] in
            guard let `self` = self else { return }
            overlayView.alpha = 1
            self.view.transform = .identity
        }, completion: nil)
    }
    
    func hide(overlayView: UIView, completion: @escaping (() -> ())) {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            [weak self] in
            guard let `self` = self else { return }
            overlayView.alpha = 0
            self.view.alpha = 0
            self.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { _ in
            completion()
        }
    }
}
