//
//  CustomProgressorView.swift
//  Progress
//
//  Created by Chang, Hao on 21/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Progress

class CustomProgressorView: ProgressorView {
    var label: UILabel = UILabel()
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        label.center = center
    }
    
    override func prepareForProgress(parameter: Any?) {
        addSubview(label)
        label.text = "loading..."
    }
    override func startProgress(parameter: Any?, completion: (() -> Void)) {
        completion()
    }
    override func update(progress: Float) {
        let percent = Int(floor(progress*100))
        label.text = "loading \(percent)% ..."
        setNeedsLayout()
    }
    override func endProgress() {
    }
}
