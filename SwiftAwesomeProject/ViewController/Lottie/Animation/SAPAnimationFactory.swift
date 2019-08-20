//
//  SAPAnimationFactory.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/19/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit

protocol SAPAnimation: UIView {
    func create() -> UIView
    func autoLayout()
}

enum SAPAnimationType: Int {
    case AnimatedButton
}

class SAPAnimationFactory: NSObject {
    private static var sharedInstance = SAPAnimationFactory()
    
    class func shared() -> SAPAnimationFactory {
        return sharedInstance
    }
    
    func getAnimation(type: SAPAnimationType) -> SAPAnimation {
        switch type {
        case .AnimatedButton:
            return SAPAnimatedButton.init()
        }
    }
}
