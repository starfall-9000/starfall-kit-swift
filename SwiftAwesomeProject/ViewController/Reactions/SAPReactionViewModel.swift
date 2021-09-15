//
//  SAPReactionViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/20/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import RxCocoa
import Reactions

class SAPReactionViewModel: ViewModel<Model> {
    let rxSelectedReaction = BehaviorRelay<Reaction?> (value: nil)
    let rxIsSelectedReaction = BehaviorRelay<Bool> (value: false)
    let rxReactionFeedback = BehaviorRelay<ReactionFeedback?> (value: nil)
    
    override func react() {
        rxSelectedReaction.subscribe(onNext: { (reaction) in
            NSLog("subscribe - %@", reaction?.id ?? "haha")
        }) => disposeBag
    }
}
