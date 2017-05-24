//
//  UIView+ProgressParents.swift
//  Pods
//
//  Created by Chang, Hao on 20/05/2017.
//
//

import UIKit

extension UIView: ProgressParent {
    open func add(progressorViews: [ProgressorView], completion: @escaping (() -> Void)) {
        progressorViews.forEach {
            self.addSubview($0)
            $0.frame = bounds
            $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            $0.alpha = 0
        }
        UIView.animate(withDuration: 0.2, animations: {
            progressorViews.forEach {
                $0.alpha = 1
            }
        }) { _ in
            completion()
        }
    }

    open func remove(progressorViews: [ProgressorView], completion: @escaping (() -> Void)) {
        UIView.animate(withDuration: 0.2, animations: {
            progressorViews.forEach {
                $0.alpha = 0
            }
        }) { _ in
            progressorViews.forEach {
                $0.removeFromSuperview()
            }
            completion()
        }
    }
}
