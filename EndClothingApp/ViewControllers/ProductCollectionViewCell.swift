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
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholderImage")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Product Title"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    let colourLabel: UILabel = {
        let label = UILabel()
        label.text = "Colour"
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    let priceLabel: UILabel = {
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
        
        let titleLabelHeight = heightForView(text: titleLabel.text ?? "", width: contentView.frame.size.width-16)
        let imageViewHeight = contentView.frame.size.height*(2/3)
        imageView.frame = CGRect(x: 8, y: 0, width: contentView.frame.size.width-16, height: imageViewHeight)
        titleLabel.frame = CGRect(x: 8, y: imageViewHeight, width: contentView.frame.size.width-16, height: titleLabelHeight)
        colourLabel.frame = CGRect(x: 8, y: imageViewHeight + titleLabelHeight, width: contentView.frame.size.width-16, height: 20)
        priceLabel.frame = CGRect(x: 8, y: imageViewHeight + titleLabelHeight + 20, width: contentView.frame.size.width-16, height: 20)
    }
}
