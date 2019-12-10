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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
