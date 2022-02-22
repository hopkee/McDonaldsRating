//
//  ViewController.swift
//  McDonaldsRatingApp
//
//  Created by Valya on 21.02.22.
//

import UIKit

class AddNewFeedbackVC: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var markBar: UISegmentedControl!
    @IBOutlet weak var addReviewOutlet: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    @IBAction func addReview(_ sender: UIButton) {
        if let index = indexSelectedRow,
           let text = textView.text {
        let mark = Double(markBar.selectedSegmentIndex + 1)
            DataManager.shared.meals[index].feedbacks.append(Feedback(authorName: "Валентин", mark: mark, textReview: text, likes: nil))
            }
        completionReloadData!()
        dismiss(animated: true, completion: nil)
    }
    
    var indexSelectedRow: Int?
    var completionReloadData: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count < 20 {
            warningLabel.isHidden = false
            addReviewOutlet.isEnabled = false
            return
        }
        warningLabel.isHidden = true
        addReviewOutlet.isEnabled = true
        
    }
    

}
