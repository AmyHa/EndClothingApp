//
//  DetailViewController.swift
//  EndClothingApp
//
//  Created by Amy Ha on 13/06/2022.
//

import UIKit

class DetailViewController: UIViewController {

    var addToCartButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpUI()
    }
    
    private func setUpUI() {
        setUpAddToCartButton()
    }
    
    private func setUpAddToCartButton() {
        addToCartButton.setTitle("ADD TO CART", for: .normal)
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.backgroundColor = .black
        view.addSubview(addToCartButton)
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addToCartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addToCartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addToCartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
