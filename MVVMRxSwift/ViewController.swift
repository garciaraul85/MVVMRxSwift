//
//  ViewController.swift
//  MVVMRxSwift
//
//  Created by Saulo Garcia on 9/20/20.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    static func instantiate() -> ViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyBoard.instantiateInitialViewController() as! ViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let service = RestaurantService()
        service
            .fetchRestaurants()
            .subscribe(onNext: { restaurants in
            print(restaurants)
        })
            .disposed(by: disposeBag)
    }


}

