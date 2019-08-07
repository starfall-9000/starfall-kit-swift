//
//  HomeViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/6/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import RxCocoa

class HomeViewModel: ListViewModel<HomeModel, HomeCellViewModel> {
    let rxPageTitle = BehaviorRelay(value: "")
    
    override func react() {
        super.react()
        self.rxPageTitle.accept("Home")
        
        let listItem = getListItem()
        self.itemsSource.append(listItem.toCellViewModels())
    }
    
    func getListItem() -> [HomeModel] {
        return [
            HomeModel(withTitle: "MVVM Examples", desc: "Examples about different ways to use base classes Page, ListPage and CollectionPage."),
            HomeModel(withTitle: "Data Binding Examples", desc: "Examples about how to use data binding."),
            HomeModel(withTitle: "Service Injection Examples", desc: "Examples about how to create a service and register it; how to inject to our ViewModel."),
            HomeModel(withTitle: "Transition Examples", desc: "Examples about how to create a custom transitioning animation and apply it."),
        ]
    }
}
