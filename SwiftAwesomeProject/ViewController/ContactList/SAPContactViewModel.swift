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
    
    override func selectedItemDidChange(_ cellViewModel: SAPContactCellViewModel) {
        handleContactModification(cellViewModel.model)
    }
    
    private func add() {
        handleContactModification()
    }
    
    private func handleContactModification(_ model: SAPContactModel? = nil) {
        let viewModel = SAPContactEditViewModel(model: model)
        let viewController = SAPContactEditViewControllerr(viewModel: viewModel)
        
        viewModel.saveAction.executionObservables.switchLatest().subscribe(onNext: { [weak self] (contactModel) in
            guard let `self` = self else { return }
            if model == nil {
                let cvm = SAPContactCellViewModel(model: contactModel)
                self.itemsSource.append(cvm)
            } else if let cvm = self.rxSelectedItem.value {
                cvm.model = contactModel
            }
        }) => disposeBag
        
        let navVC = SAPPopupWrapperNavigationViewController(rootViewController: viewController)
        self.navigationService.push(to: navVC, options: PushOptions(pushType: .popup(.defaultOptions)))
    }
}
