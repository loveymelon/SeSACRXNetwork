//
//  DetailViewController.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import UIKit
import RxSwift
import RxCocoa

class DetailViewController: BaseViewController<DetailView> {
    
    let viewModel = DetailViewModel()
    
    let disposeBag = DisposeBag()
    
    var selectedData = ControlEvent<Contents>.Element()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureNav() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func bind() {
        let input = DetailViewModel.Input(selectedData: selectedData)
        
        let output = viewModel.transform(input: input)
        
        output.datas
            .drive(with: self) { owner, data in
                owner.mainView.logoImageView.imageSetting(urlText: data.artworkUrl512)
                owner.mainView.productLabel.text = data.trackName
                owner.mainView.companyLabel.text = data.artistName
                owner.mainView.versionLabel.text = "버전 \(data.version)"
                owner.mainView.updateDetailView.text = data.description
            }.disposed(by: disposeBag)
    }

}
