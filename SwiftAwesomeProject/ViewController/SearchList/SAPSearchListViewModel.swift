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
import RxSwift
import Alamofire

class SAPSearchListViewModel: ListViewModel<Model, SAPSearchListCellViewModel> {
    let rxSearchText = BehaviorRelay<String?> (value: nil)
    let rxIsSearching = BehaviorRelay<Bool> (value: false)
    
    var tmpBag: DisposeBag?
    var page = 1
    let pageSize = 20
    var done = false
    
    let jsonService: SAPJSONService = DependencyManager.shared.getService()
    let alertService: IAlertService = DependencyManager.shared.getService()
    
    var params: [String: Any] {
        return [
            "method": "flickr.photos.search",
            "api_key": "16ac4b56472006cf4e1f7479ec24cf09", // please provide your API key
            "format": "json",
            "nojsoncallback": 1,
            "page": page,
            "per_page": pageSize,
            "text": rxSearchText.value ?? ""
        ]
    }
    
    override func react() {
        self.reactSearchTextDidChange()
    }
    
    private func reactSearchTextDidChange() {
        rxSearchText
            .do(onNext: { [weak self] (text) in
                guard let self = self else { return }
                self.resetState()
                if !text.isNilOrEmpty {
                    self.rxIsSearching.accept(true)
                }
            })
            .debounce(.milliseconds(500), scheduler: Scheduler.shared.mainScheduler)
            .flatMap { [weak self] (text) -> Observable<[SAPSearchListCellViewModel]> in
                guard let self = self else { return .just([]) }
                if !text.isNilOrEmpty {
                    let obs: Single<SAPFlickrSearchResponse> = self.jsonService.get("", params: self.params, parameterEncoding: URLEncoding.queryString)
                    return obs.asObservable()
                        .catchErrorJustReturn(SAPFlickrSearchResponse())
                        .map(self.prepareSources)
                }
                return .just([])
            }
            .subscribe(onNext: { (cellViewModels) in
                self.itemsSource.reset([cellViewModels])
                self.rxIsSearching.accept(false)
            }) => disposeBag
    }
    
    private func resetState() {
        self.tmpBag = nil
        self.page = 1
        self.done = false
    }
    
    private func prepareSources(_ response: SAPFlickrSearchResponse) -> [SAPSearchListCellViewModel] {
        if response.stat == .fail {
            alertService.presentOkayAlert(title: "Error", message: "\(response.message)\nPlease be sure to provide your own API key from Flickr.")
        }
        if response.page >= response.pages {
            done = true
        }
        return response.photos.toCellViewModels() as [SAPSearchListCellViewModel]
    }
}
