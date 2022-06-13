//
//  SceneDelegate.swift
//  EndClothingApp
//
//  Created by Amy Ha on 02/06/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        // Note: I am using the same VC to avoid creating a new view controller for each tab
        let searchVewController = ProductListViewController()
        let savedViewController = ProductListViewController()
        let productListViewController = ProductListViewController()
        let accountViewController = ProductListViewController()
        let bagViewController = ProductListViewController()
        
        let searchItem = UITabBarItem(title: "", image: UIImage(systemName: "doc.text.magnifyingglass"), selectedImage: UIImage(systemName: "doc.text.magnifyingglass"))
        let savedItem = UITabBarItem(title: "", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark"))
        
        // Note: in the task app design, the middle tab bar item looks like it is an image of the logo "END.", which I can't find a reasonable replacement for, so I have used a filled square instead
        let productListItem = UITabBarItem(title: "", image: UIImage(systemName: "square.fill"), selectedImage: UIImage(systemName: "square.fill"))
        let accountItem = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle"))
        let bagItem = UITabBarItem(title: "", image: UIImage(systemName: "bag"), selectedImage: UIImage(systemName: "bag"))
        
        searchVewController.tabBarItem = searchItem
        savedViewController.tabBarItem = savedItem
        productListViewController.tabBarItem = productListItem
        accountViewController.tabBarItem = accountItem
        bagViewController.tabBarItem = bagItem
        
        let tabBarController = UITabBarController()
        
        let controllers = [searchVewController, savedViewController, productListViewController, accountViewController, bagViewController]
        tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        tabBarController.selectedIndex = 2
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

