//
//  ScreenShotImageView.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/9/24.
//

import UIKit
import Kingfisher

class ScreenShotImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imageSetting(text: String) {
        let url = URL(string: text)
        
        kf.setImage(with: url)
    }
    
}
