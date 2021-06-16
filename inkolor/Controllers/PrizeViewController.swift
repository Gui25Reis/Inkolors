//
//  modal.swift
//  Inkolors
//
//  Created by Gui Reis on 02/06/21.
//

import UIKit

class PrizeViewController: UIViewController {
    let myView = PrizeView()

    let defaults = UserDefaults.standard
    var currentLevel:Int = 0
    var completedLevels:Int = 0

    let medals:[UIImage] = [#imageLiteral(resourceName: "medalha-grande-bronze"), #imageLiteral(resourceName: "medalha-grande-prata"), #imageLiteral(resourceName: "medalha-grande-ouro")]
    
    let phrases:[String] = ["Good Job!", "Nice Going!", "Perfect!"]
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view = self.myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentLevel = self.defaults.integer(forKey: "level")
        self.completedLevels = self.defaults.integer(forKey: "completedLevels")
        
        self.myView.setCurrentLevel(level: self.currentLevel)
        
        
        let buttonHome = self.myView.getButtonHome()
        buttonHome.addTarget(self, action: #selector(actHome), for: .touchDown)
        
        let buttonRestart = self.myView.getButtonRestart()
        buttonRestart.addTarget(self, action: #selector(actRestart), for: .touchDown)
        
        let buttonNext = self.myView.getButtonNext()
        buttonNext.addTarget(self, action: #selector(actNext), for: .touchDown)
        
    
        let titleLabel = self.myView.getTitleLabel()
        titleLabel.text = self.phrases[self.currentLevel]
        
        let medalImage = self.myView.getMedalImage()
        medalImage.image = self.medals[self.currentLevel]
    }
    
    
    @IBAction func actHome() -> Void{
        guard let vc = storyboard?.instantiateViewController(identifier: "idMenu") as? MenuViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func actRestart() -> Void{
        guard let vc = storyboard?.instantiateViewController(identifier: "idAction") as? ActionViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func actNext() -> Void{
        self.currentLevel += 1
        self.defaults.set(self.currentLevel, forKey: "level")
        
        guard let vc = storyboard?.instantiateViewController(identifier: "idIntro") as? IntroViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}
