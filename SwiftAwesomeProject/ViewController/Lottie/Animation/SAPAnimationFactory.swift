//
//  SAPAnimationFactory.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/19/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit

protocol SAPAnimationProtocol {
    func create() -> UIView
    func autoLayout()
    func play()
}

open class SAPAnimation: UIView, SAPAnimationProtocol {
    init() {
        super.init(frame: .null)
        let animatedButton = self.create()
        self.addSubview(animatedButton)
        animatedButton.autoPinEdgesToSuperviewEdges()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            self.play()
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open func create() -> UIView {
        return UIView()
    }
    
    open func autoLayout() {
    }
    
    open func play() {
    }
}

enum SAPAnimationType: Int {
    case AnimatedButton
    case AnimationView
    case AnimatedSwitch
}

class SAPAnimationFactory: NSObject {
    private static var sharedInstance = SAPAnimationFactory()
    
    class func shared() -> SAPAnimationFactory {
        return sharedInstance
    }
    
    func getAnimation(type: SAPAnimationType) -> SAPAnimation {
        switch type {
        case .AnimatedButton:
            return SAPAnimatedButton()
        case .AnimationView:
            return SAPAnimationView()
        case .AnimatedSwitch:
            return SAPAnimatedSwitch()
        }
    }
}
