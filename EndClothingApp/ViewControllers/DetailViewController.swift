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
    var imageView = UIImageView()
    
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
        setUpProductImage()
    }
    
    private func setUpAddToCartButton() {
        addToCartButton.setTitle(Constants.addToCart, for: .normal)
        addToCartButton.titleLabelFont = UIFont(name: Constants.Font.openSansBold, size: 15)
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.backgroundColor = .black
        view.addSubview(addToCartButton)
        addToCartButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
        }
    }
    
    private func setUpColourLabel() {
        colourLabel.text = "Yellow".uppercased()
        colourLabel.textAlignment = .center
        colourLabel.textColor = .gray
        view.addSubview(colourLabel)
        colourLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
    }
    
    private func setUpPriceLabel() {
        priceLabel.text = product?.price
        priceLabel.textAlignment = .center
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(colourLabel.snp.bottom)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
    }
    
    private func setUpProductImage() {
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        
        if let url = product?.image {
            let imageURL = URL(string: url)
            
            imageView.sd_setImage(with: imageURL) { image, error, cacheType, downloadURL in
                if let error = error {
                    print("Error downloading image: \(error)")
                }
            }
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.equalTo(view.snp.height).dividedBy(3)
        }
    }
}
