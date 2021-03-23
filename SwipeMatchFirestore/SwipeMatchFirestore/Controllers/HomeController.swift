//
//  ViewController.swift
//  SwipeMatchFirestore
//
//  Created by Ahmed Essmat on 02/03/2021.
//

import UIKit

class HomeController: UIViewController {
    
    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let buttonsStackView = HomeBottomControlsStackView()
    

    let cardViewModel: [CardViewModel] = {
        let producers = [
            Advertiser(title: "Slide Out Of Menu", brandName: "Slide Out Of Menu", posterPhotoName: "image-test"),
            User(name: "Ali", age: 22, profession: "Web Developer", imageNames: ["image-test2-1", "image-test2-2", "image-test2-3"]),
            User(name: "Hossam", age: 22, profession: "Flutter Developer", imageNames: ["image-test3-1", "image-test3-2"]),
            
            User(name: "Ahmed", age: 21, profession: "iOS Developer", imageNames: ["image-test1-1", "image-test1-2", "image-test1-3"])
            
        ] as [ProducesCardViewModel]
        
        let viewModels = producers.map({return $0.toCardViewModel()})
        return viewModels
    }()
        
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topStackView.settingsButton.addTarget(self, action: #selector(handelSetting), for: .touchUpInside)
       
        
        setupLayout()
        setupDummyCards()
    }
    
    @objc func handelSetting() {
        print("show registration page")
        let registrationController = RegistrationViewController()
        present(registrationController, animated: true, completion: nil)
    }
    
    fileprivate func setupDummyCards() {
        cardViewModel.forEach { (cardViewModel) in
            let cardView = CardView(frame: .zero)
            cardView.cardViewModel = cardViewModel
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }

     }

    
    // MARK:- Fileprivate
    
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonsStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        overallStackView.bringSubviewToFront(cardsDeckView)
    }

}


