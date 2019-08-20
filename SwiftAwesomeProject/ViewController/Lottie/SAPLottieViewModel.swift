//
//  SAPLottieViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/15/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

class SAPLottieViewModel: ListViewModel<Model, SAPLottieCellViewModel> {
    override func react() {
        self.itemsSource.append(getListItem().toCellViewModels())
    }
    
    func getListItem() -> [SAPLottieModel] {
        return [
            SAPLottieModel(title: "Animation Button", desc: "Click This Button")
        ]
    }
}
