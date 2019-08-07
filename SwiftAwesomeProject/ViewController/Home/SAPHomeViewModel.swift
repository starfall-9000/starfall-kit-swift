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
    
    func getListItem() -> [SAPHomeModel] {
        return [
            SAPHomeModel(withTitle: "MVVM Examples", desc: "Examples about different ways to use base classes Page, ListPage and CollectionPage."),
            SAPHomeModel(withTitle: "Data Binding Examples", desc: "Examples about how to use data binding."),
            SAPHomeModel(withTitle: "Service Injection Examples", desc: "Examples about how to create a service and register it; how to inject to our ViewModel."),
            SAPHomeModel(withTitle: "Transition Examples", desc: "Examples about how to create a custom transitioning animation and apply it."),
        ]
    }
}
