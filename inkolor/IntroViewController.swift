import UIKit

class IntroViewController: UIViewController {
    /* === ATRIBUTOS === */
    var buttons:Buttons = Buttons()
    var buttonHome: UIButton = UIButton(frame: .zero)
    var bgButtonHome: UIView = UIView(frame: .zero)
    var buttonNext: UIButton = UIButton(frame: .zero)
    var bgButtonNext: UIView = UIView(frame: .zero)
    var buttonRestart: UIButton = UIButton(frame: .zero)
    var bgButtonRestart: UIView = UIView(frame: .zero)
    var titleLabel: UILabel = UILabel(frame: .zero)
    var infoLabel: UILabel = UILabel(frame: .zero)
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
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9313784838, green: 0.9179487824, blue: 0.8697045445, alpha: 1)
        
        self.currentLevel = self.defaults.integer(forKey: "level")
        
        /* Botões */
        self.buttonHome = buttons.getHomeButton()
        self.buttonHome.addTarget(self, action: #selector(actHome), for: .touchDown)
        self.bgButtonHome = buttons.getBg(bt: self.buttonHome)
        view.addSubview(self.bgButtonHome)
        
        self.buttonNext = self.buttons.getNextButton(sizeFont: 40)
        self.buttonNext.addTarget(self, action: #selector(actNext), for: .touchDown)
        self.bgButtonNext = self.buttons.getBg(bt: self.buttonNext, 100)
        self.bgButtonNext.layer.cornerRadius = 50
        view.addSubview(self.bgButtonNext)
        
        
        // Labels
        self.titleLabel = self.setLabel(text: self.phrasesTitle[self.currentLevel], sizeFont: 28, align: .center, w: .bold)
        view.addSubview(self.titleLabel)
        
        self.infoLabel = self.setLabel(text: self.phrasesInfo[self.currentLevel], sizeFont: 23, align: .left, w: .regular)
        view.addSubview(self.infoLabel)
        
        self.setConstraints()
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

    
    private func setLabel(text:String, sizeFont:CGFloat, align:NSTextAlignment, w:UIFont.Weight) -> UILabel{
        let lbl:UILabel = UILabel()
        lbl.text = text
        lbl.textAlignment = align
        lbl.font = .systemFont(ofSize: sizeFont, weight: w)
        lbl.numberOfLines = 5
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    // --- constraints ---
    private func setConstraints(){
        // background home
        bgButtonHome.translatesAutoresizingMaskIntoConstraints = false
        let bgButtonHomeConstraints: [NSLayoutConstraint] = [
            self.bgButtonHome.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            self.bgButtonHome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        ]
        NSLayoutConstraint.activate(bgButtonHomeConstraints)
        
        // background next
        bgButtonNext.translatesAutoresizingMaskIntoConstraints = false
        let bgButtonNextConstraints: [NSLayoutConstraint] = [
            bgButtonNext.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bgButtonNext.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
        ]
        NSLayoutConstraint.activate(bgButtonNextConstraints)
        
        // info title
        let titleLabelConstraints: [NSLayoutConstraint] = [
            self.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            self.titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            self.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 260)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        // info text
        let infoLabelConstraints: [NSLayoutConstraint] = [
            self.infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            self.infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            self.infoLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 50)
        ]
        NSLayoutConstraint.activate(infoLabelConstraints)
    }
}
