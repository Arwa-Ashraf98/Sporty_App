//
//  EX+UIView.swift
//  SportsApp
//
//  Created by Mohamed on 24/05/2023.
//

import UIKit

extension UIView {
    func addBorderAndColor(_ cornerRaduis: CGFloat,_ borderWidth: CGFloat,_ color: UIColor) {
        self.layer.cornerRadius = cornerRaduis
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
}
