//
//  DragViewController.swift
//  TappingTesting
//
//  Created by Germán Santos Jaimes on 05/11/24.
//

import UIKit

class DragViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for cardNumber in 0...2 {
            let cardView = UIView()
            
            switch cardNumber {
            case 0:
                cardView.backgroundColor = .systemTeal
            case 1:
                cardView.backgroundColor = .systemRed
            case 2:
                cardView.backgroundColor = .systemBlue
            default:
                break
            }
            
            cardView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
            view.addSubview(cardView)
            cardView.center = view.center
            
            cardView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleCardTapped)))
        }
    }
    
    @objc func handleCardTapped(_ gesture: UIPanGestureRecognizer){
        if let cardView = gesture.view {
                
            let point = gesture.translation(in: view)
            
            cardView.center = CGPoint(x: cardView.center.x + point.x, y: cardView.center.y + point.y)
            gesture.setTranslation(CGPoint.zero, in: view)
            cardView.layer.zPosition = 1
            
            if gesture.state == .ended {
                print("gesture ended")
            }
        }
    }
    

}
