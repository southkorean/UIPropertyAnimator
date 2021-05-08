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
        planetImageView.alpha = 0.0
        planetImageView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    }
    
    func configureEndAnimations() {
        animator.addAnimations {
            self.planetImageView.alpha = 1.0
            self.planetImageView.transform = CGAffineTransform(scaleX: 3, y: 3)
        }
    }

    @IBAction func valueDidChange(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
        
    }
}

