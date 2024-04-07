//
//  DownLoadButton.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import UIKit
import SnapKit

class DownLoadButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonHeight = self.frame.size.height
        let cornerRadius = buttonHeight / 2
        layer.cornerRadius = cornerRadius
    }
    
}

extension DownLoadButton {
    func configureUI() {
        setTitle("받기", for: .normal)
        layer.cornerRadius = 15
        
        self.snp.makeConstraints { make in
            make.width.equalTo(70)
        }
    }
    
}
