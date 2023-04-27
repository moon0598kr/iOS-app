//
//  GroupsTableViewCell.swift
//  AT&T
//
//  Created by Ipageon_김태형 on 2023/02/27.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
