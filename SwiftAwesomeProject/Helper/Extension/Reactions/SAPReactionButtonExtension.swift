//
//  SAPReactionButtonExtension.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/21/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import Reactions
import RxCocoa
import RxSwift

public extension Reactive where Base: ReactionButton {
    
//    var reaction: Binder<Reaction?> {
//        return Binder(self.base) { $0.reaction = $1 ?? $0.reaction }
//    }
    
    var reaction: ControlProperty<Reaction?> {
        return UIControl.toProperty(control: self.base, getter: { (button) in
            button.reaction
        }, setter: { (button, reaction) in
            button.reaction = reaction ?? button.reaction
        })
    }
    
}
