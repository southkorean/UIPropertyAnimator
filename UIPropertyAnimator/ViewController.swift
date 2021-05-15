//
//  ViewController.swift
//  UIPropertyAnimator
//
//  Created by 김병철 on 2021/05/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var planetImageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureInitialSetup()
        configureEndAnimations()
        
        let attrString = NSAttributedString(
            string: "1",
            attributes: [
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeWidth: -2.0,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 80.0)
            ]
        )
        textLabel.attributedText = attrString
        
        Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(figureFunc), userInfo: nil, repeats: true)
    }

    func configureInitialSetup() {
        planetImageView.alpha = 1.0
        planetImageView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    }
    
    func configureEndAnimations() {
        animator.addAnimations {
            self.planetImageView.alpha = 1.0
            self.planetImageView.transform = CGAffineTransform(scaleX: 20, y: 20)
        }
        
//        animator.addAnimations({
//            self.planetImageView.frame.origin.y -= 400
//        }, delayFactor: 0.5)
        
    }

    @objc func figureFunc(){
        var r = Float.random(in: 0.1...0.6)
        print("값은 ? \(r)")
        animator.fractionComplete = CGFloat(r)
    }
    
    
    
    
    @IBAction func valueDidChange(_ sender: UISlider) {
        print(sender.value)
        animator.fractionComplete = CGFloat(sender.value)
        
    }
}

