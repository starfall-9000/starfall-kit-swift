//
//  SAPAnimatedSwitch.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/20/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import Lottie

class SAPAnimatedSwitch: SAPAnimation {
    override func create() -> UIView {
        let switchButton = AnimatedSwitch()
        switchButton.animation = Animation.named("TwitterHeart")
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        
        /// Set the play progress for `On` and `Off`
        switchButton.setProgressForState(fromProgress: 0, toProgress: 1, forOnState: true)
        switchButton.setProgressForState(fromProgress: 1, toProgress: 0, forOnState: false)
        return switchButton
    }
    
    override func autoLayout() {
        self.autoSetDimension(.width, toSize: 300)
        self.autoSetDimension(.height, toSize: 300)
        self.autoCenterInSuperview()
    }
}
