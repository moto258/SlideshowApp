//
//  ViewController.swift
//  SlideshowApp
//
//  Created by asamuzak on 2020/02/27.
//  Copyright © 2020 asamuzak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func tapImage(_ sender: Any) {
        performSegue(withIdentifier: "expand", sender: nil)
    }
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var button: UIButton!
    
    var number = 0
    var timer: Timer!
    let images = [UIImage(named: "rest_of_the_pieces.jpg"), UIImage(named: "cat_mause_and_me.jpg"), UIImage(named: "leaf_compilation.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let view = images[0]
        imageView.image = view
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expandViewController:ExpandViewController = segue.destination as! ExpandViewController
        expandViewController.image = images[number]
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            button.setTitle("再生", for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if number >= 2 {
            number = 0
        } else {
            number += 1
        }
        imageView.image = images[number]
    }
    
    @IBAction func backImage(_ sender: Any) {
        if number <= 0 {
            number = 2
        } else {
            number -= 1
        }
        imageView.image = images[number]
    }
    
    @objc func onTimer(_ timer: Timer) {
        if number >= 2 {
            number = 0
        } else {
            number += 1
        }
        imageView.image = images[number]
    }
    
    @IBAction func startStopTimer(_ sender: UIButton) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
            button.setTitle("停止", for: .normal)
        } else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            button.setTitle("再生", for: .normal)
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
}

