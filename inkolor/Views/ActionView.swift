//
//  MenuView.swift
//  inkolor
//
//  Created by Gui Reis on 16/06/21.
//

import UIKit

class ActionView: UIView {
    var buttonHome: UIButton = UIButton(frame: .zero)
    var bgButtonHome: UIView = UIView(frame: .zero)
    var buttonSound: UIButton = UIButton(frame: .zero)
    var bgButtonSound: UIView = UIView(frame: .zero)
    let infoLabel: UILabel = {
        let label:UILabel = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 7
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var currentLevel:Int = 0
    
    // Circulos
    let circlePContainer: UIView = UIView(frame: CGRect(x: 300, y: 300, width: 300, height: 300))
    var gameCircules:[Circule] = []

    // Tintas
    var inks:[Ink] = []
    
    init() {
        super.init(frame: .zero)
                
        // Label
        self.addSubview(self.infoLabel)
        
        // Home button
        self.buttonHome = Buttons().getHomeButton()
        self.bgButtonHome = Buttons().getBg(bt: self.buttonHome)
        self.addSubview(self.bgButtonHome)
        
        // Sound button
        self.buttonSound = Buttons().getSoundOnButton()
        self.bgButtonSound = Buttons().getBg(bt: self.buttonSound)
        self.addSubview(self.bgButtonSound)
                
        // Círculos
        switch self.currentLevel {
        case 0:
            self.createCircles(loop: 3, size: 80, corner: 40)
        case 1:
            self.createCircles(loop: 6, size: 60, corner: 30)
        default:
            self.createCircles(loop: 12, size: 40, corner: 20)
        }
                        
        for c in self.gameCircules {circlePContainer.addSubview(c.getView())}
        self.addSubview(circlePContainer)
        
        // Tintas
        for x in 0..<6 {
            self.inks.append(Ink())
            self.addSubview(self.inks[x].getView())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func getButtonHome() -> UIButton {return self.buttonHome}
    
    public func getButtonSound() -> UIButton {return self.buttonSound}
    
    public func getInfoLabel() -> UILabel {return self.infoLabel}
    
    public func getInks() -> [Ink] {return self.inks}
    
    public func getGameCircules() -> [Circule] {return self.gameCircules}
    
    public func getViewCircules() -> UIView {return self.circlePContainer}
    
    public func setCompletedLevels(level:Int) -> Void {self.currentLevel = level}
    
    
        
    private func createCircles(loop:Int, size:CGFloat, corner:CGFloat){
        for _ in 0..<loop {
            self.gameCircules.append(Circule(size: size, color: .gray, corner: corner))
        }
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        /* MARK: Constraints - Botões */
        
        // Home button
        self.bgButtonHome.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.070).isActive = true
        self.bgButtonHome.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true

        
        // Sound button
        self.bgButtonSound.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.070).isActive = true
        self.bgButtonSound.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        
        
        // Info text
        infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        infoLabel.topAnchor.constraint(equalTo: bgButtonHome.topAnchor, constant: 90).isActive = true


        /* MARK: Constraints - Tintas */
        
     
        self.inks[0].getView().bottomAnchor.constraint(equalTo: self.inks[3].getView().topAnchor, constant: -10).isActive = true
        self.inks[0].getView().leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.inks[0].getView().heightAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true
        self.inks[0].getView().widthAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true


        self.inks[1].getView().bottomAnchor.constraint(equalTo: self.inks[0].getView().bottomAnchor).isActive = true
        self.inks[1].getView().leftAnchor.constraint(equalTo: self.inks[0].getView().rightAnchor, constant: 20).isActive = true
        self.inks[1].getView().heightAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true
        self.inks[1].getView().widthAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true


        self.inks[2].getView().bottomAnchor.constraint(equalTo: self.inks[0].getView().bottomAnchor).isActive = true
        self.inks[2].getView().leftAnchor.constraint(equalTo: self.inks[1].getView().rightAnchor, constant: 20).isActive = true
        self.inks[2].getView().heightAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true
        self.inks[2].getView().widthAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true


        self.inks[3].getView().bottomAnchor.constraint(equalTo: self.inks[5].getView().bottomAnchor).isActive = true
        self.inks[3].getView().rightAnchor.constraint(equalTo: self.inks[4].getView().leftAnchor, constant: -20).isActive = true
        self.inks[3].getView().heightAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true
        self.inks[3].getView().widthAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true
   

        self.inks[4].getView().bottomAnchor.constraint(equalTo: self.inks[5].getView().bottomAnchor).isActive = true
        self.inks[4].getView().rightAnchor.constraint(equalTo: self.inks[5].getView().leftAnchor, constant: -20).isActive = true
        self.inks[4].getView().heightAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true
        self.inks[4].getView().widthAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true


        self.inks[5].getView().bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * -0.055).isActive = true
        self.inks[5].getView().trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.inks[5].getView().heightAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true
        self.inks[5].getView().widthAnchor.constraint(equalToConstant: self.bounds.height*0.09).isActive = true

        
        /* MARK: Constraints - Cículos */
        
        self.circlePContainer.translatesAutoresizingMaskIntoConstraints = false

        self.circlePContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.circlePContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.3).isActive = true
        self.circlePContainer.heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.circlePContainer.widthAnchor.constraint(equalToConstant: 300).isActive = true

        
        switch self.currentLevel {
        case 0:
            setCircleConstraints(sizeCircule: 80)
        case 1:
            setCircleConstraints(sizeCircule: 60)
        default:
            setCircleConstraints(sizeCircule: 40)
        }
    }
    

    private func setCircleConstraints(sizeCircule:CGFloat) {
        var smallestAxis:CGFloat
        if self.circlePContainer.bounds.height > self.circlePContainer.bounds.width {
            smallestAxis = self.circlePContainer.bounds.width
        }else{
            smallestAxis = self.circlePContainer.bounds.height
        }
        
        let radius: CGFloat = (smallestAxis/2.3) - (sizeCircule/2)
        
        let deltaAlpha: CGFloat = CGFloat(360/self.gameCircules.count)
        var alpha: CGFloat = -90
        
        for c in self.gameCircules {
            c.view.centerXAnchor.constraint(equalTo: self.circlePContainer.centerXAnchor, constant: (cos(alpha*CGFloat.pi/180)*radius)).isActive = true
            c.view.centerYAnchor.constraint(equalTo: self.circlePContainer.centerYAnchor, constant: (sin(alpha*CGFloat.pi/180)*radius)).isActive = true
            
            alpha -= deltaAlpha
        }
    }
}
