//
//  NewsFeedView.swift
//  NYCTopStories
//
//  Created by Margiett Gil on 2/6/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit


class NewsFeedView: UIView {
    
    public lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.autocapitalizationType = .none
        sb.placeholder = "search for article"
        return sb
    }()
    
    public lazy var collectionView: UICollectionView = {
        //create flow layout for collection view
        let layout = UICollectionViewLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero)
        return cv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func commonInit() {
        
    }
    private func commonInit(){
        setupCollectionView()
        setupSearchBarConstraints()
        
    }
    
    
    private func setupSearchBarConstraints(){
        //1.
        addSubview(searchBar)
        //2.
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        //3.
        //NSLayoutConstraints.active([
        
            
        ])
    }
    
    private func setupCollectionView(){
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
