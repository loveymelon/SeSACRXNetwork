//
//  iTunesView.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import UIKit
import SnapKit
import Then

class iTunesView: BaseView {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBar: UISearchBar { return searchController.searchBar }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {

    }
    
    override func configureLayout() {

    }

}
