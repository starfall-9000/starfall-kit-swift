//
//  SAPContactViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/8/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import Action

class SAPContactViewModel: ListViewModel<Model, SAPContactCellViewModel> {
    lazy var addAction: Action<Void, Void> = {
        return Action() { .just(self.add()) }
    }()
    
    private func add() {
        handleContactModification()
    }
    
    private func handleContactModification(_ model: SAPContactModel? = nil) {
        let viewModel = SAPContactEditViewModel(model: model)
        let viewController = SAPContactEditViewControllerr(viewModel: viewModel)
        
        let navVC = SAPPopupWrapperNavigationViewController(rootViewController: viewController)
        self.navigationService.push(to: navVC, options: PushOptions(pushType: .popup(.defaultOptions)))
    }
}
