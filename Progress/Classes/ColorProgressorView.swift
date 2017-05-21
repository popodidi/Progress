//
//  ColorProgressorView.swift
//  Pods
//
//  Created by Chang, Hao on 21/05/2017.
//
//

import UIKit

public typealias ColorProgressorParameter = (color: UIColor, alpha: CGFloat)

class ColorProgressorView: ProgressorView {
    override func prepareForProgress(parameter: Any? = nil) {
        guard let p = parameter as? ColorProgressorParameter else {
            print("invalid color progressor parameter. \(String(describing: parameter))")
            return
        }
        backgroundColor = p.color.withAlphaComponent(p.alpha)
    }
    
    override func startProgress(parameter: Any? = nil, completion: (() -> Void)) {
        completion()
    }
    override func update(progress: Float) {
    }
    override func endProgress() {
    }
}
