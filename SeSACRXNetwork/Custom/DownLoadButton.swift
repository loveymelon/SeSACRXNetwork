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
    
}

extension DownLoadButton {
    func configureUI() {
        setTitle("받기", for: .normal)
        layer.cornerRadius = 20
        
        self.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
    }
    
}
