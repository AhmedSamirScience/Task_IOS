//
//  PostTableViewCell.swift
//  test
//
//  Created by ahmed samir on 06/01/2024.
//

import UIKit

class PostTableViewCell: UITableViewCell {


    //MARK: - Outlet
    
    @IBOutlet weak var titlePostLBL: UILabel!
    
    @IBOutlet weak var bodyPostLBL: UILabel!
    
    @IBOutlet weak var idLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
