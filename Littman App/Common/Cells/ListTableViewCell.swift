//
//  ListTableViewCell.swift
//  Littman App
//
//  Created by Littman Library on 8/8/22.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
