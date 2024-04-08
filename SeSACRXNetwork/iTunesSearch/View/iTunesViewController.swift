//
//  iTunesViewController.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

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
            
        let input = iTunesViewModel.Input(searchButtonTap: search.searchButtonClicked, searchCancelTap: search.cancelButtonClicked, searchText: search.text.orEmpty)
        
        let output = viewModel.transform(input: input)
        
        output.searchData
            .drive(mainView.tableView.rx.items(cellIdentifier: iTunesTableViewCell.identifier, cellType: iTunesTableViewCell.self)) { (indexPath, item, cell) in
                
                cell.logoImageView.imageSetting(urlText: item.artworkUrl512)
                cell.productNameLabel.text = item.trackName
                cell.artistLabel.text = item.artistName
                cell.avgLabel.text = "\((item.averageUserRating * 10).rounded() / 10)"
                cell.genreLabel.text = item.genres[0]
                
                // 어떻게 item의 값을 collection에게 전할지 모르겠다.....
            }
            .disposed(by: disposeBag)
        
        Observable.zip(mainView.tableView.rx.itemSelected, mainView.tableView.rx.modelSelected(Contents.self))
            .bind(with: self, onNext: { owner, item in
                let data = item.1
            
                let vc = DetailViewController()
                
                vc.selectedData = data
                
                owner.navigationController?.pushViewController(vc, animated: true)
                
            }).disposed(by: disposeBag)
        
        
        
    }
    
}
