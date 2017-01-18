//
//  SearchTableViewCell.swift
//  RichmondCatalog
//
//  Created by GrupoNeu on 11/10/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var imgSearch: UIImageView!
    @IBOutlet weak var titleSearch: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
