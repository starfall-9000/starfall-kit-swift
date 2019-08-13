//
//  SAPSearchListCell.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/12/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

class SAPSearchListCell: CollectionCell<SAPSearchListCellViewModel> {
    let imageView = UIImageView()
    let titleLbl = UILabel()
    
    override func initialize() {
        contentView.cornerRadius = 7
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        imageView.autoPinEdgesToSuperviewEdges()
        
        let titleView = UIView()
        titleView.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.5)
        contentView.addSubview(titleView)
        titleView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        
        titleLbl.font = Font.system.normal(withSize: 15)
        titleLbl.textColor = .white
        titleLbl.numberOfLines = 2
        titleView.addSubview(titleLbl)
        titleLbl.autoPinEdgesToSuperviewEdges(with: .all(5))
    }
    
    override func bindViewAndViewModel() {
        guard let viewModel = viewModel else { return }
        viewModel.rxImage ~> imageView.rx.networkImage => disposeBag
        viewModel.rxTitle ~> titleLbl.rx.text => disposeBag
    }
}
