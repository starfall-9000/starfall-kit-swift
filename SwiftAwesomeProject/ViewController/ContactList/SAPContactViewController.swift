//
//  SAPContactViewController.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/8/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

class SAPContactViewController: ListPage<SAPContactViewModel> {
    let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Contact List"
        self.enableBackButton = true
        self.navigationItem.rightBarButtonItem = self.addBtn
        
        self.tableView.register(SAPContactCell.self, forCellReuseIdentifier: SAPContactCell.identifier)
    }
    
    override func bindViewAndViewModel() {
        super.bindViewAndViewModel()
        
        guard let viewModel = self.viewModel else { return }
        self.addBtn.rx.bind(to: viewModel.addAction, input: ())
    }
    
    override func cellIdentifier(_ cellViewModel: SAPContactCellViewModel) -> String {
        return SAPContactCell.identifier
    }
    
    override func selectedItemDidChange(_ cellViewModel: SAPContactCellViewModel) {
        if let indexPath = self.viewModel?.rxSelectedIndex.value {
            self.tableView.deselectRow(at: indexPath, animated: true);
        }
    }
}
