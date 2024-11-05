//
//  ViewController.swift
//  TappingTesting
//
//  Created by Germán Santos Jaimes on 04/11/24.
//

import UIKit

class ViewController: UIViewController{
    //MARK: -Declaración de vistas
    var cardView: UIView!
    var frontView: UIImageView! = {
        let fv = UIImageView(image: UIImage(named: "photo1"))
        fv.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        fv.contentMode = .scaleAspectFit
        return fv
    }()
    
    var backView: UIImageView! = {
        let fv = UIImageView(image: UIImage(named: "photo2"))
        fv.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        fv.contentMode = .scaleAspectFit
        return fv
    }()
    
    var daVuelta = true
    
    //MARK: -Ciclo de vida de la aplicación
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        cardView.backgroundColor = .red
        frontView.center = cardView.center
        cardView.addSubview(frontView)
        cardView.center = view.center
        view.addSubview(cardView)
        
        // creamos el tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        tap.numberOfTapsRequired = 1
        cardView.addGestureRecognizer(tap)
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        if daVuelta{
            UIView.transition(from: frontView,
                              to: backView,
                              duration: 1,
                              options: UIView.AnimationOptions.transitionFlipFromLeft,
                              completion: nil)
            daVuelta = false
        }else {
            UIView.transition(from: backView,
                              to: frontView,
                              duration: 1,
                              options: UIView.AnimationOptions.transitionFlipFromRight,
                              completion: nil)
            daVuelta = true
        }
    }


}

