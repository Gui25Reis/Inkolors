//
//  Buttons.swift
//  Inkolors
//
//  Created by Gui Reis on 03/06/21.
//

import UIKit


class Buttons {
    public func getBg(bt:UIButton, _ size:CGFloat = 60) -> UIView{
        let btBgColor: UIView = UIView()
        btBgColor.backgroundColor = #colorLiteral(red: 0.7304742932, green: 0.8675973415, blue: 0.8127686381, alpha: 1)
        btBgColor.layer.cornerRadius = 30
        btBgColor.translatesAutoresizingMaskIntoConstraints = false
        btBgColor.addSubview(bt)
        
        btBgColor.widthAnchor.constraint(equalToConstant: size).isActive = true
        btBgColor.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        bt.centerXAnchor.constraint(equalTo: btBgColor.centerXAnchor).isActive = true
        bt.centerYAnchor.constraint(equalTo: btBgColor.centerYAnchor).isActive = true
        
        return btBgColor
    }
        
    private func getButtun(icon:String, _ sizeFont:CGFloat = 25) -> UIButton{
        let bt = UIButton()
        self.setBtImage(bt: bt, icon: icon, sizeFont)
        bt.layer.cornerRadius = 5
        bt.tintColor = #colorLiteral(red: 1, green: 0.9845215678, blue: 0.9319496751, alpha: 1)
        bt.backgroundColor = #colorLiteral(red: 0.7304742932, green: 0.8675973415, blue: 0.8127686381, alpha: 1)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }
    
    public func setBtImage(bt:UIButton, icon:String, _ sizeFont:CGFloat = 25) -> Void {
        let configIcon = UIImage.SymbolConfiguration(pointSize: sizeFont, weight: .bold, scale: .large)
        bt.setImage(UIImage(systemName: icon, withConfiguration: configIcon), for: .normal)
    }
    
    public func getHomeButton() -> UIButton{
        return self.getButtun(icon: "house.fill")
    }
    
    public func getSoundOnButton() -> UIButton{
        return self.getButtun(icon: "speaker.wave.2")
    }
    
    public func getBackButton() -> UIButton{
        return self.getButtun(icon: "arrow.left")
    }
    
    public func getNextButton(sizeFont:CGFloat = 25) -> UIButton{
        return self.getButtun(icon: "arrow.right", sizeFont)
    }
    
    public func getRestartButton() -> UIButton{
        return self.getButtun(icon: "arrow.counterclockwise")
    }
    
    public func getPlayButton() -> UIButton{
        return self.getButtun(icon: "play")
    }

}
