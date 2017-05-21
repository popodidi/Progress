//
//  BlurProgressorView.swift
//  Pods
//
//  Created by Chang, Hao on 20/05/2017.
//
//

import UIKit

class BlurProgressorView: ProgressorView {
    override func prepareForProgress(parameter: Any? = nil) {
        guard let style = parameter as? UIBlurEffectStyle else {
            print("invalid blur style specified. \(parameter)")
            return
        }
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
    
//    override func startProgress(parameter: Any? = nil, completion: @escaping (() -> Void)) {
//        completion()
//    }
//    override func update(progress: Float) {
//    }
//    override func endProgress(completion: @escaping (() -> Void)) {
//        completion()
//    }
}
