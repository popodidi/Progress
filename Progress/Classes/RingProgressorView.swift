//
//  RingProgressorView.swift
//  Pods
//
//  Created by Chang, Hao on 21/05/2017.
//
//

import UIKit

class RingProgressorView: ProgressorView {
    var progress: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var ringColor: UIColor = UIColor.black.withAlphaComponent(0.5)
    let lineWidth: CGFloat = 2
    let radius: CGFloat = 12
    
    private weak var shapeLayer: CAShapeLayer?
    private var isAnimating: Bool = false { didSet { setNeedsDisplay() } }
    
    
    func startAnimation() {
        if isAnimating { return }
        // remove old shape layer if any
        self.shapeLayer?.removeFromSuperlayer()
        let shapeLayer = CAShapeLayer()
        
        let circleCenter: CGPoint = CGPoint(x: frame.width/2, y: frame.height/2)
        var path: UIBezierPath {
            let path = UIBezierPath()
            path.addArc(withCenter: CGPoint.zero, radius: radius, startAngle: -CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi) * 2 - CGFloat(Double.pi/2), clockwise: true)
            return path
        }
        
        // primary path
        let path_2 = path
        let layer_2 = CAShapeLayer()
        layer_2.strokeColor = ringColor.cgColor
        layer_2.lineWidth = lineWidth + 2
        layer_2.fillColor = UIColor.clear.cgColor
        layer_2.backgroundColor = UIColor.clear.cgColor
        layer_2.path = path_2.cgPath
        
        let animation_2 = CABasicAnimation(keyPath: "strokeEnd")
        animation_2.fromValue = 0
        animation_2.toValue = 0.4
        animation_2.duration = 0.6
        animation_2.repeatCount = Float.infinity
        animation_2.isRemovedOnCompletion = false
        animation_2.autoreverses = true
        animation_2.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        layer_2.add(animation_2, forKey: "strokeEndAnimation")
        
        shapeLayer.addSublayer(layer_2)
        
        let animation_rotate = CABasicAnimation(keyPath: "transform.rotation.z")
        animation_rotate.fromValue = 0
        animation_rotate.toValue = Double.pi * 2
        animation_rotate.duration = 0.8
        animation_rotate.repeatCount = Float.infinity
        shapeLayer.add(animation_rotate, forKey: "rotation")
        
        shapeLayer.transform = CATransform3DTranslate(shapeLayer.transform, circleCenter.x, circleCenter.y, 0)
        
        // save shape layer
        
        layer.addSublayer(shapeLayer)
        self.shapeLayer = shapeLayer
        isAnimating = true
    }
    
    func stopAnimation() {
        if !isAnimating { return }
        isAnimating = false
        self.shapeLayer?.removeFromSuperlayer()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if !isAnimating {
            let path = UIBezierPath()
            path.addArc(withCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: radius, startAngle: -CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi) * 2 * progress - CGFloat(Double.pi/2), clockwise: true)
            ringColor.setStroke()
            path.lineWidth = lineWidth
            path.stroke()
        }
    }
    
    
    override func prepareForProgress(parameter: Any? = nil) {
        backgroundColor = .clear
    }
    override func startProgress(parameter: Any? = nil, completion: @escaping (() -> Void)) {
        startAnimation()
        completion()
    }
    override func update(progress: Float) {
        self.progress = CGFloat(progress)
    }
//    override func endProgress(completion: @escaping (() -> Void)) {
//        completion()
//    }
}
