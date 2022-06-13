//
//  Coordinator.swift
//  EndClothingApp
//
//  Created by Amy Ha on 13/06/2022.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var tabBarController: UITabBarController { get set }
    
    func start()
}
