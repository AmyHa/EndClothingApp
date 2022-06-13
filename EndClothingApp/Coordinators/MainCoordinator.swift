//
//  MainCoordinator.swift
//  EndClothingApp
//
//  Created by Amy Ha on 13/06/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var tabBarController: UITabBarController
    
    let searchVewController = ProductListViewController()
    let savedViewController = ProductListViewController()
    let productListViewController = ProductListViewController()
    let accountViewController = ProductListViewController()
    let bagViewController = ProductListViewController()
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
        productListViewController.coordinator = self
        
        let searchItem = UITabBarItem(title: "", image: UIImage(systemName: "doc.text.magnifyingglass"), selectedImage: UIImage(systemName: "doc.text.magnifyingglass")?.withRenderingMode(.alwaysOriginal))
        
        // For a strange reason, the bookmark symbol is red by default when selected, so I had to specify it to be black
        let savedItem = UITabBarItem(title: "", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark")?.withTintColor(UIColor.black).withRenderingMode(.alwaysOriginal))
        
        // Note: in the task app design, the middle tab bar item looks like it is an image of the logo "END.", which I can't find a reasonable replacement for, so I have used a filled square instead
        let productListItem = UITabBarItem(title: "", image: UIImage(systemName: "square.fill"), selectedImage: UIImage(systemName: "square.fill")?.withRenderingMode(.alwaysOriginal))
        let accountItem = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal))
        let bagItem = UITabBarItem(title: "", image: UIImage(systemName: "bag"), selectedImage: UIImage(systemName: "bag")?.withRenderingMode(.alwaysOriginal))
        
        searchVewController.tabBarItem = searchItem
        savedViewController.tabBarItem = savedItem
        productListViewController.tabBarItem = productListItem
        accountViewController.tabBarItem = accountItem
        bagViewController.tabBarItem = bagItem
        
        let controllers = [searchVewController, savedViewController, productListViewController, accountViewController, bagViewController]
        tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        tabBarController.selectedIndex = 2
    }
    
    func moveToDetailViewController(of product: Product) {
        let detailViewController = DetailViewController(product: product)
        productListViewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
