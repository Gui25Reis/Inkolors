//
//  Menu.swift
//  inkolors

import UIKit

class MenuViewController: UIViewController {
    
    let letters:[String] = ["I", "N", "K", "O", "L", "O", "R", "S"]
    let colors:[UIColor] = [ #colorLiteral(red: 0.5028263092, green: 0.4893502457, blue: 0.4528763294, alpha: 1),  #colorLiteral(red: 0.7686265111, green: 0.3437641561, blue: 0.3794900775, alpha: 1),  #colorLiteral(red: 0.6050088534, green: 0.6803177595, blue: 0.364597857, alpha: 1),  #colorLiteral(red: 0.836702466, green: 0.6028306484, blue: 0, alpha: 1),  #colorLiteral(red: 0.7220590711, green: 0.3090983033, blue: 0.8378536701, alpha: 1),  #colorLiteral(red: 0.8688660264, green: 0.268450783, blue: 0.6067544818, alpha: 1),  #colorLiteral(red: 0.8472318053, green: 0.1266637444, blue: 0.2175347507, alpha: 1),  #colorLiteral(red: 0, green: 0.464274168, blue: 0.3145292501, alpha: 1)]
    var labels:[UILabel] = []
    var buttons:[UIButton] = []
    let defaults = UserDefaults.standard
    var currentLevel:Int = 0
    var completedLevels:Int = 0
    
    let medals:[UIImageView] = [
        UIImageView(image: #imageLiteral(resourceName: "medalha-pequena-bronze")),
        UIImageView(image: #imageLiteral(resourceName: "medalha-pequena-prata")),
        UIImageView(image: #imageLiteral(resourceName: "medalha-pequena-ouro")),
    ]
    
    private func setLabel(text:String, color:UIColor) -> UILabel{
        let lbl:UILabel = UILabel()
        lbl.text = text
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 50, weight: .bold)
        lbl.textColor = color
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    @IBAction func actLevel(sender:UIButton) -> Void{
        defaults.set(sender.tag, forKey: "level")
        guard let vc = storyboard?.instantiateViewController(identifier: "idIntro") as? IntroViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9313784838, green: 0.9179487824, blue: 0.8697045445, alpha: 1)
        
//        self.defaults.set(0, forKey: "level")
//        self.defaults.set(0, forKey: "completedLevels")
//        self.defaults.set(true, forKey: "soundOn")
        
        
        self.currentLevel = self.defaults.integer(forKey: "level")
        self.completedLevels = self.defaults.integer(forKey: "completedLevels")
        
        // --- setting elements ---
        for x in 0..<self.colors.count {
            self.labels.append(self.setLabel(text: self.letters[x], color: self.colors[x]))
            view.addSubview(self.labels[x])
        }
        

        for x in 0..<3 {
            buttons.append(self.setButton(num: x))
            if (x <= self.completedLevels) {
                buttons[x].isEnabled = true
                buttons[x].backgroundColor = #colorLiteral(red: 0.7304742932, green: 0.8675973415, blue: 0.8127686381, alpha: 1)
            }
            view.addSubview(buttons[x])
        }
        
        for x in 0..<self.completedLevels {
            view.addSubview(self.medals[x])
        }
        
        self.getConstraints()
    }
    
    private func setButton(num:Int) -> UIButton{
        let bt:UIButton = UIButton(type: .custom)
        bt.setTitle(String(num+1), for: .normal)
        bt.setTitleColor(#colorLiteral(red: 1, green: 0.9845215678, blue: 0.9319496751, alpha: 1), for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 100)
        bt.backgroundColor = #colorLiteral(red: 0.8631923199, green: 0.8599755168, blue: 0.8393679261, alpha: 1)
        bt.layer.cornerRadius = 40
        bt.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .highlighted)
        bt.isEnabled = false
        bt.tag = num
        bt.addTarget(self, action: #selector(actLevel(sender:)), for: .touchDown)
        return bt
    }
    
    private func getConstraints() {
        
        // title I
        self.labels[0].translatesAutoresizingMaskIntoConstraints = false
        let iConstraints: [NSLayoutConstraint] = [
            self.labels[0].trailingAnchor.constraint(equalTo: self.labels[1].leadingAnchor, constant: 1),
            self.labels[0].topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        ]
        NSLayoutConstraint.activate(iConstraints)
        
        // title N
        self.labels[1].translatesAutoresizingMaskIntoConstraints = false
        let nConstraints: [NSLayoutConstraint] = [
            self.labels[1].trailingAnchor.constraint(equalTo: self.labels[2].leadingAnchor, constant: 1),
            self.labels[1].topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        ]
        NSLayoutConstraint.activate(nConstraints)
        
        // title K
        self.labels[2].translatesAutoresizingMaskIntoConstraints = false
        let kConstraints: [NSLayoutConstraint] = [
            self.labels[2].trailingAnchor.constraint(equalTo: self.labels[3].leadingAnchor, constant: 1),
            self.labels[2].topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        ]
        NSLayoutConstraint.activate(kConstraints)
        
        // title O1
        self.labels[3].translatesAutoresizingMaskIntoConstraints = false
        let o1Constraints: [NSLayoutConstraint] = [
            self.labels[3].trailingAnchor.constraint(equalTo: view.centerXAnchor),
            self.labels[3].topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        ]
        NSLayoutConstraint.activate(o1Constraints)
        
        // title L
        self.labels[4].translatesAutoresizingMaskIntoConstraints = false
        let lConstraints: [NSLayoutConstraint] = [
            self.labels[4].leadingAnchor.constraint(equalTo: view.centerXAnchor),
            self.labels[4].topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        ]
        NSLayoutConstraint.activate(lConstraints)
        
        // title O2
        self.labels[5].translatesAutoresizingMaskIntoConstraints = false
        let o2Constraints: [NSLayoutConstraint] = [
            self.labels[5].leadingAnchor.constraint(equalTo: self.labels[4].trailingAnchor, constant: -1),
            self.labels[5].topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        ]
        NSLayoutConstraint.activate(o2Constraints)
        
        // title R
        self.labels[6].translatesAutoresizingMaskIntoConstraints = false
        let rConstraints: [NSLayoutConstraint] = [
            self.labels[6].leadingAnchor.constraint(equalTo: self.labels[5].trailingAnchor, constant: -1),
            self.labels[6].topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        ]
        NSLayoutConstraint.activate(rConstraints)
        
        // title S
        self.labels[7].translatesAutoresizingMaskIntoConstraints = false
        let sConstraints: [NSLayoutConstraint] = [
            self.labels[7].leadingAnchor.constraint(equalTo: self.labels[6].trailingAnchor, constant: -1),
            self.labels[7].topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        ]
        NSLayoutConstraint.activate(sConstraints)
        
        // button 1
        self.buttons[0].translatesAutoresizingMaskIntoConstraints = false
        let bt1Constraints: [NSLayoutConstraint] = [
            self.buttons[0].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.buttons[0].topAnchor.constraint(equalTo: self.labels[0].bottomAnchor, constant: 50),
            self.buttons[0].heightAnchor.constraint(equalToConstant: 150),
            self.buttons[0].widthAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(bt1Constraints)
        
        
        // button 2
        self.buttons[1].translatesAutoresizingMaskIntoConstraints = false
        let bt2Constraints: [NSLayoutConstraint] = [
            self.buttons[1].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.buttons[1].topAnchor.constraint(equalTo: self.buttons[0].bottomAnchor, constant: 30),
            self.buttons[1].heightAnchor.constraint(equalToConstant: 150),
            self.buttons[1].widthAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(bt2Constraints)
        
        // button 3
        self.buttons[2].translatesAutoresizingMaskIntoConstraints = false
        let bt3Constraints: [NSLayoutConstraint] = [
            self.buttons[2].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.buttons[2].topAnchor.constraint(equalTo: self.buttons[1].bottomAnchor, constant: 30),
            self.buttons[2].heightAnchor.constraint(equalToConstant: 150),
            self.buttons[2].widthAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(bt3Constraints)
        
        if (completedLevels > 0){
        // medalha bronze
            self.medals[0].translatesAutoresizingMaskIntoConstraints = false
            let bronzeConstraints: [NSLayoutConstraint] = [
                self.medals[0].centerYAnchor.constraint(equalTo: self.buttons[0].bottomAnchor),
                self.medals[0].centerXAnchor.constraint(equalTo: self.buttons[0].trailingAnchor, constant: -10),
                self.medals[0].heightAnchor.constraint(equalToConstant: 62),
                self.medals[0].widthAnchor.constraint(equalToConstant: 60)
            ]
            NSLayoutConstraint.activate(bronzeConstraints)
        }
        
        if (completedLevels > 1){
            self.medals[1].translatesAutoresizingMaskIntoConstraints = false
            let prataConstraints: [NSLayoutConstraint] = [
                self.medals[1].centerYAnchor.constraint(equalTo: self.buttons[1].bottomAnchor),
                self.medals[1].centerXAnchor.constraint(equalTo: self.buttons[1].trailingAnchor, constant: -10),
                self.medals[1].heightAnchor.constraint(equalToConstant: 62),
                self.medals[1].widthAnchor.constraint(equalToConstant: 60)
            ]
            NSLayoutConstraint.activate(prataConstraints)
        }
        
        if (completedLevels > 2){
        // medalha ouro
            self.medals[2].translatesAutoresizingMaskIntoConstraints = false
            let ouroConstraints: [NSLayoutConstraint] = [
                self.medals[2].centerYAnchor.constraint(equalTo: self.buttons[2].bottomAnchor),
                self.medals[2].centerXAnchor.constraint(equalTo: self.buttons[2].trailingAnchor, constant: -10),
                self.medals[2].heightAnchor.constraint(equalToConstant: 62),
                self.medals[2].widthAnchor.constraint(equalToConstant: 60)
            ]
            NSLayoutConstraint.activate(ouroConstraints)
        }
    }
    
}
