//
//  HomeBottomControlsStackView.swift
//  SwipeMatchFirestore
//
//  Created by Ahmed Essmat on 05/03/2021.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let subviews = [#imageLiteral(resourceName: "refresh_circle"), #imageLiteral(resourceName: "dismiss_circle"), #imageLiteral(resourceName: "super_like_circle"), #imageLiteral(resourceName: "like_circle"), #imageLiteral(resourceName: "boost_circle")].map { (image) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        
        subviews.forEach { (v) in
            addArrangedSubview(v)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
