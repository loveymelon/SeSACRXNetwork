//
//  MovieViewModel.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

class MovieViewModel {
    
    struct Input {
        let searchButtonTap: ControlEvent<Void>
        let searchText: ControlProperty<String>
    }
    
    struct Output {
        let tableList: Driver<[DailyBoxOfficeList]>
    }
    
    let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let boxOfficeList = PublishSubject<[DailyBoxOfficeList]>()
        
        input.searchButtonTap
            .withLatestFrom(input.searchText)
            .map { guard let intText = Int($0) else { return 20240101 }
                return intText }
            .map { String($0) }
            .flatMap {
                Network.fetchBoxOfficeData(date: $0)
            }.subscribe(with: self, onNext: { owner, value in
                
                let data = value.boxOfficeResult.dailyBoxOfficeList
                boxOfficeList.onNext(data)
                print("next")
                
            }, onError: { _, _ in
                print("Transform Error")
            }, onCompleted: { _ in
                print("Transform Completed")
            }, onDisposed: { _ in
                print("Transform Disposed")
            }).disposed(by: disposeBag)
        
        let boxOfficeResult = boxOfficeList.asDriver(onErrorJustReturn: [DailyBoxOfficeList(movieNm: "", openDt: "")])
        
        return Output(tableList: boxOfficeResult)
    }
    
}
