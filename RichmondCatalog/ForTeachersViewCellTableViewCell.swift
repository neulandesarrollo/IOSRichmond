//
//  ForTeachersViewCellTableViewCell.swift
//  RichmondCatalog
//
//  Created by GrupoNeu on 10/10/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class ForTeachersViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var imgForTeachers: UIImageView!
    @IBOutlet weak var titleTeachers: UILabel!
    @IBOutlet weak var descriptionTeachers: UILabel!
    @IBOutlet weak var titleISBN: UILabel!
    @IBOutlet weak var subISBN: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
