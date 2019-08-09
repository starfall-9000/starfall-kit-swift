//
//  SAPContactCell.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/8/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

class SAPContactCell: TableCell<SAPContactCellViewModel> {
    let avatarIV = UIImageView()
    let nameLbl = UILabel()
    let phoneLbl = UILabel()
    
    override func initialize() {
        self.avatarIV.image = UIImage(named: "default-contact")
        self.avatarIV.autoSetDimensions(to: CGSize(width: 64, height: 64))
        
        self.nameLbl.numberOfLines = 0
        self.nameLbl.font = Font.system.bold(withSize: 17)
        
        self.phoneLbl.numberOfLines = 0
        self.phoneLbl.font = Font.system.normal(withSize: 15)
        
        let infoLayout = StackLayout().spacing(8).direction(.vertical).children([
                self.nameLbl,
                self.phoneLbl
            ])
        let layout = StackLayout().spacing(16).alignItems(.center).children([
                self.avatarIV,
                infoLayout
            ])
        self.contentView.addSubview(layout)
        layout.autoPinEdgesToSuperviewEdges(with: .all(16))
    }
    
    override func bindViewAndViewModel() {
        guard let viewModel = self.viewModel else { return }
        viewModel.rxName ~> self.nameLbl.rx.text => disposeBag
        viewModel.rxPhone ~> self.phoneLbl.rx.text => disposeBag
    }
}
