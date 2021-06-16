//
//  MenuView.swift
//  inkolor
//
//  Created by Gui Reis on 16/06/21.
//

import UIKit

class IntroView: UIView {
    var buttonHome: UIButton = UIButton(frame: .zero)
    var bgButtonHome: UIView = UIView(frame: .zero)
    var buttonNext: UIButton = UIButton(frame: .zero)
    var bgButtonNext: UIView = UIView(frame: .zero)
    var titleLabel: UILabel = UILabel(frame: .zero)
    var infoLabel: UILabel = UILabel(frame: .zero)
    
    init() {
        super.init(frame: .zero)
        
        // Botões
        self.buttonHome = Buttons().getHomeButton()
        self.bgButtonHome = Buttons().getBg(bt: self.buttonHome)
        self.addSubview(self.bgButtonHome)
        
        self.buttonNext = Buttons().getNextButton(sizeFont: 40)
        self.bgButtonNext = Buttons().getBg(bt: self.buttonNext, 80)
        self.bgButtonNext.layer.cornerRadius = 40
        self.addSubview(self.bgButtonNext)
        
        
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
        self.bgButtonHome.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.070).isActive = true
        self.bgButtonHome.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
                
        
        // Next button (view)
        self.bgButtonNext.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.bgButtonNext.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * -0.15).isActive = true
        
        
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
