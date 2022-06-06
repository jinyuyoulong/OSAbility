//
//  ViewController.swift
//  OSAbility
//
//  Created by jinyuyoulong on 12/27/2021.
//  Copyright (c) 2021 jinyuyoulong. All rights reserved.
//

import UIKit
import OSAbility
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AudioSessionManager.shared().setPlayerSession()
//        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//            AudioSessionManager.setPlaybackSession()
//        }
        NotificationCenter.default.addObserver(self, selector: #selector(xxx(info:)),
                                               name: AudioSessionManager.routeChangeNoti,
                                               object: nil)
    }
    @objc
    func xxx(info: Notification)  {
        
    }


    var player:AVAudioPlayer?
    @IBAction func playmp3(_ sender: Any) {
        let path = Bundle.main.path(forResource: "起风了", ofType: "mp3") ?? ""
        let url = URL(fileURLWithPath: path)
        player = try? AVAudioPlayer.init(contentsOf: url)
        player?.play()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

