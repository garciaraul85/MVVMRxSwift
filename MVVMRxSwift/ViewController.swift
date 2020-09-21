//
//  ViewController.swift
//  MVVMRxSwift
//
//  Created by Saulo Garcia on 9/20/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    private var viewModel: RestaurantsListViewModel!
    
    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyBoard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewConfiguration()
        fetchRestaurants()
    }
    
    func fetchRestaurants() {
        viewModel
            .fetchRestaurantViewModels()
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
                cell.textLabel?.text = viewModel.displayText
            }.disposed(by: disposeBag)
    }

    func setupTableViewConfiguration() {
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
