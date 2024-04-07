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
    
    let logoImageView = LogoImageView(frame: .zero)
    let productLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.numberOfLines = 0
        $0.backgroundColor = .red
    }
    let companyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .lightGray
    }
    let detailStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 0
        $0.backgroundColor = .blue
    }
    let downLoadButton = DownLoadButton().then {
        $0.backgroundColor = .systemBlue
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        [productLabel, companyLabel, downLoadButton].forEach { item in
            detailStackView.addArrangedSubview(item)
        }
        
        [logoImageView, detailStackView].forEach { item in
            addSubview(item)
        }
    }
    
    override func configureLayout() {
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(10)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
        
        detailStackView.snp.makeConstraints { make in
            make.height.equalTo(logoImageView.snp.height)
            make.leading.equalTo(logoImageView.snp.trailing).offset(10)
            make.top.equalTo(logoImageView.snp.top)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(10)
        }
        
        productLabel.snp.makeConstraints { make in
            make.height.equalTo(detailStackView.snp.height).multipliedBy(0.4)
            make.width.equalToSuperview()
        }
        
        companyLabel.snp.makeConstraints { make in
            make.height.equalTo(productLabel.snp.height).multipliedBy(0.7)
        }
        
    }
    
}
