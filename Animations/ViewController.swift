//
//  ViewController.swift
//  Animations
//
//  Created by Виталий Крюков on 27.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var redViewWidthConstraint: NSLayoutConstraint!

    var indexButtom = 1
        
    @IBAction func backButtom(_ sender: Any) {
        redView.layer.removeAllAnimations()
        
        indexButtom = indexButtom - 1
        
        if indexButtom < 1 {
            indexButtom = 7
        }
        
        buttom1.setTitle("\(indexButtom)", for: .normal)
    }
    
    @IBAction func nextButtom(_ sender: Any) {
        redView.layer.removeAllAnimations()

        if indexButtom < 7 {
        indexButtom = indexButtom + 1
        }
        else {
            indexButtom = 1
        }
        
        buttom1.setTitle("\(indexButtom)", for: .normal)
    }
    
    @IBOutlet weak var redView: UIView!

    @IBAction func buttom1(_ sender: Any) {
        redView.layer.removeAllAnimations()

        switch indexButtom {
        
        case 1:
            UIView.animate(withDuration: 2.0, animations: {
                self.redView.backgroundColor = .yellow
            }) { isCompeted in
                self.redView.backgroundColor = .red
            }
            
        case 2:
            UIView.animate(withDuration: 2.0, animations: {
                self.redView.frame.origin.y = 0
                self.redView.frame.origin.x = UIScreen.main.bounds.width - 150
            }) { isCompeted in
                self.redView.frame.origin.x = UIScreen.main.bounds.width / 2 - 75
                self.redView.frame.origin.y = 54
            }
            
        case 3:
            UIView.animate(withDuration: 2.0, animations: {
                self.redView.layer.cornerRadius = self.redView.frame.size.width / 2
            }) { isCompeted in
                self.redView.layer.cornerRadius = 0
            }
            
        case 4:
            UIView.animate(withDuration: 2.0, animations: {
                self.redView.transform = CGAffineTransform(rotationAngle: .pi)
            }) { isCompeted in
                self.redView.transform = CGAffineTransform(rotationAngle: 0)
            }
            
        case 5:
            UIView.animate(withDuration: 2.0, animations: {
                self.redView.alpha = 0
            }) { isCompeted in
                self.redView.alpha = 1
            }
                            			
        case 6:

            UIView.animate(withDuration: 2.0, delay: 0, options: [.autoreverse], animations: {
                
                self.redViewWidthConstraint.constant = self.redViewWidthConstraint.constant * sqrt(2)
                self.redViewHeightConstraint.constant = self.redViewHeightConstraint.constant * sqrt(2)
                self.view.layoutIfNeeded()

            }) { isCompeted in
                self.redViewWidthConstraint.constant = self.redViewWidthConstraint.constant / sqrt(2)
                self.redViewHeightConstraint.constant = self.redViewHeightConstraint.constant / sqrt(2)
                self.view.layoutIfNeeded()
            }

        case 7:
            UIView.animate(withDuration: 0.8, delay: 0, options: [.repeat], animations: {
                self.redView.transform = CGAffineTransform(rotationAngle: .pi / 2)
            })
            
        default:
            print("error")
        }
    }
 
    @IBOutlet var buttom1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

