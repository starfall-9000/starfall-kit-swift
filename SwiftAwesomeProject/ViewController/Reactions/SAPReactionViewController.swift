//
//  SAPReactionViewController.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/20/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import Reactions

class SAPReactionViewController: Page<SAPReactionViewModel> {
    let contentView = UIView()
    let reactionSelector = ReactionSelector()

    override func initialize() {
        super.initialize()
        title = "Reactions Button"
        enableBackButton = true
        view.addSubview(contentView)
        contentView.autoPinEdgesToSuperviewSafeArea()
        
        contentView.addSubview(reactionSelector)
        reactionSelector.reactions = Reaction.facebook.all
        reactionSelector.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        reactionSelector.autoAlignAxis(toSuperviewAxis: .vertical)
        reactionSelector.autoSetDimensions(to: .init(width: 282, height: 52))
        
        reactionSelector.addTarget(self, action: #selector(reactionDidChanged(_:)), for: .valueChanged)
        reactionSelector.feedbackDelegate = self
    }
    
    @objc func reactionDidChanged(_ sender: AnyObject) {
        print(reactionSelector.selectedReaction ?? "")
    }
}

extension SAPReactionViewController: ReactionFeedbackDelegate {
    func reactionFeedbackDidChanged(_ feedback: ReactionFeedback?) {
        print(feedback ?? "")
    }
}
