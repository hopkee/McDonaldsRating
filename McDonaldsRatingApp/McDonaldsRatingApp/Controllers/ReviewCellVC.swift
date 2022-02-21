//
//  ReviewCellVC.swift
//  McDonaldsRatingApp
//
//  Created by Valya on 22.02.22.
//

import UIKit

class ReviewCellVC: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var reviewText: UILabel!
    @IBOutlet weak var ratingBarLbl: UILabel!
    @IBOutlet weak var likesLbl: UILabel!
    
    @IBAction func likeBtn(_ sender: UIButton) {
        if likesLbl.isHidden == false {
            likesLbl.isHidden = true
            return
        }
        likesLbl.isHidden = false
        let likesCounter = 1
        likesLbl.text = String(likesCounter)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
