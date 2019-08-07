//
//  SAPHomeViewController.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/6/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

class SAPHomeViewController: ListPage<SAPHomeViewModel> {
    override func initialize() {
        super.initialize()
        
        self.tableView.register(SAPHomeCell.self, forCellReuseIdentifier: SAPHomeCell.identifier)
    }
    
    override func bindViewAndViewModel() {
        super.bindViewAndViewModel()
        
        guard let viewModel = self.viewModel else { return }
        viewModel.rxPageTitle ~> self.rx.title => disposeBag
    }
    
    override func cellIdentifier(_ cellViewModel: SAPHomeCellViewModel) -> String {
        return SAPHomeCell.identifier
    }
}
