import UIKit
import AVFoundation

class ActionViewController: UIViewController {
    // Botões
    var buttons:Buttons = Buttons()
    var buttonHome: UIButton = UIButton(frame: .zero)
    var bgButtonHome: UIView = UIView(frame: .zero)
    var buttonSound: UIButton = UIButton(frame: .zero)
    var bgButtonSound: UIView = UIView(frame: .zero)
    var infoText: UILabel = UILabel(frame: .zero)
    
    // Audios
    var audioCorrect: AVAudioPlayer?
    var audioWrong: AVAudioPlayer?
    var soundOn:Bool = true
    
    // Drag and drop
    var offset:CGPoint?
    var isDragging:Bool = false
    var inkDragging:Ink = Ink(num: 0, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    var lastPosition:[CGFloat] = []
    
    // User Defaults
    let defaults = UserDefaults.standard
    var currentLevel:Int = 0
    var completedLevels:Int = 0
    
    // Circulos
    let circlePContainer: UIView = UIView(frame: .zero)
    var circules:[[Circule]] = []
    let indexes:[[Int]] = [[0,1,2],[0,2,4,5,3,1],[0,2,4,6,8,10,11,9,7,5,3,1],]
    
    // Tintas
    var inks:[Ink] = []
    
    // Jogo
    let allGameCounts:[Int] = [3, 3, 6]
    var gameCount:Int = 0
    
    
    // Cores
    let parentColors:[UIColor: [UIColor]] = [
        #colorLiteral(red: 1, green: 0.3589155078, blue: 0, alpha: 1) : [ #colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1) ],
        #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1) : [ #colorLiteral(red: 1, green: 0.9656507373, blue: 0, alpha: 1), #colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1) ],
        #colorLiteral(red: 1, green: 0.7719227672, blue: 0, alpha: 1) : [ #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9656507373, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0.8076375723, green: 0.8700929284, blue: 0, alpha: 1) : [ #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9656507373, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1) : [ #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 1, green: 0.9656507373, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0, green: 0.642051518, blue: 0.6346852183, alpha: 1) : [ #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1) : [ #colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1) ],
        #colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1) : [ #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0.7449150681, green: 0, blue: 0.4703945518, alpha: 1) : [ #colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1), #colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1) ]
    ]
    
    
    let correctColors:[[UIColor]] = [[#colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 1, green: 0.9656507373, blue: 0, alpha: 1)], [#colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1)], [#colorLiteral(red: 1, green: 0.3589155078, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.7719227672, blue: 0, alpha: 1), #colorLiteral(red: 0.8076375723, green: 0.8700929284, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.642051518, blue: 0.6346852183, alpha: 1), #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1), #colorLiteral(red: 0.7449150681, green: 0, blue: 0.4703945518, alpha: 1)]]
    let lvCirculeColors:[[UIColor]] = [[], [#colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 1, green: 0.9656507373, blue: 0, alpha: 1)], [#colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.9656507373, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1)]]
    let lvInkColors:[[UIColor]] = [[#colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 1, green: 0.9656507373, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1), #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1)],  [#colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.3589155078, blue: 0, alpha: 1), #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1), #colorLiteral(red: 0, green: 0.642051518, blue: 0.6346852183, alpha: 1)],  [#colorLiteral(red: 0.7449150681, green: 0, blue: 0.4703945518, alpha: 1), #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1), #colorLiteral(red: 0, green: 0.642051518, blue: 0.6346852183, alpha: 1), #colorLiteral(red: 0.8076375723, green: 0.8700929284, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.7719227672, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.3589155078, blue: 0, alpha: 1)]]
    
    
    let phrases:[String] = [
            "Drag and drop ONLY the primary colors into the circles",
            "Drag and drop each secondary color into the circle between the two primary colors that made them",
            "Drag and drop each tertiary color into the circle between the primary color and the secondary color that made them"
        ]
    

    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9313784838, green: 0.9179487824, blue: 0.8697045445, alpha: 1)
        
        // User defaults
        self.currentLevel = self.defaults.integer(forKey: "level")
        self.completedLevels = self.defaults.integer(forKey: "completedLevels")
        self.soundOn = self.defaults.bool(forKey: "soundOn")
        
        // Label
        self.setLabel(text: self.phrases[self.currentLevel])
        view.addSubview(self.infoText)
        
        // Home button
        self.buttonHome = buttons.getHomeButton()
        self.buttonHome.addTarget(self, action: #selector(actHome), for: .touchDown)
        self.bgButtonHome = buttons.getBg(bt: self.buttonHome)
        view.addSubview(self.bgButtonHome)
        
        // Sound button
        self.buttonSound = self.buttons.getSoundOnButton()
        self.buttonSound.addTarget(self, action: #selector(actSound), for: .touchDown)
        self.changeButtonIcon()
        self.bgButtonSound = self.buttons.getBg(bt: self.buttonSound)
        view.addSubview(self.bgButtonSound)
                
        // Círculos
        self.createCircles(loop: 3, size: 80, corner: 40)
        self.createCircles(loop: 6, size: 60, corner: 30)
        self.createCircles(loop: 12, size: 40, corner: 20)
        
        
        let circulesView:[Circule] = self.circules[self.currentLevel]
        let circuleColors:[UIColor] = self.lvCirculeColors[self.currentLevel]
        let circuloIndex:[Int] = self.indexes[self.currentLevel]
        
        let listCount:Int = circulesView.count
        var actualCircule:Circule
        var cont:Int = 0
        
        for c in 0..<circuloIndex.count {
            actualCircule = circulesView[circuloIndex[c]]
            if ((c%2 == 0) && (listCount != 3)) {
                actualCircule.setColor(c: circuleColors[cont])
                cont += 1
            }
            circlePContainer.addSubview(actualCircule.getView())
        }
        
        view.addSubview(circlePContainer)
        
        
        // Tintas
        let inkColors:[UIColor] = self.lvInkColors[self.currentLevel]
        for x in 0..<6 {
            self.inks.append(Ink(num:x, color:inkColors[x]))
            view.addSubview(inks[x].getView())
        }
        
        
        // Pegando a música
        if let audioFile = Bundle.main.url(forResource: "acertoFinal.mp4", withExtension: nil) {
            do {
                try self.audioCorrect = AVAudioPlayer(contentsOf: audioFile)
                self.audioCorrect?.numberOfLoops = 0
                self.audioCorrect?.pause()
            } catch {
                print("Erro ao tentar tocar o som: \(error)")
            }
        } else {
            print("Audio não encontrado")
        }
        
        if let audioFile2 = Bundle.main.url(forResource: "erroFinal.mp4", withExtension: nil) {
            do {
                try self.audioWrong = AVAudioPlayer(contentsOf: audioFile2)
                self.audioWrong?.numberOfLoops = 0
                self.audioWrong?.pause()
            } catch {
                print("Erro ao tentar tocar o som: \(error)")
            }
        } else {
            print("Audio não encontrado")
        }
        

        self.setConstraints()

    }
    
    
    /* ==== DRAG AND DROP ==== */
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        var inkView:UIImageView
        
        for i in self.inks {
            inkView = i.getView()
            if touch.view == inkView {
                self.lastPosition = [inkView.frame.origin.x, inkView.frame.origin.y]
                self.offset = touch.location(in: inkView)
                self.isDragging = true
                self.inkDragging = i
                return
            }
        }
        self.offset = nil
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let touch = touches.first!
        let location = touch.location(in: view)
        
        guard let offset = self.offset else {return}
        
        if self.inkDragging.getView().frame.contains(location) && isDragging {
            self.inkDragging.getView().frame.origin.x = location.x - offset.x
            self.inkDragging.getView().frame.origin.y = location.y - offset.y
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if (self.isDragging){
            let touch = touches.first!
            let lastLocation = touch.location(in: self.circlePContainer)
            
            let currentCircules:[Circule] = self.circules[self.currentLevel]
            let currentIndex:[Int] = self.indexes[self.currentLevel]
            var circuleView:UIView
            
            for c in 0..<currentCircules.count {
                circuleView = currentCircules[currentIndex[c]].getView()
                
                if (circuleView.frame.contains(lastLocation)) {
                    self.gameLogic(indCirculeWillPaint:c)
                    break
                }
            }
            if (self.isDragging){
                let lastDraged = self.inkDragging.getView()
                lastDraged.frame.origin.x = self.lastPosition[0]
                lastDraged.frame.origin.y = self.lastPosition[1]
                self.isDragging = false
            }
        }
    }
    
    func gameLogic(indCirculeWillPaint:Int) {
        let currentCircules:[Circule] = self.circules[self.currentLevel]
        let currentIndex:[Int] = self.indexes[self.currentLevel]
        let colors:[UIColor] = self.correctColors[self.currentLevel]
        var isValid:Bool = false
        
        if (self.currentLevel == 0) {
            for x in 0..<colors.count {
                if (self.inkDragging.getColor() == colors[x] && currentCircules[currentIndex[indCirculeWillPaint]].getColor() == .gray) {
                    currentCircules[currentIndex[indCirculeWillPaint]].setColor(c: colors[x])
                    isValid = true
                    break
                }
            }
        }else{
            var mix:[UIColor] = []
            var neighbor1:UIColor
            var neighbor2:UIColor
            var cont:Int = 0
            
            for x in 0..<colors.count {
                if self.inkDragging.getColor() == colors[x] {
                    mix = self.parentColors[colors[x]]!
                    
                    if (indCirculeWillPaint-1 < 0){break}
                    neighbor1 = currentCircules[currentIndex[indCirculeWillPaint-1]].getColor()
                    
                    if (indCirculeWillPaint+1 >= self.indexes[self.currentLevel].count){
                        neighbor2 = currentCircules[currentIndex[0]].getColor()
                    }else{
                        neighbor2 = currentCircules[currentIndex[indCirculeWillPaint+1]].getColor()
                    }
                    
                    for y in mix{if (y == neighbor1 || y == neighbor2) {cont += 1}}
                    
                    if (cont == 2) {
                        currentCircules[currentIndex[indCirculeWillPaint]].setColor(c: colors[x])
                        print(indCirculeWillPaint)
                        isValid = true
                    }
                }
            }
        }
        if (isValid) {
            if(self.soundOn){self.audioCorrect?.play()}
            self.isDragging = false
            self.inkDragging.getView().isHidden = true
            self.inkDragging = Ink(num: 0, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            self.gameCount += 1
            if self.gameCount == self.allGameCounts[self.currentLevel] {self.actNext()}
            return
        }
        if(self.soundOn){self.audioWrong?.play()}
    }
    
    
    /* ==== AÇÕES DOS BOTOES ==== */
    

    @IBAction func actHome() -> Void{
        guard let vc = storyboard?.instantiateViewController(identifier: "idMenu") as? MenuViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    
    @IBAction func actNext() -> Void{
        print("Current: \(self.currentLevel)")
        print("Completed: \(self.completedLevels)")
        
        if (self.currentLevel == self.completedLevels) {
            print("Add mais um level: \(self.completedLevels)")
            self.completedLevels += 1
            self.defaults.set(self.completedLevels, forKey: "completedLevels")
        }
        guard let vc = storyboard?.instantiateViewController(identifier: "idPrice") as? PriceViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @objc
    private func actSound(_ button: UIButton){
        self.soundOn = !self.soundOn
        self.defaults.setValue(self.soundOn, forKey: "soundOn")
        self.changeButtonIcon()
    }
    
    private func changeButtonIcon(){
        if (soundOn){self.buttons.setBtImage(bt: self.buttonSound, icon: "speaker.wave.2")}
        else{self.buttons.setBtImage(bt: self.buttonSound, icon: "speaker.slash")}
    }

    
    /* ==== MÉTODOS ==== */
    
    
    private func setLabel(text:String) -> Void{
        self.infoText.text = text
        self.infoText.textAlignment = .center
        self.infoText.font = .systemFont(ofSize: 18, weight: .regular)
        self.infoText.numberOfLines = 7
        self.infoText.textColor = .black
        self.infoText.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func createCircles(loop:Int, size:CGFloat, corner:CGFloat){
        var circulos:[Circule] = []
        
        for _ in 0..<loop {circulos.append(Circule(size: size,color: .gray, corner: corner))}
        self.circules.append(circulos)
        circulos = []
    }
    

    
    private func setConstraints() -> Void{
        
        // background home
        self.bgButtonHome.translatesAutoresizingMaskIntoConstraints = false
        let bgButtonHomeConstraints: [NSLayoutConstraint] = [
            self.bgButtonHome.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            self.bgButtonHome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        ]
        NSLayoutConstraint.activate(bgButtonHomeConstraints)
        
        
        // background sound
        self.bgButtonSound.translatesAutoresizingMaskIntoConstraints = false
        let bgButtonSoundConstraints: [NSLayoutConstraint] = [
            self.bgButtonSound.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            self.bgButtonSound.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ]
        NSLayoutConstraint.activate(bgButtonSoundConstraints)
        
        
        // info text
        let infoTextConstraints: [NSLayoutConstraint] = [
            infoText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            infoText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            infoText.topAnchor.constraint(equalTo: bgButtonHome.topAnchor, constant: 90)
        ]
        NSLayoutConstraint.activate(infoTextConstraints)

    //        /* ==== TINTAS ===== */


        let ink01Constraints: [NSLayoutConstraint] = [
            self.inks[0].getView().bottomAnchor.constraint(equalTo: self.inks[3].getView().topAnchor, constant: -10),
            self.inks[0].getView().leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ]
        NSLayoutConstraint.activate(ink01Constraints)
        self.inks[0].setConstraints(l: ink01Constraints)


        let ink02Constraints: [NSLayoutConstraint] = [
            self.inks[1].getView().bottomAnchor.constraint(equalTo: self.inks[0].getView().bottomAnchor),
            self.inks[1].getView().leftAnchor.constraint(equalTo: self.inks[0].getView().rightAnchor, constant: 20),
        ]
        NSLayoutConstraint.activate(ink02Constraints)
        self.inks[1].setConstraints(l: ink02Constraints)


        let ink03Constraints: [NSLayoutConstraint] = [
            self.inks[2].getView().bottomAnchor.constraint(equalTo: self.inks[0].getView().bottomAnchor),
            self.inks[2].getView().leftAnchor.constraint(equalTo: self.inks[1].getView().rightAnchor, constant: 20),
        ]
        NSLayoutConstraint.activate(ink03Constraints)
        self.inks[2].setConstraints(l: ink03Constraints)


        let ink04Constraints: [NSLayoutConstraint] = [
            self.inks[3].getView().bottomAnchor.constraint(equalTo: self.inks[5].getView().bottomAnchor),
            self.inks[3].getView().rightAnchor.constraint(equalTo: self.inks[4].getView().leftAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(ink04Constraints)
        self.inks[3].setConstraints(l: ink04Constraints)


        let ink05Constraints: [NSLayoutConstraint] = [
            self.inks[4].getView().bottomAnchor.constraint(equalTo: self.inks[5].getView().bottomAnchor),
            self.inks[4].getView().rightAnchor.constraint(equalTo: self.inks[5].getView().leftAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(ink05Constraints)
        self.inks[4].setConstraints(l: ink05Constraints)


        let ink06Constraints: [NSLayoutConstraint] = [
            self.inks[5].getView().bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            self.inks[5].getView().trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(ink06Constraints)
        self.inks[5].setConstraints(l: ink05Constraints)
        
        
        circlePContainer.translatesAutoresizingMaskIntoConstraints = false
        let circlePContainerConstraints: [NSLayoutConstraint] = [
            circlePContainer.topAnchor.constraint(equalTo: infoText.bottomAnchor, constant: 25),
            circlePContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circlePContainer.heightAnchor.constraint(equalToConstant: 300),
            circlePContainer.widthAnchor.constraint(equalToConstant: 300)
        ]
        NSLayoutConstraint.activate(circlePContainerConstraints)
        
        
        var circule:[Circule]
        
        // ==== PRIMÁRIAS ====
        if (self.currentLevel == 0) {
            circule = self.circules[0]
            let circleP0Constraints: [NSLayoutConstraint] = [
                circule[0].getView().topAnchor.constraint(equalTo: circlePContainer.topAnchor, constant: 45),
                circule[0].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor),
            ]
            NSLayoutConstraint.activate(circleP0Constraints)
            

            let circleP1Constraints: [NSLayoutConstraint] = [
                circule[1].getView().bottomAnchor.constraint(equalTo: circlePContainer.bottomAnchor, constant: -45),
                circule[1].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: -65),
            ]
            NSLayoutConstraint.activate(circleP1Constraints)
            
            
            let circleP2Constraints: [NSLayoutConstraint] = [
                circule[2].getView().bottomAnchor.constraint(equalTo: circlePContainer.bottomAnchor, constant: -45),
                circule[2].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: 65),
            ]
            NSLayoutConstraint.activate(circleP2Constraints)
        }
        // ==== SECUNDÁRIAS ====
        if (self.currentLevel == 1) {
            circule = self.circules[1]
           let circleS0Constraints: [NSLayoutConstraint] = [
               circule[0].getView().topAnchor.constraint(equalTo: circlePContainer.topAnchor, constant: 25),
               circule[0].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor),
           ]
           NSLayoutConstraint.activate(circleS0Constraints)
           

           let circleS1Constraints: [NSLayoutConstraint] = [
               circule[1].getView().topAnchor.constraint(equalTo: circule[0].getView().centerYAnchor, constant: 25),
               circule[1].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: -75),
           ]
           NSLayoutConstraint.activate(circleS1Constraints)
           

           let circleS2Constraints: [NSLayoutConstraint] = [
               circule[2].getView().topAnchor.constraint(equalTo: circule[0].getView().centerYAnchor, constant: 25),
               circule[2].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: 75),
           ]
           NSLayoutConstraint.activate(circleS2Constraints)
           

           let circleS3Constraints: [NSLayoutConstraint] = [
               circule[3].getView().bottomAnchor.constraint(equalTo: circule[5].getView().centerYAnchor, constant: -25),
               circule[3].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: -75),
           ]
           NSLayoutConstraint.activate(circleS3Constraints)
           

           let circleS4Constraints: [NSLayoutConstraint] = [
               circule[4].getView().bottomAnchor.constraint(equalTo: circule[5].getView().centerYAnchor, constant: -25),
               circule[4].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: 75),
           ]
           NSLayoutConstraint.activate(circleS4Constraints)
           

           let circleS5Constraints: [NSLayoutConstraint] = [
               circule[5].getView().bottomAnchor.constraint(equalTo: circlePContainer.bottomAnchor, constant: -25),
               circule[5].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor),
           ]
           NSLayoutConstraint.activate(circleS5Constraints)
        }
       
       // ==== TERCIÁRIAS ====
        if (self.currentLevel == 2) {
            circule = self.circules[2]
           //t0
           let circleT0Constraints: [NSLayoutConstraint] = [
               circule[0].getView().topAnchor.constraint(equalTo: circlePContainer.topAnchor, constant: 18),
               circule[0].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor),
           ]
           NSLayoutConstraint.activate(circleT0Constraints)
           
           //t1
           let circleT1Constraints: [NSLayoutConstraint] = [
               circule[1].getView().topAnchor.constraint(equalTo: circule[0].getView().centerYAnchor),
               circule[1].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: -50),
           ]
           NSLayoutConstraint.activate(circleT1Constraints)
           
           //t2
           let circleT2Constraints: [NSLayoutConstraint] = [
               circule[2].getView().topAnchor.constraint(equalTo: circule[0].getView().centerYAnchor),
               circule[2].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: 50),
           ]
           NSLayoutConstraint.activate(circleT2Constraints)
           
           //t3
           let circleT3Constraints: [NSLayoutConstraint] = [
               circule[3].getView().topAnchor.constraint(equalTo: circule[1].getView().centerYAnchor, constant: 20),
               circule[3].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: -90),
           ]
           NSLayoutConstraint.activate(circleT3Constraints)
           
           //t4
           let circleT4Constraints: [NSLayoutConstraint] = [
               circule[4].getView().topAnchor.constraint(equalTo: circule[1].getView().centerYAnchor, constant: 20),
               circule[4].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: 90),
           ]
           NSLayoutConstraint.activate(circleT4Constraints)
           
           //t5
           let circleT5Constraints: [NSLayoutConstraint] = [
               circule[5].getView().centerYAnchor.constraint(equalTo: circlePContainer.centerYAnchor),
               circule[5].getView().leadingAnchor.constraint(equalTo: circlePContainer.leadingAnchor, constant: 18),
           ]
           NSLayoutConstraint.activate(circleT5Constraints)
           
           //t6
           let circleT6Constraints: [NSLayoutConstraint] = [
               circule[6].getView().centerYAnchor.constraint(equalTo: circlePContainer.centerYAnchor),
               circule[6].getView().trailingAnchor.constraint(equalTo: circlePContainer.trailingAnchor, constant: -18),
           ]
           NSLayoutConstraint.activate(circleT6Constraints)
           
           //t7
           let circleT7Constraints: [NSLayoutConstraint] = [
               circule[7].getView().bottomAnchor.constraint(equalTo: circule[9].getView().centerYAnchor, constant: -20),
               circule[7].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: -90),
           ]
           NSLayoutConstraint.activate(circleT7Constraints)
           
           //t8
           let circleT8Constraints: [NSLayoutConstraint] = [
               circule[8].getView().bottomAnchor.constraint(equalTo: circule[9].getView().centerYAnchor, constant: -20),
               circule[8].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: 90),
           ]
           NSLayoutConstraint.activate(circleT8Constraints)
           
           //t9
           let circleT9Constraints: [NSLayoutConstraint] = [
               circule[9].getView().bottomAnchor.constraint(equalTo: circule[11].getView().centerYAnchor),
               circule[9].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: -50),
           ]
           NSLayoutConstraint.activate(circleT9Constraints)
           
           //t10

           let circleT10Constraints: [NSLayoutConstraint] = [
               circule[10].getView().bottomAnchor.constraint(equalTo: circule[11].getView().centerYAnchor),
               circule[10].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor, constant: 50),
           ]
           NSLayoutConstraint.activate(circleT10Constraints)
           
           //t11

           let circleT11Constraints: [NSLayoutConstraint] = [
               circule[11].getView().bottomAnchor.constraint(equalTo: circlePContainer.bottomAnchor, constant: -18),
               circule[11].getView().centerXAnchor.constraint(equalTo: circlePContainer.centerXAnchor),
           ]
           NSLayoutConstraint.activate(circleT11Constraints)
        }
        
    }
}
