//
//  SAPContactCellViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/8/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import RxCocoa

class SAPContactCellViewModel: CellViewModel<SAPContactModel> {
    let rxName = BehaviorRelay<String?> (value: nil)
    let rxPhone = BehaviorRelay<String?> (value: nil)
    
    override func react() {
        self.modelChanged()
    }
    
    override func modelChanged() {
        self.rxName.accept(model?.name)
        self.rxPhone.accept(model?.phone)
    }
}
