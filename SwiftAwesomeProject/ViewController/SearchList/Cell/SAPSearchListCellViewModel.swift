//
//  SAPSearchListCellViewModel.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/12/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm
import RxCocoa

class SAPSearchListCellViewModel: CellViewModel<SAPFlickrPhotoModel> {
    let rxImage = BehaviorRelay(value: NetworkImage())
    let rxTitle = BehaviorRelay<String?>(value: nil)
    
    override func react() {
        rxImage.accept(NetworkImage(withURL: model?.imageUrl, placeholder: UIImage.from(color: .black)))
        rxTitle.accept(model?.title)
    }
}
