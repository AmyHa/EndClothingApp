//
//  ProductListViewController.swift
//  EndClothingApp
//
//  Created by Amy Ha on 10/06/2022.
//

import UIKit

class ProductListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var numberOfItemsLabel = UILabel()
    var numberOfItems: Int?
    
    let numberOfCols = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpUI()
    }
    
    private func setUpUI() {
        
        setUpNumberOfItemsLabel()
        setUpCollectionView()
    }
     
    private func setUpNumberOfItemsLabel() {
        numberOfItemsLabel.text = numberOfItems != nil ? "\(numberOfItems) items" : "Items"
        numberOfItemsLabel.textColor = .black
        numberOfItemsLabel.textAlignment = .center
        
        view.addSubview(numberOfItemsLabel)
        numberOfItemsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfItemsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            numberOfItemsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            numberOfItemsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: numberOfItemsLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spaceBetweenCells = 10
        let totalInsetSpace = spaceBetweenCells*(numberOfCols - 1)
        let availableWidth = collectionView.frame.width - CGFloat(totalInsetSpace)
        let widthPerItem = availableWidth / CGFloat(numberOfCols)
        return CGSize(width:  widthPerItem, height: collectionView.frame.size.height / 2)
    }
}
