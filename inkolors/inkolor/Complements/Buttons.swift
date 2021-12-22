//
//  Buttons.swift
//  Inkolors
//
//  Created by Gui Reis on 03/06/21.
//

import UIKit


class Buttons {
    private func getButtun(icon:String, _ sizeFont:CGFloat = 25, _ corner:CGFloat = 60) -> UIButton{
        let bt = UIButton()
        self.setBtImage(bt: bt, icon: icon, sizeFont)
        bt.layer.cornerRadius = corner/2
        bt.tintColor = #colorLiteral(red: 1, green: 0.9845215678, blue: 0.9319496751, alpha: 1)
        bt.backgroundColor = #colorLiteral(red: 0.4485500455, green: 0.8666214347, blue: 0.7166131139, alpha: 1)
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.widthAnchor.constraint(equalToConstant: corner).isActive = true
        bt.heightAnchor.constraint(equalToConstant: corner).isActive = true
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
    
    public func getNextButton(sizeFont:CGFloat = 25, _ corner:CGFloat = 60) -> UIButton{
        return self.getButtun(icon: "arrow.right", sizeFont, corner)
    }
    
    public func getRestartButton() -> UIButton{
        return self.getButtun(icon: "arrow.counterclockwise")
    }
    
    public func getPlayButton() -> UIButton{
        return self.getButtun(icon: "play")
    }
}
