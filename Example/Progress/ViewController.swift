//
//  ViewController.swift
//  Progress
//
//  Created by popodidi on 05/19/2017.
//  Copyright (c) 2017 popodidi. All rights reserved.
//

import UIKit
import Progress

class ViewController: UIViewController {

    @IBOutlet weak var imageView_1: UIImageView!
    @IBOutlet weak var imageView_2: UIImageView!
    
    @IBOutlet weak var vcSwitch: UISwitch!
    @IBOutlet weak var imageSwitch: UISwitch!
    
    var progressParent: ProgressParent {
        return vcSwitch.isOn ? (self as ProgressParent) : (imageView as ProgressParent)
    }
    
    var imageView: UIImageView {
        return imageSwitch.isOn ? imageView_2 : imageView_1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Progress.register(progressorView: CustomProgressorView.self, withIdentifier: "custom_example")
    }


    @IBAction func activityIndicatorProgress() {
        Progress.start(in: progressParent, .blur(.dark), .activityIndicator)
    }
    @IBAction func ringProgress() {
        Progress.start(in: progressParent, .blur(.extraLight), .ring(nil))
    }
    @IBAction func customProgress() {
        Progress.start(in: progressParent, .color(UIColor.cyan.withAlphaComponent(0.5)), .custom(identifier: "custom_example", parameter: nil))
    }
    @IBAction func ringAndCustomProgress() {
        let ringParam: RingProgressorParameter = (.endless, UIColor.brown.withAlphaComponent(0.5), 20, 5)
        Progress.start(in: progressParent, .color(nil), .ring(ringParam), .custom(identifier: "custom_example", parameter: nil))
    }
    @IBAction func end() {
        Progress.end(in: progressParent)
    }
    
    @IBAction func updateProgress(_ sender: UISlider) {
        Progress.update(sender.value, in: progressParent)
    }
}

