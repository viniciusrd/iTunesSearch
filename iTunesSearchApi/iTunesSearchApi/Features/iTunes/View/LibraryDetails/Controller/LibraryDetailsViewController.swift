//
//  LibraryDetailsViewController.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit

class LibraryDetailsViewController: BaseViewController<LibraryDetailsViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = "Details"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
}
