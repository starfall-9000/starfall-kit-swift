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
import RxSwift
import Action

class SAPContactEditViewModel: ViewModel<SAPContactModel> {
    let rxName = BehaviorRelay<String?> (value: nil)
    let rxPhone = BehaviorRelay<String?> (value: nil)
    let rxSaveEnabled = BehaviorRelay(value: false)
    
    lazy var cancelAction: Action<Void, Void> = {
        return Action() { .just(self.navigationService.pop(with: PopOptions(popType: .dismissPopup))) }
    }()
    
    lazy var saveAction: Action<Void, SAPContactModel> = {
        return Action(enabledIf: self.rxSaveEnabled.asObservable()) { [weak self] in
            guard let `self` = self else { return Observable.empty() }
            return self.save()
        }
    }()
    
    override func react() {
        self.rxName.accept(model?.name)
        self.rxPhone.accept(model?.phone)
        
        Observable.combineLatest(self.rxName, self.rxPhone) {
            name, phone -> Bool in
            return !name.isNilOrEmpty && !phone.isNilOrEmpty
        } ~> self.rxSaveEnabled => disposeBag
    }
    
    private func save() -> Observable<SAPContactModel> {
        let contact = SAPContactModel()
        contact.name = self.rxName.value ?? ""
        contact.phone = self.rxPhone.value ?? ""
        self.navigationService.pop(with: PopOptions(popType: .dismissPopup))
        return .just(contact)
    }
}
