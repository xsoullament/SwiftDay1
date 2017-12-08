//
//  ViewController.swift
//  SwiftDay1
//
//  Created by 谢斯强 on 2017/12/8.
//  Copyright © 2017年 谢斯强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var number: UILabel!
    
    @IBOutlet var palyButton: UIButton!
    
    @IBOutlet var pauseButton: UIButton!
    
    var timer: Timer?
    var conut = 0.0
    
    var isPlay = false{
        didSet{
            palyButton.isEnabled = isPlay
            pauseButton.isEnabled = !isPlay
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isPlay = true
    }
    
    @IBAction func startAction(_ sender: Any) {
        isPlay = false
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateNum), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        isPlay = true
        timer?.invalidate()
        timer = nil
    }
    
    @IBAction func resetAcrion(_ sender: Any) {
        isPlay = true
        timer?.invalidate()
        timer = nil
        conut = 0
        number.text = "\(conut)"
    }
    
    @objc func updateNum(){
        conut += 0.1
        number.text = String(format: "%.1f", conut)

    }
    
}

