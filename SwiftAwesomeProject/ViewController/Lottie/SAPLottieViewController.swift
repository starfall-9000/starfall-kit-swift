//
//  SAPLottieViewController.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/15/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import Lottie

class SAPLottieViewController: ListPage<SAPLottieViewModel> {
    override func initialize() {
        super.initialize()
        
        enableBackButton = true
        title = "Lottie Animation"
        self.tableView.register(SAPLottieCell.self, forCellReuseIdentifier: SAPLottieCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func cellIdentifier(_ cellViewModel: SAPLottieCellViewModel) -> String {
        return SAPLottieCell.identifier
    }
    
    override func selectedItemDidChange(_ cellViewModel: SAPLottieCellViewModel) {
        if let indexPath = self.viewModel?.rxSelectedIndex.value {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
