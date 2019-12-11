//
//  LibraryDetailsViewController.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit

class LibraryDetailsViewController: BaseViewController<LibraryDetailsViewModel> {
    
    @IBOutlet weak var scroolView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentStackView: UIStackView!
    
    @IBOutlet weak var ivCoverBook: UIImageView!
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tvSubtitle: UILabel!
    @IBOutlet weak var tvAverage: UILabel!
    
    @IBOutlet weak var tvDescription: UILabel!
    @IBOutlet weak var tvReleased: UILabel!
    @IBOutlet weak var tvGenre: UILabel!
    @IBOutlet weak var tvLanguage: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    override func setupUI() {
        let book = viewModel.book
        if let posterURL =  book.artworkUrl100 {
            ivCoverBook.setImageFromURL(toUrl: posterURL, completion: { (complete) in
            })
        }
        tvTitle.text = book.trackName
        tvSubtitle.text = book.artistName
        tvAverage.text = "\(book.averageUserRating ?? 0.0) %"
        tvDescription.text = book.description
        tvReleased.text = book.releaseDate
        tvGenre.text = book.genres?.first
        tvLanguage.text = book.formattedPrice
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = viewModel.headerText
    }
    
    @IBAction func didTapViewInApple(_ sender: UIButton) {
    }
    
}
