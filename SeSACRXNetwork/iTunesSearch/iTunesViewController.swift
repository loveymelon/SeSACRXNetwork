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
    
    let viewModel = iTunesViewModel()
    
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
        let search = mainView.searchBar.rx
            
        let input = iTunesViewModel.Input(searchButtonTap: search.searchButtonClicked, searchText: search.text.orEmpty)
        
        let output = viewModel.transform(input: input)
        
        output.searchData
            .drive(onNext: { text in
                print(text)
            })
            .disposed(by: disposeBag)
        
    }
    
}
