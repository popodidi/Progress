//
//  UIView+ProgressParents.swift
//  Pods
//
//  Created by Chang, Hao on 20/05/2017.
//
//

import UIKit

extension UIView: ProgressParent {
    public func add(progressorView: ProgressorView, completion: @escaping (() -> Void)) {
        addSubview(progressorView)
        progressorView.frame = bounds
        progressorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        progressorView.alpha = 0
        UIView.animate(withDuration: 0.2, animations: {
            progressorView.alpha = 1
        }) { _ in
            completion()
        }
    }

    public func remove(progressorView: ProgressorView, completion: @escaping (() -> Void)) {
        UIView.animate(withDuration: 0.2, animations: {
            progressorView.alpha = 0
        }) { _ in
            progressorView.removeFromSuperview()
            completion()
        }
    }
}
