//
//  MenuView.swift
//  inkolor
//
//  Created by Gui Reis on 16/06/21.
//

import UIKit

class PrizeView: UIView {
    var buttonHome: UIButton = UIButton(frame: .zero)
    var bgButtonHome: UIView = UIView(frame: .zero)
    var buttonNext: UIButton = UIButton(frame: .zero)
    var bgButtonNext: UIView = UIView(frame: .zero)
    var buttonRestart: UIButton = UIButton(frame: .zero)
    var bgButtonRestart: UIView = UIView(frame: .zero)
    
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
        self.bgButtonHome = Buttons().getBg(bt: self.buttonHome)
        self.container.addSubview(self.bgButtonHome)
        
        self.buttonRestart = Buttons().getRestartButton()
        self.bgButtonRestart = Buttons().getBg(bt: self.buttonRestart)
        self.container.addSubview(self.bgButtonRestart)
        
        self.buttonNext = Buttons().getNextButton()
        self.bgButtonNext = Buttons().getBg(bt: self.buttonNext)
        self.container.addSubview(self.bgButtonNext)
        
        
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
            bgButtonNext.isHidden = true
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
        self.bgButtonHome.bottomAnchor.constraint(equalTo: self.bgButtonRestart.bottomAnchor).isActive = true
        if (self.currentLevel == 2) {
            self.bgButtonHome.rightAnchor.constraint(equalTo: self.bgButtonRestart.leftAnchor, constant: -40).isActive = true
        }else{
            self.bgButtonHome.rightAnchor.constraint(equalTo: self.bgButtonRestart.leftAnchor, constant: -20).isActive = true
        }
        
        // Restart button (view)
        self.bgButtonRestart.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -50).isActive = true
        if (self.currentLevel == 2) {
            self.bgButtonRestart.centerXAnchor.constraint(equalTo: self.container.centerXAnchor, constant: 50).isActive = true
        }else{
            self.bgButtonRestart.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        }
        
        // Next button
        self.bgButtonNext.bottomAnchor.constraint(equalTo: self.bgButtonRestart.bottomAnchor).isActive = true
        self.bgButtonNext.leftAnchor.constraint(equalTo: self.bgButtonRestart.rightAnchor, constant: 20).isActive = true
        
        
        // Medalha
        self.medalImage.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 25).isActive = true
        self.medalImage.bottomAnchor.constraint(equalTo: self.bgButtonRestart.topAnchor, constant: -20).isActive = true
        self.medalImage.leadingAnchor.constraint(equalTo: self.container.leadingAnchor).isActive = true
        self.medalImage.trailingAnchor.constraint(equalTo: self.container.trailingAnchor).isActive = true
    }
}
