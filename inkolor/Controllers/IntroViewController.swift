import UIKit

class IntroViewController: UIViewController {
    let myView = IntroView()
    
    let defaults = UserDefaults.standard
    var currentLevel:Int = 0
    
    let phrasesTitle:[String] = [
        "Do you know the primary colors?",
        "And what about the secondary colors?",
        "Let's learn about the tertiary colors?"
    ]
    
    let phrasesInfo:[String] = [
        "Primary colors are the ones that can not be obtained by mixing other colored paints together",
        "The secondary colors are the ones created by the mixture of two primary colors",
        "The tertiary colors are the ones created by the mixture of a primary color with a secondary color."
    ]
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view = self.myView
        self.view.backgroundColor = #colorLiteral(red: 0.9313784838, green: 0.9179487824, blue: 0.8697045445, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentLevel = self.defaults.integer(forKey: "level")
        
        /* Botões */
        let buttonHome:UIButton = self.myView.getButtonHome()
        buttonHome.addTarget(self, action: #selector(actHome), for: .touchDown)

        
        let buttonNext:UIButton = self.myView.getButtonNext()
        buttonNext.addTarget(self, action: #selector(actNext), for: .touchDown)
        
        // Labels
        let titleLabel:UILabel = self.myView.getTitleLabel()
        titleLabel.text = self.phrasesTitle[self.currentLevel]
        titleLabel.font = .systemFont(ofSize: self.view.bounds.height * 0.035, weight: .bold)
        
        let infoLabel:UILabel = self.myView.getInfoLabel()
        infoLabel.text = self.phrasesInfo[self.currentLevel]
        infoLabel.font = .systemFont(ofSize: self.view.bounds.height * 0.030, weight: .regular)
    }
    
    
    @IBAction func actHome() -> Void{
        guard let vc = storyboard?.instantiateViewController(identifier: "idMenu") as? MenuViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @IBAction func actNext() -> Void{
        guard let vc = storyboard?.instantiateViewController(identifier: "idAction") as? ActionViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}
