//
//  BaseViewController.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/6/24.
//

import UIKit

class BaseViewController<T: BaseView>: UIViewController {

    let mainView = T()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNav()
        bind()
    }
    
    func configureNav() {
        
    }
    
    func bind() {
        
    }
    

}
