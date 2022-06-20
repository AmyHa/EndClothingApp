//
//  UIFontExtension.swift
//  EndClothingApp
//
//  Created by Amy Ha on 20/06/2022.
//

import UIKit

extension UIFont {
    
    static func openSansBold(size: CGFloat = 15) -> UIFont? {
        return UIFont(name: "OpenSans-Bold", size: size)
    }
    
    static func openSansMedium(size: CGFloat = 15) -> UIFont? {
        return UIFont(name: "OpenSans-Medium", size: size)
    }
    
    static func outfitRegular(size: CGFloat = 15) -> UIFont? {
        return UIFont(name: "OpenSans-Regular", size: size)
    }
}
