//
//  UIViewController+ProgressParents.swift
//  Pods
//
//  Created by Chang, Hao on 22/05/2017.
//
//

import UIKit

extension UIViewController: ProgressParent {
    open func add(progressorViews: [ProgressorView], completion: @escaping (() -> Void)) {
        view.add(progressorViews: progressorViews, completion: completion)
    }
    
    open func remove(progressorViews: [ProgressorView], completion: @escaping (() -> Void)) {
        view.remove(progressorViews: progressorViews, completion: completion)
    }
}

