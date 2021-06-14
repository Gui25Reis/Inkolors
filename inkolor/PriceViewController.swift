//
//  modal.swift
//  Inkolors
//
//  Created by Gui Reis on 02/06/21.
//

import UIKit

class PriceViewController: UIViewController {
    /* Atributos da classe */
    var buttons:Buttons = Buttons()
    var buttonHome: UIButton = UIButton(frame: .zero)
    var bgButtonHome: UIView = UIView(frame: .zero)
    var buttonNext: UIButton = UIButton(frame: .zero)
    var bgButtonNext: UIView = UIView(frame: .zero)
    var buttonRestart: UIButton = UIButton(frame: .zero)
    var bgButtonRestart: UIView = UIView(frame: .zero)
    
    let defaults = UserDefaults.standard
    var currentLevel:Int = 0
    var completedLevels:Int = 0
    
    let container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 1, green: 0.98, blue: 0.94, alpha: 1.0)
        v.layer.cornerRadius = 24
        return v
    }()
    
    let titleLable:UILabel = {
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
    
    
    let medals:[UIImage] = [#imageLiteral(resourceName: "medalha-grande-bronze"), #imageLiteral(resourceName: "medalha-grande-prata"), #imageLiteral(resourceName: "medalha-grande-ouro")]
    
    let phrases:[String] = ["Good Job!", "Nice Going!", "Perfect!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        view.addSubview(container)
        
        self.currentLevel = self.defaults.integer(forKey: "level")
        self.completedLevels = self.defaults.integer(forKey: "completedLevels")
              
        /* Botões */
        self.buttonHome = buttons.getHomeButton()
        self.buttonHome.addTarget(self, action: #selector(actHome), for: .touchDown)
        
        self.bgButtonHome = buttons.getBg(bt: self.buttonHome)
        self.container.addSubview(self.bgButtonHome)
        
        
        self.buttonRestart = self.buttons.getRestartButton()
        self.buttonRestart.addTarget(self, action: #selector(actRestart), for: .touchDown)
        
        self.bgButtonRestart = self.buttons.getBg(bt: self.buttonRestart)
        self.container.addSubview(self.bgButtonRestart)
        
        
        self.buttonNext = self.buttons.getNextButton()
        self.buttonNext.addTarget(self, action: #selector(actNext), for: .touchDown)
        
        self.bgButtonNext = self.buttons.getBg(bt: self.buttonNext)
        self.container.addSubview(self.bgButtonNext)
        
        if (self.currentLevel == 2) {
            self.bgButtonNext.isHidden = true
            self.buttonNext.isEnabled = false
        }
        
        
        self.titleLable.text = self.phrases[self.currentLevel]
        self.container.addSubview(self.titleLable)
        
        self.medalImage.image = self.medals[self.currentLevel]
        self.container.addSubview(self.medalImage)
        
        
        self.setConstraints()
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
        self.currentLevel+=1
        self.defaults.set(self.currentLevel, forKey: "level")
        
        guard let vc = storyboard?.instantiateViewController(identifier: "idIntro") as? IntroViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
        
    }
    
    
    private func setConstraints() -> Void{
        /* VIEW DESTAQUE */
        self.container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        self.container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        
        
        /* TITLE LABEL */
        self.titleLable.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        self.titleLable.topAnchor.constraint(equalTo: self.container.topAnchor, constant:50).isActive = true
        
        
        /* HOME BUTTON */
        self.bgButtonHome.bottomAnchor.constraint(equalTo: self.bgButtonRestart.bottomAnchor).isActive = true
        if (self.currentLevel == 2) {
            self.bgButtonHome.rightAnchor.constraint(equalTo: self.bgButtonRestart.leftAnchor, constant: -40).isActive = true
        }else{
            self.bgButtonHome.rightAnchor.constraint(equalTo: self.bgButtonRestart.leftAnchor, constant: -20).isActive = true
        }
        
        
        /* RESTART BUTTON */
        self.bgButtonRestart.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -50).isActive = true
        if (self.currentLevel == 2) {
            self.bgButtonRestart.centerXAnchor.constraint(equalTo: self.container.centerXAnchor, constant: 50).isActive = true
        }else{
            self.bgButtonRestart.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
        }
        
        
        /* NEXT BUTTON */
        self.bgButtonNext.bottomAnchor.constraint(equalTo: self.bgButtonRestart.bottomAnchor).isActive = true
        self.bgButtonNext.leftAnchor.constraint(equalTo: self.bgButtonRestart.rightAnchor, constant: 20).isActive = true
        
        /* MEDALHA */
        self.medalImage.topAnchor.constraint(equalTo: self.titleLable.bottomAnchor, constant: 30).isActive = true
        self.medalImage.bottomAnchor.constraint(equalTo: self.bgButtonRestart.topAnchor, constant: -20).isActive = true
        self.medalImage.leadingAnchor.constraint(equalTo: self.container.leadingAnchor).isActive = true
        self.medalImage.trailingAnchor.constraint(equalTo: self.container.trailingAnchor).isActive = true
    }
}
