//
//  SAPLottieCell.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/19/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import Lottie

class SAPLottieCell: TableCell<SAPLottieCellViewModel> {
    let titleLabel = UILabel()
    let descLabel = UILabel()
    let rightLayout = UIView()
    
    override func initialize() {
        super.initialize()
        
        titleLabel.numberOfLines = 0
        titleLabel.font = Font.system.bold(withSize: SAPFontSize.title)
        
        descLabel.numberOfLines = 0
        descLabel.font = Font.system.normal(withSize: SAPFontSize.subTitle)
        
        let leftLayout = StackLayout().direction(.vertical).children([
            titleLabel,
            descLabel
            ]).spacing(8).justifyContent(.fillProportionally)
        contentView.addSubview(leftLayout)
        leftLayout.autoPinEdgesToSuperviewEdges(with: .all(SAPMargin.normal), excludingEdge: .right)
        
        contentView.addSubview(rightLayout)
        rightLayout.autoPinEdge(.left, to: .right, of: leftLayout, withOffset: SAPMargin.normal)
        rightLayout.autoPinEdgesToSuperviewEdges(with:.all(SAPMargin.normal), excludingEdge: .left)
        rightLayout.autoSetDimension(.width, toSize: 100, relation: .lessThanOrEqual)
    }
    
    override func bindViewAndViewModel() {
        guard let viewModel = viewModel else { return }
        
        viewModel.rxTitle ~> titleLabel.rx.text => disposeBag
        viewModel.rxDesc ~> descLabel.rx.text => disposeBag
        viewModel.rxHideDesc ~> descLabel.rx.isHidden => disposeBag
        addAnimationView()
    }
    
    private func addAnimationView() {
        guard let viewModel = viewModel else { return }
        guard let indexPath = viewModel.indexPath else { return }
        
        rightLayout.subviews.forEach({ $0.removeFromSuperview() })
        let animationView = SAPAnimationFactory.shared().getAnimation(type: SAPAnimationType(rawValue: indexPath.row) ?? .AnimatedButton)
        rightLayout.addSubview(animationView)
        animationView.autoLayout()
    }
}
