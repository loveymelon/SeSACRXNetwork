//
//  iTunesCollectionViewCell.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/9/24.
//

import UIKit

class iTunesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "iTunesCollectionViewCell"
    
    let screenImageView = ScreenShotImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension iTunesCollectionViewCell: ReusableProtocol {
    func configureUI() {
        configureHierarchy()
        configureLayout()
    }
    
    func configureHierarchy() {
        contentView.addSubview(screenImageView)
    }
    
    func configureLayout() {
        screenImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.snp.edges)
        }
    }
}
