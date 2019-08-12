//
//  SAPSearchListViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/12/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import RxCocoa

class SAPSearchListViewModel: ListViewModel<Model, SAPSearchListCellViewModel> {
    let rxSearchText = BehaviorRelay<String?> (value: nil)
}
