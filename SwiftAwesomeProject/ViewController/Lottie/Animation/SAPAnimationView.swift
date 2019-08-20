//
//  SAPAnimationView.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/20/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import Lottie

class SAPAnimationView: SAPAnimation {
    let animationView = AnimationView()
    
    override func create() -> UIView {
        let animation = Animation.named("TwitterHeart")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
    
    override func autoLayout() {
        self.autoSetDimension(.width, toSize: 300)
        self.autoSetDimension(.height, toSize: 300)
        self.autoCenterInSuperview()
    }
    
    override func play() {
        animationView.play(fromProgress: 0,
                           toProgress: 1,
                           loopMode: .loop,
                           completion: { (finished) in })
    }
}
