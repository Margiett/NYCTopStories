//
//  NewsFeedViewController.swift
//  NYCTopStories
//
//  Created by Margiett Gil on 2/6/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    private let newsFeedView = NewsFeedView()
    
    override func loadView() {
        view = newsFeedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground //MARK: white when dark mode is off, and black when darkmode is on
        
        
        //MARK: setting up collection datasource and delegate
        newsFeedView.collectionView.dataSource = self
        newsFeedView.collectionView.delegate = self
        
        //MARK: register a collection view cell to make sure that we make the cell programticly
        newsFeedView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "articleCell")
      
    }
    
}

extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "articleCell", for: indexPath)
        
        //MARK: giving color to the cell
        cell.backgroundColor = .gray
        return cell
    }
}
extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.height
        let itemHeight: CGFloat = maxSize.height * 0.30
        return CGSize(width: itemWidth, height: itemHeight)
    }
    }

