//
//  SAPSearchListViewController.swift
//  SwiftAwesomeProject
//
//  Created by An Binh on 8/12/19.
//  Copyright © 2019 An Binh. All rights reserved.
//

import UIKit
import DDMvvm

class SAPSearchListViewController: CollectionPage<SAPSearchListViewModel> {
    let searchBar = UISearchBar(frame: CGRect(origin: .zero, size: SAPSize.searchBar))
    let indicatorView = UIActivityIndicatorView(style: .gray)
    
    let loadMoreView = UIView()
    let loadMoreIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    override func initialize() {
        super.initialize()
        
        enableBackButton = true
        self.setupSearchBar()
        self.setupLoadMore()
        self.setupCollection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let textField = searchBar.subviews[0].subviews.last as? UITextField {
            textField.rightView = indicatorView
            textField.rightViewMode = .always
        }
        
        loadMoreView.transform = CGAffineTransform(translationX: 0, y: loadMoreView.frame.height + SAPSize.iPhoneXSafeBottom)
        loadMoreView.isHidden = false
    }
    
    func setupSearchBar() {
        indicatorView.hidesWhenStopped = true
        searchBar.placeholder = "Search for Flickr images"
        navigationItem.titleView = searchBar
    }
    
    func setupLoadMore() {
        loadMoreView.isHidden = true
        loadMoreView.backgroundColor = .white
        view.addSubview(loadMoreView)
        collectionView.autoPinEdgesToSuperviewSafeArea(with: .zero)
        loadMoreView.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .top)
        
        loadMoreIndicator.hidesWhenStopped = false
        loadMoreIndicator.startAnimating()
        loadMoreView.addSubview(loadMoreIndicator)
        
        loadMoreIndicator.autoAlignAxis(toSuperviewAxis: .vertical)
        loadMoreIndicator.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        loadMoreIndicator.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        loadMoreIndicator.color = .black
    }
    
    func setupCollection() {
        collectionView.register(SAPSearchListCell.self, forCellWithReuseIdentifier: SAPSearchListCell.identifier)
    }
    
    override func bindViewAndViewModel() {
        super.bindViewAndViewModel()
        
        self.bindSearchText()
        self.bindIndicatorInSearchBar()
        self.bindIndicatorInLoadingMore()
        self.bindCollectionViewLoadingMore()
    }
    
    private func bindSearchText() {
        guard let viewModel = viewModel else { return }
        viewModel.rxSearchText <~> searchBar.rx.text => disposeBag
    }
    
    private func bindIndicatorInSearchBar() {
        guard let viewModel = viewModel else { return }
        viewModel.rxIsSearching.asDriver().drive(onNext: { [weak self] (value) in
            guard let self = self else { return }
            if value {
                self.indicatorView.startAnimating()
            } else {
                self.indicatorView.stopAnimating()
            }
        }) => disposeBag
    }
    
    private func bindIndicatorInLoadingMore() {
        guard let viewModel = viewModel else { return }
        viewModel.rxIsLoadingMore.asDriver().drive(onNext: { (value) in
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                guard let self = self else { return }
                if value {
                    self.loadMoreView.transform = .identity
                } else {
                    self.loadMoreView.transform = CGAffineTransform(translationX: 0, y: self.loadMoreView.frame.height + SAPSize.iPhoneXSafeBottom)
                }
            })
        }) => disposeBag
    }
    
    private func bindCollectionViewLoadingMore() {
        guard let viewModel = viewModel else { return }
        collectionView.rx.endReach.subscribe(onNext: {
            viewModel.loadMoreAction.execute()
        }) => disposeBag
    }
    
    override func cellIdentifier(_ cellViewModel: SAPSearchListCellViewModel) -> String {
        return SAPSearchListCell.identifier
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewWidth = collectionView.frame.width
        
        let numOfCols: CGFloat
        if viewWidth <= 375 {
            numOfCols = 2
        } else if viewWidth <= 568 {
            numOfCols = 3
        } else if viewWidth <= 768 {
            numOfCols = 4
        } else {
            numOfCols = 5
        }
        
        let contentWidth = viewWidth - ((numOfCols + 1) * SAPMargin.normal)
        let width = contentWidth / numOfCols
        return CGSize(width: width, height: 4 * width / 3)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return SAPMargin.normal
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return SAPMargin.normal
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .all(SAPMargin.normal)
    }
}
