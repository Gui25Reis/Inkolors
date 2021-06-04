//
//  Buttons.swift
//  Inkolors
//
//  Created by Gui Reis on 03/06/21.
//

import UIKit

class Circule {
    let view:UIView
    var color:UIColor
    
    init(size:CGFloat, color:UIColor, corner:CGFloat) {
        self.view = UIView()
        self.color = color
        self.view.backgroundColor = color
        self.view.layer.cornerRadius = corner
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.widthAnchor.constraint(equalToConstant: size).isActive = true
        self.view.heightAnchor.constraint(equalToConstant: size).isActive = true
    }
        
    public func getColor() -> UIColor {return self.color}
    public func setColor(c:UIColor) {
        self.color = c
        self.view.backgroundColor = self.color
    }
    
    public func getView() -> UIView {return self.view}
}
