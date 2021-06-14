//
//  Buttons.swift
//  Inkolors
//
//  Created by Gui Reis on 03/06/21.
//

import UIKit

class Ink {
    let inks:[UIImage] = [#imageLiteral(resourceName: "Tinta-5"), #imageLiteral(resourceName: "Tinta-3"), #imageLiteral(resourceName: "Tinta-1"), #imageLiteral(resourceName: "Tinta-4"), #imageLiteral(resourceName: "Tinta-6"), #imageLiteral(resourceName: "Tinta-2")]
    var img:UIImage
    var imgView:UIImageView
    var color:UIColor
    var constraints:[NSLayoutConstraint] = []
    
    init(num:Int, color:UIColor) {
        self.color = color
        self.img = self.inks[num]
        
        self.imgView = UIImageView(image: self.img)
        self.imgView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        self.imgView.clipsToBounds = true
        self.imgView.contentMode = .scaleToFill
        //self.imgView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.imgView.isUserInteractionEnabled = true
        self.imgView.image = self.imgView.image?.withRenderingMode(.alwaysTemplate)
        self.imgView.tintColor = self.color
        
        let constant:CGFloat = 70
        self.imgView.translatesAutoresizingMaskIntoConstraints = false
        self.imgView.widthAnchor.constraint(equalToConstant: constant).isActive = true
        self.imgView.heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func getView() -> UIImageView {return self.imgView}
    
    public func getColor() -> UIColor {return self.color}
    
    public func setConstraints(l:[NSLayoutConstraint]) {self.constraints = l}
    
    public func activateConstraints() {NSLayoutConstraint.activate(self.constraints)}
}
