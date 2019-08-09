//
//  SAPContactEditViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/9/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import RxCocoa

class SAPContactEditViewModel: ViewModel<SAPContactModel> {
    let rxName = BehaviorRelay<String> (value: "")
    let rxPhone = BehaviorRelay<String> (value: "")
    let rxSaveEnabled = BehaviorRelay<Bool> (value: false)
}
