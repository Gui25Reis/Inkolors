//
//  MenuView.swift
//  inkolor
//
//  Created by Gui Reis on 16/06/21.
//

import UIKit

class PrizeView: UIView {
    var buttonHome: UIButton = UIButton(frame: .zero)
    var buttonNext: UIButton = UIButton(frame: .zero)
    var buttonRestart: UIButton = UIButton(frame: .zero)
    
    var currentLevel:Int = 0
    
    
    let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 1, green: 0.98, blue: 0.94, alpha: 1.0)
        v.layer.cornerRadius = 24
        return v
    }()
    
    var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let medalImage:UIImageView = {
        let imgView:UIImageView = UIImageView()
        imgView.layer.masksToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .gray
        self.addSubview(container)
        
        // Botões
        self.buttonHome = Buttons().getHomeButton()
        self.container.addSubview(self.buttonHome)
        
        self.buttonRestart = Buttons().getRestartButton()
        self.container.addSubview(self.buttonRestart)
        
        self.buttonNext = Buttons().getNextButton()
        self.container.addSubview(self.buttonNext)
        
        
        // Labels
        self.container.addSubview(self.titleLabel)
        
        self.container.addSubview(self.medalImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func getButtonHome() -> UIButton {return self.buttonHome}
    
    public func getButtonNext() -> UIButton {return self.buttonNext}
    
    public func getButtonRestart() -> UIButton {return self.buttonRestart}
    
    public func getTitleLabel() -> UILabel {return self.titleLabel}
    
    public func setTitleLabel(text:String) {self.titleLabel.text = text}
    
    public func getMedalImage() -> UIImageView {return self.medalImage}

    public func setCurrentLevel(level:Int) -> Void {
        self.currentLevel = level
        if (self.currentLevel == 2) {
            buttonNext.isHidden = true
            buttonNext.isEnabled = false
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // View em destaque
        self.container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        self.container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        
        
        // Title label
        self.titleLabel.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant:50).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        // Home button (view)
        self.buttonHome.bottomAnchor.constraint(equalTo: self.buttonRestart.bottomAnchor).isActive = true
        if (self.currentLevel == 2) {
            self.buttonHome.rightAnchor.constraint(equalTo: self.buttonRestart.leftAnchor, constant: -40).isActive = true
        }else{
            self.buttonHome.rightAnchor.constraint(equalTo: self.buttonRestart.leftAnchor, constant: -20).isActive = true
        }
        
        // Restart button (view)
        self.buttonRestart.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -50).isActive = true
        if (self.currentLevel == 2) {
            self.buttonRestart.centerXAnchor.constraint(equalTo: self.container.centerXAnchor, constant: 50).isActive = true
        }else{
            self.buttonRestart.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        }
        
        // Next button
        self.buttonNext.bottomAnchor.constraint(equalTo: self.buttonRestart.bottomAnchor).isActive = true
        self.buttonNext.leftAnchor.constraint(equalTo: self.buttonRestart.rightAnchor, constant: 20).isActive = true
        
        
        // Medalha
        self.medalImage.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 25).isActive = true
        self.medalImage.bottomAnchor.constraint(equalTo: self.buttonRestart.topAnchor, constant: -20).isActive = true
        self.medalImage.leadingAnchor.constraint(equalTo: self.container.leadingAnchor).isActive = true
        self.medalImage.trailingAnchor.constraint(equalTo: self.container.trailingAnchor).isActive = true
    }
}
