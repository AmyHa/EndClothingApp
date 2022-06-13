//
//  UIButtonExtension.swift
//  EndClothingApp
//
//  Created by Amy Ha on 13/06/2022.
//
import UIKit

extension UIButton {
    var titleLabelFont: UIFont! {
        get { return self.titleLabel?.font }
        set { self.titleLabel?.font = newValue }
    }
}
