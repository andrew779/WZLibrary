//
//  ViewController.swift
//  WZLibrary
//
//  Created by andrew779 on 03/19/2017.
//  Copyright (c) 2017 andrew779. All rights reserved.
//

import UIKit
import WZLibrary

 class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var menuButton: UIButton!

    let transition = WZCircularTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }


    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!

        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!

        return transition
    }
 }
