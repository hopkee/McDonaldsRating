//
//  ViewController2.swift
//  McDonaldsRatingApp
//
//  Created by Valya on 21.02.22.
//

import UIKit

class MealDetailViewVC: UIViewController {

    var selectedIndexRow: Int?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var mealNameLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var allReviews: UIButton!
    
    @IBAction func addNewFeedback(_ sender: UIButton) {
        performSegue(withIdentifier: "AddNewFeedbackVC", sender: nil)
    }
    
    @IBAction func showAllReviews(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowAllReviews", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        if let row = selectedIndexRow {
            imageView.image = DataManager.shared.meals[row].image
            priceLbl.text = String(DataManager.shared.meals[row].price) + " BYN"
            mealNameLbl.text = DataManager.shared.meals[row].name
            navigationItem.title = DataManager.shared.meals[row].name
            ratingLbl.text = DataManager.shared.meals[row].ratingBar
            weightLbl.text = String(DataManager.shared.meals[row].weight) + " г"
            caloriesLbl.text = String(DataManager.shared.meals[row].calories) + " кКал"
            descriptionLbl.text = DataManager.shared.meals[row].description
            if DataManager.shared.meals[row].feedbacks.count != 0 {
                allReviews.isHidden = false
            } else {
                allReviews.isHidden = true
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let listOfReviews = segue.destination as? AddNewFeedbackVC {
                listOfReviews.indexSelectedRow = selectedIndexRow
                listOfReviews.completionReloadData = {
                self.setUI()
            }
        }
        if let feedbacksVC = segue.destination as? FeedbacksVC {
            feedbacksVC.indexSelectedRow = selectedIndexRow
        }
    }
    

}
