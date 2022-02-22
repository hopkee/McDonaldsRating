//
//  Meal.swift
//  McDonaldsRatingApp
//
//  Created by Valya on 21.02.22.
//

import UIKit

struct Meal {
    
    var name: String
    var price: Double
    var image: UIImage?
    var description: String
    var weight: Int
    var calories: Int
    
    var feedbacks: [Feedback] = []
    
    private var rating: Double? {
        if feedbacks.isEmpty {
            return nil
        } else {
            var sum: Double = 0
            for feedback in feedbacks {
                sum += feedback.mark
            }
            return sum / Double(feedbacks.count)
        }
    }
    
    var ratingBar: String {
        if let rating = rating {
            return String(repeating: "⭐", count: Int(rating.rounded(.up))) + "(" + String(feedbacks.count) + ")"
        } else {
            return "Нет отзывов"
        }
    }
    
}

struct Feedback {
    
    let authorName: String
    private let date = Date()
    let mark: Double
    let textReview: String
    let likes: Int?
    
    var ratingBar: String {
        return String(repeating: "⭐", count: Int(mark.rounded(.up)))
    }
}
