//
//  LibraryTableViewCell.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    @IBOutlet weak var ivCoverBook: UIImageView!
    @IBOutlet weak var tvTitleBook: UILabel!
    @IBOutlet weak var tvSubTitle: UILabel!
    @IBOutlet weak var tvAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ivCoverBook.image = nil
        tvTitleBook.text = nil
        tvAverage.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(withBook book: Book)  {
        if let posterURL =  book.artworkUrl100 {
            ivCoverBook.setImageFromURL(toUrl: posterURL, completion: { (complete) in
                DispatchQueue.main.async() {
                    if complete{
//                        self.aiLoading.stopAnimating()
//                        self.aiLoading.isHidden = true
                    }
                }
            })
        }
        
        tvTitleBook.text = book.trackName
        tvSubTitle.text = book.artistName
        tvAverage.text = "\(book.averageUserRating ?? 0.0) %"
    }
    
}
