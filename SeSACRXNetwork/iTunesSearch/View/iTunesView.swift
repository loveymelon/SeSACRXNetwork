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
    
    let tableView = UITableView().then {
        $0.register(iTunesTableViewCell.self, forCellReuseIdentifier: iTunesTableViewCell.identifier)
        $0.separatorStyle = .none
        $0.rowHeight = 100
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        addSubview(tableView)
    }
    
    override func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide.snp.edges)
        }
    }

}
