//
//  MovieViewController.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/6/24.
//

import UIKit
import RxSwift
import RxCocoa

class MovieViewController: BaseViewController<MovieView> {
    
    let movieViewModel = MovieViewModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureNav() {
        navigationItem.titleView = mainView.searchBar
    }
    
    override func bind() {
        
        
        let search = mainView.searchBar.rx
        
        // input타입이 Observable<ControlProperty<String?>.Element> 일때는 어떻게 접근해야되는지 모르겠습니다.
        let input = MovieViewModel.Input(searchButtonTap: search.searchButtonClicked, searchText: search.text.orEmpty)
        
        let output = movieViewModel.transform(input: input)
        
        output.tableList.drive(mainView.tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)
        ) { (row, element, cell) in
            cell.appNameLabel.text = element.movieNm
            cell.downloadButton.setTitle(element.openDt, for: .normal)
        }
        .disposed(by: disposeBag)
        
    }
    
}


