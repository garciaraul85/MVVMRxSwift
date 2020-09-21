//
//  ViewController.swift
//  MVVMRxSwift
//
//  Created by Saulo Garcia on 9/20/20.
//

import UIKit

class ViewController: UIViewController {

    static func instantiate() -> ViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyBoard.instantiateInitialViewController() as! ViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

