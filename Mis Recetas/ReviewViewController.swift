//
//  ReviewViewController.swift
//  Mis Recetas
//
//  Created by Luisa Fernanda Arango Valencia on 8/08/17.
//  Copyright © 2017 Luisa Fernanda Arango Valencia. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundIma: UIImageView!
    
    @IBOutlet weak var ratingStackView: UIStackView!
    var reitingSelecter : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // esto se hace para agregarle un efecto de opacidad a la imagen del modal
      /*
        let efecto = UIBlurEffect(style: .dark)
        let efectView = UIVisualEffectView(effect: efecto)
        efectView.frame = view.bounds
        backgroundIma.addSubview(efectView)*/
        
        ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0) //se oculta para despues ser animado
        
    }
    /*
     * Funcion para hacer una animacion
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0) //se muestra la animaciòn
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ratingPresent(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            reitingSelecter = "good"
        case 2:
            reitingSelecter = "great"
        case 3 :
            reitingSelecter = "dislike"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
        
    }
 

}
