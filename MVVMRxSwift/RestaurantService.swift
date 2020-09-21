//
//  RestaurantService.swift
//  MVVMRxSwift
//
//  Created by Saulo Garcia on 9/20/20.
//

import Foundation
import RxSwift

class RestaurantService {
    
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create{ observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json")
            else {
                // Can't find the file
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create {}
            }
            
            // Read file
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                // format json into object
                let restaurants =  try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create {}
        }
    }
    
    func fetchRestaurantsRemote() -> Observable<[Restaurant]> {
        return Observable.create{ observer -> Disposable in
            let task = URLSession.shared.dataTask(with: URL(string: "url of service")!) {
                data, _, _ in
            
                guard let data = data
                else {
                    // Can't find the file
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return //Disposables.create {}
                }
                
                // Read file
                do {
//                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    // format json into object
                    let restaurants =  try JSONDecoder().decode([Restaurant].self, from: data)
                    observer.onNext(restaurants)
                } catch {
                    observer.onError(error)
                }
                
                
            }
            
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
