//
//  BlurProgressorView.swift
//  Pods
//
//  Created by Chang, Hao on 20/05/2017.
//
//

import UIKit

public typealias BlurProgressorParameter = UIBlurEffectStyle

class BlurProgressorView: ProgressorView {
    override func prepareForProgress(parameter: Any? = nil) {
        
        var style: BlurProgressorParameter = .light
        
        if let s = parameter as? BlurProgressorParameter {
            style = s
        } else {
            print("invalid blur style specified. \(parameter)")
            print("using .light as default.")
        }
        
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
