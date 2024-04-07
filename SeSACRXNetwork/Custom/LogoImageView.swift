//
//  LogoImageView.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import UIKit
import Kingfisher

class LogoImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        clipsToBounds = true
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func imageSetting(urlText: String) {
        let url = URL(string: urlText)
        
        kf.setImage(with: url)
    }

}
