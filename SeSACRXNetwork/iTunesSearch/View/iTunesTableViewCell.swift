//
//  iTunesTableViewCell.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import UIKit
import SnapKit
import Then

class iTunesTableViewCell: UITableViewCell {
    
    let logoImageView = UIImageView()
    let productNameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
    }
    let downloadButton = UIButton().then {
        $0.backgroundColor = .systemGray5
        $0.setTitle("받기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.layer.cornerRadius = 20
    }

    static let identifier = "SearchTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension iTunesTableViewCell: ReusableProtocol {
    func configureUI() {
        configureHierarchy()
        configureLayout()
    }
    
    func configureHierarchy() {
        [logoImageView, downloadButton, productNameLabel].forEach { item in
            contentView.addSubview(item)
        }
    }
    
    func configureLayout() {
        let contentSafe = contentView.safeAreaLayoutGuide.snp
        
        logoImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentSafe.leading).inset(10)
            make.top.equalTo(contentSafe.top).inset(10)
            make.size.equalTo(40)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentSafe.trailing).inset(10)
            make.centerY.equalTo(logoImageView.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoImageView.snp.trailing).offset(10)
            make.centerY.equalTo(logoImageView.snp.centerY)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-30)
            make.height.equalTo(30)
        }
    }
    
}
