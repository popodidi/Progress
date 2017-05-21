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

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Progress.register(progressorView: CustomProgressorView.self, withIdentifier: "custom_example")
    }


    @IBAction func activityIndicatorProgress() {
        Progress.start(in: imageView, .blur(style: .dark), .activityIndicator)
    }
    @IBAction func ringProgress() {
        Progress.start(in: imageView, .blur(style: .extraLight), .ring)
    }
    
    @IBAction func customProgress() {
        Progress.start(in: imageView, .color(parameter: (.cyan, 0.5)), .custom(identifier: "custom_example", parameter: nil))
    }
    @IBAction func end() {
        Progress.end(in: imageView)
    }
    @IBAction func updateProgress(_ sender: UISlider) {
        Progress.update(sender.value, in: imageView)
    }
}

