//
//  NewsCell.swift
//  NYCTopStories
//
//  Created by Margiett Gil on 2/10/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit // // made a swift file
import ImageKit

class NewsCell: UICollectionViewCell{
    // image view of the article
    // title of article
    // abstract of article
    
    public lazy var newsImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo")
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .blue // just to test it
        return iv
    }() //this is a function call that creates and calls it at the same time
    
    public lazy var articleTitle: UILabel = {
        let label = UILabel() // don't forget the () at the end of each type !!
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline) // better to make them dynamic so that why it increases with the setting on the phone
        label.text = "Article Title"
        return label
    }()
    public lazy var abstractHeadline: UILabel = {
        let label = UILabel() // DON'T FORGET THE () AT THE END OF EACH TYPE
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .subheadline) // better to make them dynamic so that why it inscreases with the setting on the phone
        label.text = "Abstract Headline"
       
        return label
    }()
    // create custom view method that we created
    override init(frame: CGRect) {
        super.init(frame: frame) // it is of type frame because it is not taking up the entire screen
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        setUpNewsImageViewConstraints()
        setUpArticleTitleConstraint()
        setUpabstractHeadlineConstraints()
        
    }
    private func setUpNewsImageViewConstraints() {
        addSubview(newsImageView)
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // want some padding
            // with cell constraints there is no need for safe area constraints
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            //top is postive because we are going down
            // i want some padding because it shouldnt be touching it ... should haveh some distance
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            newsImageView.heightAnchor.constraint(equalTo: heightAnchor, constant: 0.50),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor)
        ])
    } // the end of image constraints
    private func setUpArticleTitleConstraint(){
        addSubview(articleTitle)
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            articleTitle.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            articleTitle.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 8),
            // padding of 8 from the trailing of thr image
            articleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            // label does not need a height... intrinct sizing
        ])
        
    } // end of setUp
    
    private func setUpabstractHeadlineConstraints() {
        addSubview(articleTitle)
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // want the leading of the abstract headline to be EQUAL to the leading of the article title ...
            articleTitle.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 8), // it is positive 8 because we are going down.
            articleTitle.leadingAnchor.constraint(equalTo: articleTitle.leadingAnchor),
            articleTitle.trailingAnchor.constraint(equalTo: articleTitle.trailingAnchor)
           
        
        ])
        
    } // end of setUp of headlines
    
    private func configureCell(with article: Article) {
        articleTitle.text = article.title
        abstractHeadline.text = article.abstract

// image formats
        /*
         superJombo
         thumbLarge
         */
        // want 200 by 200 at most for a thumb image
        newsImageView.getImage(with: article.getArticleImageURl(for: .thumbLarge)) { [weak self] result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    // at this point we are here showing that
                    self?.newsImageView.image = UIImage(systemName: "exclamationmark-octagon")
                    print("This is the reason why \(error)")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.newsImageView.image = image
                }
            }
            
        }
        
    }
}
