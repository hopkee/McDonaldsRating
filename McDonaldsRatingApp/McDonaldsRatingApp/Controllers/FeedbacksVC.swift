//
//  ViewController3.swift
//  McDonaldsRatingApp
//
//  Created by Valya on 21.02.22.
//

import UIKit

class FeedbacksVC: UIViewController {

    var indexSelectedRow: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ReviewCellVC", bundle: nil), forCellReuseIdentifier: "ReviewCellVC")
    }

}

extension FeedbacksVC: UITableViewDelegate {
    
}

extension FeedbacksVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let indexOfMeal = indexSelectedRow {
            return DataManager.shared.meals[indexOfMeal].feedbacks.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCellVC", for: indexPath) as? ReviewCellVC
        if let indexOfRow = indexSelectedRow {
            cell?.nameLbl.text = DataManager.shared.meals[indexOfRow].feedbacks[indexPath.row].authorName
            cell?.ratingBarLbl.text = String(repeating: "⭐", count: Int(DataManager.shared.meals[indexOfRow].feedbacks[indexPath.row].mark.rounded(.up)))
            cell?.reviewText.text = DataManager.shared.meals[indexOfRow].feedbacks[indexPath.row].textReview
            cell?.likesLbl.isHidden = true
        }
        return cell!
    }
    
    
}
