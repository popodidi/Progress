//
//  LabelProgressorView.swift
//  Pods
//
//  Created by Chang, Hao on 24/05/2017.
//
//

import UIKit

public typealias LabelProgressorParameter = (font: UIFont, color: UIColor)

public let DefaultLabelProgressorParameter: LabelProgressorParameter = (UIFont.systemFont(ofSize: 14), .black)

class LabelProgressorView: ProgressorView {
    lazy var label: UILabel = UILabel()
    var progress: Float = 0 {
        didSet {
            let percent = Int(floor(progress*100))
            label.text = "\(percent)%"
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        label.center = center
    }
    
    override func prepareForProgress(parameter: Any?) {
        addSubview(label)
        label.text = "0%"
        backgroundColor = .clear
        var param: LabelProgressorParameter = DefaultLabelProgressorParameter
        if let p = parameter as? LabelProgressorParameter {
            param = p
        } else {
            print("invalid label progressor parameter. \(String(describing: parameter))")
            print("using default parameter instead. \(param)")
        }
        label.font = param.font
        label.textColor = param.color
    }
    
    override func update(progress: Float) {
        self.progress = progress
    }
    
    override func endProgress(completion: @escaping (() -> Void)) {
        animate(from: progress, to: 1, completion: completion)
    }
    
    private func animate(from: Float, to: Float, completion: @escaping ()->Void) {
        progress = from
        recursiveUpdate(to: to, completion: completion)
    }
    
    private func recursiveUpdate(to target: Float, completion: @escaping ()->Void) {
        if progress <= target {
            progress = progress + 0.01
            let when = DispatchTime.now() + Prog.maxEndingAnimationDuration/100
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                self.recursiveUpdate(to: target, completion: completion)
            }
        } else {
            completion()
        }
    }    
}
