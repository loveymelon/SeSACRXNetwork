//
//  iTunesViewController.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import UIKit
import RxSwift
import RxCocoa

class iTunesViewController: BaseViewController<iTunesView> {
    
    
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureNav() {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "검색"
        navigationItem.searchController = mainView.searchController
    }
    
    override func bind() {
        mainView.searchBar
            .rx
            .searchButtonClicked
            .subscribe { _ in
                print("tap")
            }
    }
    
}
