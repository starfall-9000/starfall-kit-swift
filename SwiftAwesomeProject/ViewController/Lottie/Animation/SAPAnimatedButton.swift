//
//  SAPAnimatedButton.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/19/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import Lottie

class SAPAnimatedButton: SAPAnimation {
    override func create() -> UIView {
        let button = AnimatedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.animation = Animation.named("TwitterHeart")
        button.clipsToBounds = false
        button.setPlayRange(fromMarker: "touchDownStart", toMarker: "touchDownEnd", event: .touchDown)
        button.setPlayRange(fromMarker: "touchDownEnd", toMarker: "touchUpCancel", event: .touchUpOutside)
        button.setPlayRange(fromMarker: "touchDownEnd", toMarker: "touchUpEnd", event: .touchUpInside)
        return button
    }
    
    override func autoLayout() {
        self.autoSetDimension(.width, toSize: 300)
        self.autoSetDimension(.height, toSize: 300)
        self.autoCenterInSuperview()
    }
}
