//
//  DetailViewModel.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

class DetailViewModel {
    
    struct Input {
        let selectedData: Observable<Contents>.Element
    }
    
    struct Output {
        let datas: Driver<Contents>
    }
    
    let disposeBage = DisposeBag()
    
    func transform(input: Input) -> Output {
        
        let resultData = BehaviorRelay<Contents>(value: input.selectedData)
        
        let driveData = resultData.asDriver(onErrorJustReturn: Contents())
        
        return Output(datas: driveData)
    }
    
}
