//
//  ViewController.swift
//  UIPropertyAnimator
//
//  Created by 김병철 on 2021/05/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var planetImageView: UIImageView!
    
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureInitialSetup()
        configureEndAnimations()
    }

    func configureInitialSetup() {
        planetImageView.alpha = 1.0
        planetImageView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    }
    
    func configureEndAnimations() {
        animator.addAnimations {
            self.planetImageView.alpha = 0.5
            self.planetImageView.transform = CGAffineTransform(scaleX: 20, y: 20)
        }
        
//        animator.addAnimations({
//            self.planetImageView.frame.origin.y -= 400
//        }, delayFactor: 0.5)
        
    }

    @IBAction func valueDidChange(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
        
    }
}

