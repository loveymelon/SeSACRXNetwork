//
//  DetailView.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import UIKit
import SnapKit
import Then

class DetailView: BaseView {
    
    let logoImageView = UIImageView()
    
    let productLabel = UILabel()
    
    let companyLabel = UILabel()
    
    let downLoadButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
