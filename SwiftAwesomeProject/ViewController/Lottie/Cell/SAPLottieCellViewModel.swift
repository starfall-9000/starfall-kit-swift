//
//  SAPLottieCellViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/19/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import RxCocoa

class SAPLottieCellViewModel: CellViewModel<SAPLottieModel> {
    let rxTitle = BehaviorRelay<String?> (value: nil)
    let rxDesc = BehaviorRelay<String?> (value: nil)
    let rxHideDesc = BehaviorRelay<Bool> (value: false)
    
    override func react() {
        self.rxTitle.accept(self.model?.title)
        self.rxDesc.accept(self.model?.desc)
        self.rxHideDesc.accept(self.model?.desc == nil || self.model?.desc == "")
    }
}
