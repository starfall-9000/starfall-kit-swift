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
import RxCocoa
import RxSwift

class SAPReactionViewController: Page<SAPReactionViewModel> {
    let contentView = UIView()
    let reactionSelector = ReactionSelector()
    let reactionButton = ReactionButton()
    let reactionButtonWithSelector = ReactionButton()

    override func initialize() {
        super.initialize()
        title = "Reactions Button"
        enableBackButton = true
        view.addSubview(contentView)
        contentView.autoPinEdgesToSuperviewSafeArea()
        
        setupReactionSelector()
        setupReactionButton()
        setupReactionButtonWithSelector()
    }
    
    override func bindViewAndViewModel() {
        super.bindViewAndViewModel()
        
        guard let viewModel = viewModel else { return }
        viewModel.rxSelectedReaction ~> reactionButton.rx.reaction => disposeBag
        viewModel.rxIsSelectedReaction ~> reactionButton.rx.isSelected => disposeBag
    }
    
    private func setupReactionSelector() {
        contentView.addSubview(reactionSelector)
        reactionSelector.reactions = Reaction.facebook.all
        reactionSelector.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        reactionSelector.autoAlignAxis(toSuperviewAxis: .vertical)
        reactionSelector.autoSetDimensions(to: .init(width: 282, height: 52))
        reactionSelector.addTarget(self, action: #selector(reactionDidChanged(_:)), for: .valueChanged)
    }
    
    private func setupReactionButton() {
        contentView.addSubview(reactionButton)
        reactionButton.reaction = Reaction.facebook.love
        reactionButton.autoPinEdge(.top, to: .bottom, of: reactionSelector, withOffset: SAPMargin.big)
        reactionButton.autoAlignAxis(toSuperviewAxis: .vertical)
        reactionButton.autoSetDimensions(to: .init(width: 100, height: 40))
        reactionButton.config = ReactionButtonConfig() {
            $0.iconMarging      = SAPMargin.tiny
            $0.spacing          = SAPMargin.small
            $0.font             = UIFont(name: "HelveticaNeue", size: SAPFontSize.button)
            $0.neutralTintColor = .gray
            $0.alignment        = .centerLeft
        }
    }
    
    private func setupReactionButtonWithSelector() {
        let buttonSelector = ReactionSelector()
        buttonSelector.reactions = Reaction.facebook.all
        buttonSelector.feedbackDelegate = self
        
        contentView.addSubview(reactionButtonWithSelector)
        reactionButtonWithSelector.reaction = Reaction.facebook.like
        reactionButtonWithSelector.autoPinEdge(.top, to: .bottom, of: reactionButton, withOffset: SAPMargin.big)
        reactionButtonWithSelector.autoAlignAxis(toSuperviewAxis: .vertical)
        reactionButtonWithSelector.autoSetDimensions(to: .init(width: 100, height: 40))
        reactionButtonWithSelector.config = ReactionButtonConfig() { $0.alignment = .centerLeft }
        reactionButtonWithSelector.reactionSelector = buttonSelector
    }
    
    @objc func reactionDidChanged(_ sender: AnyObject) {
        viewModel?.rxSelectedReaction.accept(reactionSelector.selectedReaction)
        viewModel?.rxIsSelectedReaction.accept(true)
    }
}

extension SAPReactionViewController: ReactionFeedbackDelegate {
    func reactionFeedbackDidChanged(_ feedback: ReactionFeedback?) {
        viewModel?.rxReactionFeedback.accept(feedback)
    }
}
