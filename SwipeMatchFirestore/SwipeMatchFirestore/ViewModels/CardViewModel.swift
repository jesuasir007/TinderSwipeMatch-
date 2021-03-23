//
//  CardViewModel.swift
//  SwipeMatchFirestore
//
//  Created by Ahmed Essmat on 14/03/2021.
//

import UIKit


protocol ProducesCardViewModel {
    func toCardViewModel () -> CardViewModel
}
class CardViewModel {
    //We'll define the properties that are view will display / render out
    let imageNames: [String]
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
    
    init(imageNames: [String], attributedString: NSAttributedString, textAlignment: NSTextAlignment) {
        self.imageNames = imageNames
        self.attributedString = attributedString
        self.textAlignment = textAlignment
    }
    
    fileprivate var imageIndex = 0 {
        didSet {
            let imageName = imageNames[imageIndex]
            let image = UIImage(named:imageName)
            imageIndexObserve?( imageIndex, image)
        }
    }
    
    // Reative Programming
    var imageIndexObserve: ( (Int, UIImage?) -> ())?
    
    func advanceToNextPhoto() {
        imageIndex = min(imageIndex + 1, imageNames.count - 1)
    }
    func goToPreviousPhoto() {
        imageIndex = max(0, imageIndex - 1 )
    }
}
