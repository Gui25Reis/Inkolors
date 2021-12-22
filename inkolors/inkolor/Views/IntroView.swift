//
//  MenuView.swift
//  inkolor
//
//  Created by Gui Reis on 16/06/21.
//

import UIKit

class IntroView: UIView {
    var buttonHome: UIButton = UIButton()
    var buttonNext: UIButton = UIButton()
    var titleLabel: UILabel = UILabel()
    var infoLabel: UILabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        // Botões
        self.buttonHome = Buttons().getHomeButton()
        self.addSubview(self.buttonHome)
        
        self.buttonNext = Buttons().getNextButton(sizeFont: 40, 80)
        self.addSubview(self.buttonNext)
        
        
        // Labels
        self.titleLabel = self.setLabel(sizeFont: self.bounds.height * 0.035, align: NSTextAlignment.center, w: .bold)
        self.addSubview(self.titleLabel)
        
        self.infoLabel = self.setLabel(sizeFont: self.bounds.height * 0.03, align: NSTextAlignment.left, w: .regular)
        self.addSubview(self.infoLabel)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func setLabel(sizeFont:CGFloat, align:NSTextAlignment, w:UIFont.Weight) -> UILabel{
        let lbl:UILabel = UILabel()
        lbl.textAlignment = align
        lbl.font = .systemFont(ofSize: sizeFont, weight: w)
        lbl.numberOfLines = 5
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    public func getButtonHome() -> UIButton {return self.buttonHome}
    
    public func getButtonNext() -> UIButton {return self.buttonNext}
    
    public func getTitleLabel() -> UILabel {return self.titleLabel}
    
    public func getInfoLabel() -> UILabel {return self.infoLabel}
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Home button (view)
        self.buttonHome.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.070).isActive = true
        self.buttonHome.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
                
        
        // Next button (view)
        self.buttonNext.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.buttonNext.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * -0.15).isActive = true
        
        
        // Title
        self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.26).isActive = true

        
        // Info text
        self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 55).isActive = true
        self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -55).isActive = true
        self.infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.45).isActive = true
    }
}
