//
//  listCell.swift
//  FilesApp
//
//  Created by Vishwanath Kota on 08/10/2019.
//  Copyright © 2019 Vishwanath Kota. All rights reserved.
//

import UIKit

class listCell: UITableViewCell {

    @IBOutlet weak var fileNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
