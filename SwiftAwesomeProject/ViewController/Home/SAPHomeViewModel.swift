//
//  SAPHomeViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/6/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import RxCocoa

class SAPHomeViewModel: ListViewModel<SAPHomeModel, SAPHomeCellViewModel> {
    let rxPageTitle = BehaviorRelay(value: "")
    
    override func react() {
        super.react()
        self.rxPageTitle.accept("Home")
        
        let listItem = getListItem()
        self.itemsSource.append(listItem.toCellViewModels())
    }
    
    override func selectedItemDidChange(_ cellViewModel: SAPHomeCellViewModel) {
        if let page = pageToNavigate(cellViewModel) {
            self.navigationService.push(to: page, options: .defaultOptions)
        }
    }
    
    func getListItem() -> [SAPHomeModel] {
        return [
            SAPHomeModel(withTitle: "Contact List Example", desc: "Example about creating contact list by MVVM and rxSwift"),
            SAPHomeModel(withTitle: "Search List Example", desc: "Example about searching image by MVVM and rxSwift")
        ]
    }
    
    func pageToNavigate(_ cellViewModel: SAPHomeCellViewModel) -> UIViewController? {
        guard let indexPath = self.rxSelectedIndex.value else { return nil }
        
        var page: UIViewController?
        switch indexPath.row {
        case 0:
            let viewModel = SAPContactViewModel(model: cellViewModel.model)
            page = SAPContactViewController(viewModel: viewModel)
        case 1:
            let viewModel = SAPSearchListViewModel(model: cellViewModel.model)
            page = SAPSearchListViewController(viewModel: viewModel)
            
        default: ()
        }
        
        return page
    }
}
