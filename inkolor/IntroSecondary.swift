import UIKit

class IntroSecondary: UIViewController {
    var buttonHome: UIButton = UIButton(frame: .zero)
    var infoTitle: UILabel = UILabel(frame: .zero)
    var infoText: UILabel = UILabel(frame: .zero)
    var buttonNext: UIButton = UIButton(frame: .zero)
    var bgButtonHome: UIView = UIView(frame: .zero)
    var bgButtonNext: UIView = UIView(frame: .zero)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9313784838, green: 0.9179487824, blue: 0.8697045445, alpha: 1)
        
        
        // --- adding elements to the view ---
        
        view.addSubview(infoTitle)
        view.addSubview(infoText)
        view.addSubview(bgButtonHome)
        view.addSubview(bgButtonNext)
        bgButtonHome.addSubview(buttonHome)
        bgButtonNext.addSubview(buttonNext)
        
        
        // --- setting elements ---
        
        // background home
        bgButtonHome.backgroundColor = #colorLiteral(red: 0.7304742932, green: 0.8675973415, blue: 0.8127686381, alpha: 1)
        bgButtonHome.layer.cornerRadius = 30
        
        // background next
        bgButtonNext.backgroundColor = #colorLiteral(red: 0.7304742932, green: 0.8675973415, blue: 0.8127686381, alpha: 1)
        bgButtonNext.layer.cornerRadius = 50
        
        // button home
        let homeIcon = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)
        buttonHome.setImage(UIImage(systemName: "house.fill", withConfiguration: homeIcon), for: .normal)
        buttonHome.layer.cornerRadius = 5
        buttonHome.tintColor = #colorLiteral(red: 1, green: 0.9845215678, blue: 0.9319496751, alpha: 1)
        buttonHome.backgroundColor = #colorLiteral(red: 0.7304742932, green: 0.8675973415, blue: 0.8127686381, alpha: 1)
        
        // info title
        infoTitle.text = "And what about the secondary colors?"
        infoTitle.textAlignment = .center
        infoTitle.font = .boldSystemFont(ofSize: 28)
        infoTitle.numberOfLines = 5
        infoTitle.textColor = .black
                    
        // info text
        infoText.text = "The secondary colors are the ones created by the mixture of two primary colors"
        infoText.textAlignment = .left
        infoText.font = .systemFont(ofSize: 23, weight: .regular)
        infoText.numberOfLines = 5
        infoText.textColor = .black
        
        // button next
        let nextIcon = UIImage.SymbolConfiguration(pointSize: 40, weight: .medium, scale: .large)
        buttonNext.setImage(UIImage(systemName: "arrow.right", withConfiguration: nextIcon), for: .normal)
        buttonNext.layer.cornerRadius = 15
        buttonNext.tintColor = #colorLiteral(red: 1, green: 0.9845215678, blue: 0.9319496751, alpha: 1)
        buttonNext.backgroundColor = #colorLiteral(red: 0.7304742932, green: 0.8675973415, blue: 0.8127686381, alpha: 1)
        
        
        getConstraints()
        
    }

    // --- constraints ---
    func getConstraints(){
        // background home
        bgButtonHome.translatesAutoresizingMaskIntoConstraints = false
        let bgButtonHomeConstraints: [NSLayoutConstraint] = [
            bgButtonHome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            bgButtonHome.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            bgButtonHome.widthAnchor.constraint(equalToConstant: 60),
            bgButtonHome.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(bgButtonHomeConstraints)
        
        // background next
        bgButtonNext.translatesAutoresizingMaskIntoConstraints = false
        let bgButtonNextConstraints: [NSLayoutConstraint] = [
            bgButtonNext.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bgButtonNext.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            bgButtonNext.widthAnchor.constraint(equalToConstant: 100),
            bgButtonNext.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(bgButtonNextConstraints)
        
        // button home
        buttonHome.translatesAutoresizingMaskIntoConstraints = false
        let buttonHomeConstraints: [NSLayoutConstraint] = [
            buttonHome.centerXAnchor.constraint(equalTo: bgButtonHome.centerXAnchor),
            buttonHome.centerYAnchor.constraint(equalTo: bgButtonHome.centerYAnchor)
        ]
        NSLayoutConstraint.activate(buttonHomeConstraints)
        
        // info title
        infoTitle.translatesAutoresizingMaskIntoConstraints = false
        let infoTitleConstraints: [NSLayoutConstraint] = [
            infoTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            infoTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            infoTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 260)
        ]
        NSLayoutConstraint.activate(infoTitleConstraints)
        
        // info text
        infoText.translatesAutoresizingMaskIntoConstraints = false
        let infoTextConstraints: [NSLayoutConstraint] = [
            infoText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            infoText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            infoText.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 50)
        ]
        NSLayoutConstraint.activate(infoTextConstraints)
        
        // button next
        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        let buttonNextConstraints: [NSLayoutConstraint] = [
            buttonNext.centerXAnchor.constraint(equalTo: bgButtonNext.centerXAnchor),
            buttonNext.centerYAnchor.constraint(equalTo: bgButtonNext.centerYAnchor)
        ]
        NSLayoutConstraint.activate(buttonNextConstraints)
        
    }

}
