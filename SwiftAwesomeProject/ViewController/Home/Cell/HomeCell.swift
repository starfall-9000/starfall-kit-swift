//
//  HomeCell.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/6/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

class HomeCell: TableCell<HomeCellViewModel> {
    let titleLabel = UILabel()
    let descLabel = UILabel()
    
    override func initialize() {
        super.initialize()
        
        self.titleLabel.numberOfLines = 0
        self.titleLabel.font = Font.system.bold(withSize: 17)
        
        self.descLabel.numberOfLines = 0
        self.descLabel.font = Font.system.normal(withSize: 15)
        
        let layout = StackLayout().direction(.vertical).children([
                titleLabel,
                descLabel
            ])
        contentView.addSubview(layout)
        layout.autoPinEdgesToSuperviewEdges(with: .all(5))
        self.accessoryType = .disclosureIndicator
    }
    
    override func bindViewAndViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        viewModel.rxTitle ~> self.titleLabel.rx.text => disposeBag
        viewModel.rxDesc ~> self.descLabel.rx.text => disposeBag
    }
}
