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
    
    let scrollView = UIScrollView().then {
        $0.bounces = false
    }
    
    let contentView = UIView()
    let logoImageView = LogoImageView(frame: .zero)
    let productLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.numberOfLines = 0
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
    }
    
    let newLabel = UILabel().then {
        $0.text = "새로운 소식"
        $0.font = .italicSystemFont(ofSize: 20)
    }
    
    let versionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
    }
    
    let downLoadButton = DownLoadButton().then {
        $0.backgroundColor = .systemBlue
    }
    
    let updateDetailView = UITextView().then {
        $0.isScrollEnabled = false
        $0.isEditable = false
        $0.font = .systemFont(ofSize: 14)
    }
    
    let label = UILabel().then {
        
        $0.text = "dfdsfaa"
        $0.font = .systemFont(ofSize: 20)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [productLabel, companyLabel, downLoadButton].forEach { item in
            detailStackView.addArrangedSubview(item)
        }
        
        [logoImageView, detailStackView, newLabel, versionLabel, updateDetailView, label].forEach { item in
            contentView.addSubview(item)
        }
    }
    
    override func configureLayout() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.leading.equalTo(contentView.snp.leading).inset(10)
            make.top.equalTo(contentView.snp.top)
        }
        
        detailStackView.snp.makeConstraints { make in
            make.height.equalTo(logoImageView.snp.height)
            make.leading.equalTo(logoImageView.snp.trailing).offset(10)
            make.top.equalTo(logoImageView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing).inset(10)
        }
        
        productLabel.snp.makeConstraints { make in
            make.height.equalTo(detailStackView.snp.height).multipliedBy(0.4)
            make.width.equalToSuperview()
        }
        
        companyLabel.snp.makeConstraints { make in
            make.height.equalTo(productLabel.snp.height).multipliedBy(0.7)
        }
        
        newLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.leading.equalTo(contentView.snp.leading).inset(10)
            make.height.equalTo(30)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(newLabel.snp.bottom).offset(10)
            make.leading.equalTo(newLabel.snp.leading)
        }
        
        updateDetailView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(10)
            make.top.equalTo(versionLabel.snp.bottom).offset(10)
            make.height.equalTo(600)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(updateDetailView.snp.bottom).offset(10)
            make.height.equalTo(35)
            make.leading.equalTo(contentView.snp.leading).inset(10)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
        
    }
    
}
