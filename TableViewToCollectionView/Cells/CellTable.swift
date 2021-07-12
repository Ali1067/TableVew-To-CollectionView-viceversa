//
//  CellTable.swift
//  TableViewToCollectionView
//
//  Created by Muhammad Ali on 12/07/2021.
// //  Ali1067@outlook.com 0092-331-2611993

import UIKit

class CellTable: UITableViewCell {
    
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none

        // Configure the view for the selected state
    }

}
