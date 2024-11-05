//
//  OneTapViewController.swift
//  TappingTesting
//
//  Created by Germán Santos Jaimes on 05/11/24.
//

import UIKit

class OneTapViewController: UIViewController {

    // MARK: - Declaración de propiedades
    var tappedView: UIView!
    var touchedView = true
    
    
    // MARK: - Ciclo de vida de la aplicación
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tappedView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200) )
        tappedView.backgroundColor = .cyan
        tappedView.center = view.center
        
        view.addSubview(tappedView)
        
        // Agregamos un Tap Gesture Recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(didTap(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tappedView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTap(_ sender: UITapGestureRecognizer){
        if touchedView{
            tappedView.backgroundColor = .red
            touchedView = false
        }else{
            tappedView.backgroundColor = .cyan
            touchedView = true
            
        }
    }

}
