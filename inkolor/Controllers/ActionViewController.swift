import UIKit

import class AVFoundation.AVAudioPlayer


class ActionViewController: UIViewController {
    let myView = ActionView()
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return UIRectEdge.bottom
    }
    
    // Audios
    var buttonSound = UIButton()
    var audioCorrect: AVAudioPlayer?
    var audioWrong: AVAudioPlayer?
    var soundOn:Bool = true
    
    // Drag and drop
    var offset:CGPoint?
    var isDragging:Bool = false
    var inkDragging:Ink = Ink()
    var lastPosition:[CGFloat] = []
    
    // User Defaults
    let defaults = UserDefaults.standard
    var currentLevel:Int = 0
    var completedLevels:Int = 0
    
    // Circulos
    var circules:[Circule] = []

    // Tintas
    var inks:[Ink] = []
    
    // Jogo
    let allGameCounts:[Int] = [3, 3, 6]
    var gameCount:Int = 0
    
    // Cores
    let parentColors:[UIColor: [UIColor]] = [
        #colorLiteral(red: 1, green: 0.3589155078, blue: 0, alpha: 1) : [ #colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1) ],
        #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1) : [ #colorLiteral(red: 0.9807119966, green: 0.8686016202, blue: 0, alpha: 1), #colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1) ],
        #colorLiteral(red: 1, green: 0.7719227672, blue: 0, alpha: 1) : [ #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1), #colorLiteral(red: 0.9807119966, green: 0.8686016202, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0.8076375723, green: 0.8700929284, blue: 0, alpha: 1) : [ #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 0.9807119966, green: 0.8686016202, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1) : [ #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0.9807119966, green: 0.8686016202, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0, green: 0.642051518, blue: 0.6346852183, alpha: 1) : [ #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1) : [ #colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1) ],
        #colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1) : [ #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1) ],
        #colorLiteral(red: 0.7449150681, green: 0, blue: 0.4703945518, alpha: 1) : [ #colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1), #colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1) ]
    ]
    
    let correctColors:[[UIColor]] = [
        [#colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0.9807119966, green: 0.8686016202, blue: 0, alpha: 1)],
        [#colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1)],
        [#colorLiteral(red: 1, green: 0.3589155078, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.7719227672, blue: 0, alpha: 1), #colorLiteral(red: 0.8076375723, green: 0.8700929284, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.642051518, blue: 0.6346852183, alpha: 1), #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1), #colorLiteral(red: 0.7449150681, green: 0, blue: 0.4703945518, alpha: 1)]
    ]
    
    let lvCirculeColors:[[UIColor]] = [
        [],
        [#colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0.9807119966, green: 0.8686016202, blue: 0, alpha: 1)],
        [#colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1), #colorLiteral(red: 0.9807119966, green: 0.8686016202, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1)]
    ]
    
    let lvInkColors:[[UIColor]] = [
        [#colorLiteral(red: 0.9581292272, green: 0.07425042242, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.1643555164, blue: 0.6718087792, alpha: 1), #colorLiteral(red: 0.9807119966, green: 0.8686016202, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1), #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1)],
        [#colorLiteral(red: 0.74874717, green: 0, blue: 0.6859405637, alpha: 1), #colorLiteral(red: 0, green: 0.6753202081, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.560541451, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.3589155078, blue: 0, alpha: 1), #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1), #colorLiteral(red: 0, green: 0.642051518, blue: 0.6346852183, alpha: 1)],
        [#colorLiteral(red: 0.7449150681, green: 0, blue: 0.4703945518, alpha: 1), #colorLiteral(red: 0.5137860179, green: 0, blue: 0.6884027123, alpha: 1), #colorLiteral(red: 0, green: 0.642051518, blue: 0.6346852183, alpha: 1), #colorLiteral(red: 0.8076375723, green: 0.8700929284, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.7719227672, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.3589155078, blue: 0, alpha: 1)]
    ]
    
    
    let phrases:[String] = [
        "Drag and drop ONLY the primary colors into the circles",
        "Drag and drop each secondary color into the circle between the colors that made them",
        "Drag and drop each tertiary color into the circle between the colors that made them"
    ]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view = self.myView
        self.view.backgroundColor = #colorLiteral(red: 0.9313784838, green: 0.9179487824, blue: 0.8697045445, alpha: 1)
    }


    override func viewDidLoad() {
        // User defaults
        self.currentLevel = self.defaults.integer(forKey: "level")
        self.completedLevels = self.defaults.integer(forKey: "completedLevels")
        self.soundOn = self.defaults.bool(forKey: "soundOn")
        
        self.myView.setCompletedLevels(level: self.currentLevel)
        // Label
        let infoLabel = self.myView.getInfoLabel()
        infoLabel.text = self.phrases[self.currentLevel]

        
        // Home button
        let buttonHome = self.myView.getButtonHome()
        buttonHome.addTarget(self, action: #selector(actHome), for: .touchDown)

        
        // Sound button
        self.buttonSound = self.myView.getButtonSound()
        self.buttonSound.addTarget(self, action: #selector(actSound), for: .touchDown)
        self.changeButtonIcon()

                
        // Círculos
        self.circules = self.myView.getGameCircules()
        
        let circuleColors:[UIColor] = self.lvCirculeColors[self.currentLevel]
        let listCount:Int = self.circules.count
        var cont:Int = 0
        
        for c in 0..<listCount {
            if ((c%2 == 0) && (listCount != 3)) {
                self.circules[c].setColor(c: circuleColors[cont])
                cont += 1
            }
        }
        
        // Tintas
        self.inks = self.myView.getInks()
        
        let inkColors:[UIColor] = self.lvInkColors[self.currentLevel]
        for x in 0..<6 {
            self.inks[x].setConfigs(num:x, color:inkColors[x])
        }
        
        
        // Pegando a música
        self.audioCorrect = self.getMusic(file: "acertoFinal.mp4")
        self.audioWrong = self.getMusic(file: "erroFinal.mp4")
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
        }; self.offset = nil
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let touch = touches.first!
        let location = touch.location(in: view)
        
        guard let offset = self.offset else {return}
        
        if (isDragging) {
            self.inkDragging.getView().frame.origin.x = location.x - offset.x
            self.inkDragging.getView().frame.origin.y = location.y - offset.y
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if (self.isDragging){
            let touch = touches.first!
            let lastLocation = touch.location(in: self.myView.getViewCircules())
            
            var circuleView:UIView
            
            for c in 0..<self.circules.count {
                circuleView = self.circules[c].getView()
                
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
        let colors:[UIColor] = self.correctColors[self.currentLevel]
        var isValid:Bool = false
        
        if (self.currentLevel == 0) {
            for x in 0..<colors.count {
                if (self.inkDragging.getColor() == colors[x] && self.circules[indCirculeWillPaint].getColor() == .gray) {
                    self.circules[indCirculeWillPaint].setColor(c: colors[x])
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
                    neighbor1 = self.circules[indCirculeWillPaint-1].getColor()
                    
                    if (indCirculeWillPaint+1 >= self.circules.count){
                        neighbor2 = self.circules[0].getColor()
                    }else{
                        neighbor2 = self.circules[indCirculeWillPaint+1].getColor()
                    }
                    
                    for y in mix{if (y == neighbor1 || y == neighbor2) {cont += 1}}
                    
                    if (cont == 2) {
                        self.circules[indCirculeWillPaint].setColor(c: colors[x])
                        isValid = true
                    }
                }
            }
        }
        if (isValid) {
            if(self.soundOn){self.audioCorrect?.play()}
            self.isDragging = false
            self.inkDragging.getView().isHidden = true
            self.inkDragging = Ink()
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
        if (self.currentLevel == self.completedLevels) {
            self.completedLevels += 1
            self.defaults.set(self.completedLevels, forKey: "completedLevels")
        }
        guard let vc = storyboard?.instantiateViewController(identifier: "idPrize") as? PrizeViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    
    @objc private func actSound(_ button: UIButton){
        self.soundOn = !self.soundOn
        self.defaults.setValue(self.soundOn, forKey: "soundOn")
        self.changeButtonIcon()
    }
    
    private func changeButtonIcon(){
        if (soundOn){Buttons().setBtImage(bt: self.buttonSound, icon: "speaker.wave.2")}
        else{Buttons().setBtImage(bt: self.buttonSound, icon: "speaker.slash")}
    }
    
    
    private func getMusic(file:String) -> AVAudioPlayer{
        var audio: AVAudioPlayer?
        if let audioFile2 = Bundle.main.url(forResource: file, withExtension: nil) {
            do {
                try audio = AVAudioPlayer(contentsOf: audioFile2)
                audio?.numberOfLoops = 0
                audio?.pause()
            } catch {
                print("Erro ao tentar tocar o som: \(error)")
            }
        } else {
            print("Audio não encontrado")
        }
        return audio!
    }
}
