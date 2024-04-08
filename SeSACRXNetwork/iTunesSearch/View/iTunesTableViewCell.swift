//
//  iTunesTableViewCell.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class iTunesTableViewCell: UITableViewCell {
    
    let logoImageView = LogoImageView(frame: .zero)
    let productNameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .center
    }
    let downloadButton = DownLoadButton().then {
        $0.backgroundColor = .systemGray5
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
    let avgLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14)
    }
    let starStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 5
    }
    
    let artistLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
    }
    let genreLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .right
    }
    let detailStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillProportionally
        $0.spacing = 20
    }
    
    let imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout()).then {
        $0.register(iTunesCollectionViewCell.self, forCellWithReuseIdentifier: iTunesCollectionViewCell.identifier)
    }

    static let identifier = "SearchTableViewCell"
    
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    static func collectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 4
        let width = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: width / 2, height: 250)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 10, left: 4, bottom: 0, right: 4)
        layout.scrollDirection = .horizontal
        
        return layout
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
        
        [starImageView, avgLabel].forEach { item in
            starStackView.addArrangedSubview(item)
        }
        
        [starStackView, artistLabel, genreLabel].forEach { item in
            detailStackView.addArrangedSubview(item)
        }
        
        contentView.addSubview(detailStackView)
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
            make.height.equalTo(30)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoImageView.snp.trailing).offset(10)
            make.centerY.equalTo(logoImageView.snp.centerY)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-30)
            make.height.equalTo(20)
        }
        
        detailStackView.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(10)
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
        }
        
        starImageView.snp.makeConstraints { make in
            make.size.equalTo(18)
        }
        
        avgLabel.snp.makeConstraints { make in
            make.width.equalTo(35)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
        }
    }
    
}
