//
//  Network.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
}

class Network {
    
    static func fetchBoxOfficeData(date: String) -> Observable<Movie> {
        
        return Observable<Movie>.create { observer in
            guard let url = URL(string: "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=\(date)") else {
                observer.onError(APIError.invalidURL)
                return Disposables.create() // 필요한 시점일때 리소스 정리를 위해서
            } // 생성
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                print("DataTask Succeed")
                
                if let _ = error {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    print("Response Error")
                    observer.onError(APIError.statusError)
                    return
                }
                
                if let data = data,
                   let appData = try? JSONDecoder().decode(Movie.self, from: data) {
                    observer.onNext(appData)
                    observer.onCompleted()
                    // Single
                    // complete를 하지않을때 문제점 다시 생각해보자
                } else {
                    print("응답은 왔으나 디코딩 실패")
                    observer.onError(APIError.unknownResponse)
                }
            }.resume()
            
            return Disposables.create()
            
        }.debug() // Observable을 커스텀해서 만든후
    }
    
    static func fetchSearchData(text: String) -> Single<Result<[Contents],APIError>> {
        
        return Single.create { single in
            guard let url = URL(string: "https://itunes.apple.com/search?term=\(text)&country=KR&media=software") else {
                single(.failure(APIError.invalidURL))
                return Disposables.create() // 필요한 시점일때 리소스 정리를 위해서
            }
            
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: iTunesModel.self) { response in
                switch response.result {
                case .success(let data):
                    single(.success(.success(data.results)))
                case .failure(let error):
                    print(error.localizedDescription)
                    single(.success(.failure(APIError.invalidURL)))
                }
            }
            
            return Disposables.create()
            
        }.debug("single observerable")
    }
    
}
