//
//  iTunesViewModel.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

class iTunesViewModel {
    
    struct Input {
        let searchButtonTap: ControlEvent<Void>
        let searchText: ControlProperty<String>
    }
    
    struct Output {
        let searchData: Driver<[Contents]>
    }
    
    let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let search = PublishRelay<[Contents]>()
        
        input.searchButtonTap
            .withLatestFrom(input.searchText)
            .map { String($0).replacingOccurrences(of: " ", with: "+") }
            .subscribe(with: self) { owner, text in
                let result = Network.fetchSearchData(text: text)
                
                result.bind(to: search)
                    .disposed(by: owner.disposeBag)
                
//                search.accept()
            }.disposed(by: disposeBag)
        
        let searchResult = search.asDriver(onErrorJustReturn: [Contents(trackName: "", artistName: "", isGameCenterEnabled: false, supportedDevices: [""], screenshotUrls: [""], artworkUrl512: "", contentAdvisoryRating: "")])
        
        return Output(searchData: searchResult)
    }
    
}
