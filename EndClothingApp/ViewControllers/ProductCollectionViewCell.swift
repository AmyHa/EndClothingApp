//
//  ProductCollectionViewCell.swift
//  EndClothingApp
//
//  Created by Amy Ha on 12/06/2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductCollectionViewCell"
    

    func heightForView(text:String, width:CGFloat) -> CGFloat{
       let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
       label.numberOfLines = 0
       label.lineBreakMode = NSLineBreakMode.byWordWrapping
       label.text = text

       label.sizeToFit()
       return label.frame.height
   }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a super super long long long long Product Title"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let colourLabel: UILabel = {
        let label = UILabel()
        label.text = "Colour"
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "£X"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(colourLabel)
        contentView.addSubview(priceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let titleLabelHeight = heightForView(text: titleLabel.text ?? "", width: contentView.frame.size.width)
        priceLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-20, width: contentView.frame.size.width-10, height: 20)
        colourLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-40, width: contentView.frame.size.width-10, height: 20)
        titleLabel.frame = CGRect(x: 5, y: contentView.frame.size.height-40-titleLabelHeight, width: contentView.frame.size.width-10, height: titleLabelHeight)
    }
}
