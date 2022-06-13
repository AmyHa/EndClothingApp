//
//  DetailViewController.swift
//  EndClothingApp
//
//  Created by Amy Ha on 13/06/2022.
//

import UIKit

class DetailViewController: UIViewController {

    var addToCartButton = UIButton()
    var colourLabel = UILabel()
    var priceLabel = UILabel()
    
    var product: Product?
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpUI()
    }
    
    private func setUpUI() {
        self.title = "\(product!.name)".uppercased()
        setUpAddToCartButton()
        setUpColourLabel()
        setUpPriceLabel()
    }
    
    private func setUpAddToCartButton() {
        addToCartButton.setTitle("ADD TO CART", for: .normal)
        addToCartButton.titleLabelFont = UIFont(name: "OpenSans-Bold", size: 15)
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
    
    private func setUpColourLabel() {
        colourLabel.text = "Yellow".uppercased()
        colourLabel.textAlignment = .center
        colourLabel.textColor = .gray
        view.addSubview(colourLabel)
        colourLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colourLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colourLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colourLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpPriceLabel() {
        priceLabel.text = product?.price
        priceLabel.textAlignment = .center
        view.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: colourLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
