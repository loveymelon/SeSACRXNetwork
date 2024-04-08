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
        let searchCancelTap: ControlEvent<Void>
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
            .flatMap { Network.fetchSearchData(text: $0) } // flatMap을 안사용하니 Single이 감싸져서 나온다.
            .subscribe(with: self, onNext: { owner, result in
                switch result {
                case .success(let data):
                    search.accept(data)
                case .failure(let error):
                    print(error)
                }
            })
            .disposed(by: disposeBag)
        
        input.searchCancelTap
            .subscribe(with: self) { owner, _ in
                search.accept([])
            }.disposed(by: disposeBag)
        
        let searchResult = search.asDriver(onErrorJustReturn: [Contents(trackName: "", artistName: "", isGameCenterEnabled: false, supportedDevices: [""], screenshotUrls: [""], artworkUrl512: "", contentAdvisoryRating: "")])
        
        return Output(searchData: searchResult)
    }
    
}
