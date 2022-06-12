//
//  ProductListViewController.swift
//  EndClothingApp
//
//  Created by Amy Ha on 10/06/2022.
//

import UIKit
import Combine
import SDWebImage

class ProductListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var viewModel = ProductListViewModel()
    private var products = [Product]()
    private var collectionView: UICollectionView!
    private var countLabel = UILabel()
    private var count: Int?
    private var cancellables: Set<AnyCancellable> = []
    
    let numberOfCols = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpUI()
        
        viewModel.$products
            .sink(receiveValue: { (result) in
                self.products = result
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })
            .store(in: &cancellables)
        
        viewModel.$count
            .sink(receiveValue: { (result) in
                self.count = result
                DispatchQueue.main.async {
                    self.countLabel.text = "\(self.count ?? 0) Items"
                }
            })
            .store(in: &cancellables)
    }
    
    private func setUpUI() {
        
        setUpNumberOfItemsLabel()
        setUpCollectionView()
    }
     
    private func setUpNumberOfItemsLabel() {
        countLabel.text = "\(count ?? 0) items"
        countLabel.textColor = .black
        countLabel.textAlignment = .center
        
        view.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
            collectionView.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        let imageURL = URL(string: products[indexPath.row].image)
        
        cell.imageView.sd_setImage(with: imageURL) { image, error, cacheType, downloadURL in
            if let error = error {
                print("Error downloading image: \(error)")
            }
        }
        cell.titleLabel.text = products[indexPath.row].name
        cell.priceLabel.text = products[indexPath.row].price
        cell.colourLabel.text = "Yellow"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spaceBetweenCells = 10
        let totalInsetSpace = spaceBetweenCells*(numberOfCols - 1)
        let availableWidth = collectionView.frame.width - CGFloat(totalInsetSpace)
        let widthPerItem = availableWidth / CGFloat(numberOfCols)
        return CGSize(width:  widthPerItem, height: collectionView.frame.size.height / 2)
    }
}
