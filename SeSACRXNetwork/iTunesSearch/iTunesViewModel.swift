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
        let searchData: Driver<String>
    }
    
    let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let search = PublishRelay<String>()
        
        input.searchButtonTap
            .withLatestFrom(input.searchText)
            .map { String($0) }
            .subscribe(with: self) { owner, text in
                search.accept(text)
            }.disposed(by: disposeBag)
        
        let searchResult = search.asDriver(onErrorJustReturn: "")
        
        return Output(searchData: searchResult)
    }
    
}
