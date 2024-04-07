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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imageSetting(urlText: String) {
        let url = URL(string: urlText)
        
        self.kf.setImage(with: url)
    }

}
