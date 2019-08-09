//
//  SAPContactEditViewControllerr.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/9/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

class SAPContactEditViewControllerr: Page<SAPContactEditViewModel> {
    let scrollView = ScrollLayout()
    let containerView = UIView()
    
    let nameTxt = UITextField()
    let phoneTxt = UITextField()
    let submitBtn = UIButton(type: .custom)
    let cancelBtn = UIButton(type: .custom)
    
    override func initialize() {
        title = "Add/Edit Contact"
        
        enableBackButton = true
        self.view.addSubview(self.scrollView)
        self.scrollView.autoPin(toTopLayoutOf: self)
        self.scrollView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        
        self.nameTxt.borderStyle = .roundedRect
        self.nameTxt.placeholder = "Enter your name"
        
        self.phoneTxt.borderStyle = .roundedRect
        self.phoneTxt.placeholder = "Enter your phone number"
        
        self.cancelBtn.setTitle("Cancel", for: .normal)
        self.cancelBtn.setTitleColor(.white, for: .normal)
        self.cancelBtn.setBackgroundImage(UIImage.from(color: .red), for: .normal)
        self.cancelBtn.contentEdgeInsets = .symmetric(horizontal: 10, vertical: 5)
        self.cancelBtn.cornerRadius = 5
        
        self.submitBtn.setTitle("Save", for: .normal)
        self.submitBtn.setTitleColor(.white, for: .normal)
        self.submitBtn.setTitleColor(.lightGray, for: .disabled)
        self.submitBtn.setBackgroundImage(UIImage.from(color: .blue), for: .normal)
        self.submitBtn.setBackgroundImage(UIImage.from(color: .gray), for: .disabled)
        self.submitBtn.contentEdgeInsets = .symmetric(horizontal: 10, vertical: 5)
        self.submitBtn.cornerRadius = 5
        
        let buttonLayout = StackLayout().justifyContent(.fillEqually).spacing(10).children([
                self.cancelBtn,
                self.submitBtn
            ])
        self.scrollView.paddings = .all(10)
        self.scrollView.appendChildren([
                StackSpaceItem(height: 40),
                self.nameTxt,
                StackSpaceItem(height: 20),
                self.phoneTxt,
                StackSpaceItem(height: 20),
                buttonLayout
            ])
    }
    
    override func bindViewAndViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        viewModel.rxName <~> self.nameTxt.rx.text => disposeBag
        viewModel.rxPhone <~> self.phoneTxt.rx.text => disposeBag
        
        self.cancelBtn.rx.bind(to: viewModel.cancelAction, input: ())
        self.submitBtn.rx.bind(to: viewModel.saveAction, input: ())
    }
    
    override func onBack() {
        self.navigationService.pop(with: PopOptions(popType: .dismissPopup))
    }
}
