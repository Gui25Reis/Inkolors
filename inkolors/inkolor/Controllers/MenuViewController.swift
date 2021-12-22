//
//  Menu.swift
//  inkolors

import UIKit

class MenuViewController: UIViewController {
    let myView = MenuView()
    
    let letters:[String] = ["I", "N", "K", "O", "L", "O", "R", "S"]
    let colors:[UIColor] = [#colorLiteral(red: 0, green: 0.6439785361, blue: 0, alpha: 1) ,  #colorLiteral(red: 0.7766265869, green: 0, blue: 0.6352015734, alpha: 1),  #colorLiteral(red: 0, green: 0.6153349876, blue: 0.5963861346, alpha: 1),  #colorLiteral(red: 1, green: 0.4701431394, blue: 0, alpha: 1),  #colorLiteral(red: 0.7766265869, green: 0, blue: 0.6352015734, alpha: 1),  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1),  #colorLiteral(red: 0.3140003979, green: 0.8086813688, blue: 0.6361778378, alpha: 1),  #colorLiteral(red: 0.6979225278, green: 0.7649332881, blue: 0, alpha: 1)]
    let medals:[UIImage] = [#imageLiteral(resourceName: "medalha-pequena-bronze"), #imageLiteral(resourceName: "medalha-pequena-prata"), #imageLiteral(resourceName: "medalha-pequena-ouro")]
    
    let defaults = UserDefaults.standard
    var currentLevel:Int = 0
    var completedLevels:Int = 0
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.backgroundColor = #colorLiteral(red: 0.9313784838, green: 0.9179487824, blue: 0.8697045445, alpha: 1)
        self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.resetGame()
        
        // Definindo os levels
        self.currentLevel = self.defaults.integer(forKey: "level")
        self.completedLevels = self.defaults.integer(forKey: "completedLevels")
        
        self.myView.setCompletedLevels(level: self.completedLevels)
        
        
        // Letras
        let labels = self.myView.getLabels()
        for x in 0..<self.colors.count {
            labels[x].text = self.letters[x]
            labels[x].textColor = self.colors[x]
            
            labels[x].font = .systemFont(ofSize: self.view.bounds.height * 0.065, weight: .bold)
        }
        
        
        // Botões
        let buttons = self.myView.getButtons()
        for x in 0..<3 {
            buttons[x].tag = x
            buttons[x].setTitle(String(x+1), for: .normal)
            buttons[x].addTarget(self, action: #selector(actLevel(sender:)), for: .touchDown)
            
            buttons[x].titleLabel?.font = UIFont.boldSystemFont(ofSize: self.view.bounds.height * 0.14)
            buttons[x].layer.cornerRadius = self.view.bounds.height * 0.045
            
            if (x <= self.completedLevels) {
                buttons[x].isEnabled = true
                buttons[x].backgroundColor = #colorLiteral(red: 0.4485500455, green: 0.8666214347, blue: 0.7166131139, alpha: 1)
            }
        }
        
        // Medalhas
        let medals = self.myView.getMedals()
        for x in 0..<self.completedLevels {
            medals[x].image = self.medals[x]
        }
    }
    

    @IBAction func actLevel(sender:UIButton) -> Void{
        self.defaults.set(sender.tag, forKey: "level")
        guard let vc = storyboard?.instantiateViewController(identifier: "idIntro") as? IntroViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    
    private func resetGame() -> Void {
        self.defaults.set(0, forKey: "level")
        self.defaults.set(0, forKey: "completedLevels")
        self.defaults.set(true, forKey: "soundOn")
    }
}
