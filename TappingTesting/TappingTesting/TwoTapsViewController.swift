//
//  TwoTapsViewController.swift
//  TappingTesting
//
//  Created by Germán Santos Jaimes on 05/11/24.
//

import UIKit

class TwoTapsViewController: UIViewController {

    // MARK: - Declaración de propiedades
    var tappedView: UIView!
    var touchedView = true
    
    
    // MARK: - Ciclo de vida de la aplicación
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tappedView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200) )
        tappedView.backgroundColor = .black
        tappedView.center = view.center
        
        view.addSubview(tappedView)
        
        // Agregamos un Tap Gesture Recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(didTap(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 2
        tappedView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTap(_ sender: UITapGestureRecognizer){
        if touchedView{
            UIView.animate(withDuration: 1, animations: {
                self.tappedView.layer.cornerRadius = 50
                self.tappedView.backgroundColor = .red
            })
            
            touchedView = false
        }else{
            UIView.animate(withDuration: 1, animations: {
                self.tappedView.layer.cornerRadius = 0
                self.tappedView.backgroundColor = .black
            })
            
            touchedView = true
            
        }
    }


}
