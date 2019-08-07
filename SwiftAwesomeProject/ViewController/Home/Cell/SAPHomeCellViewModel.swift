//
//  SAPHomeCellViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/6/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import RxCocoa

class SAPHomeCellViewModel: CellViewModel<SAPHomeModel> {
    let rxTitle = BehaviorRelay<String?> (value: nil)
    let rxDesc = BehaviorRelay<String?> (value: nil)
    
    override func react() {
        self.rxTitle.accept(self.model?.title)
        self.rxDesc.accept(self.model?.desc)
    }
}
