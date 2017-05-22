//
//  UIViewController+ProgressParents.swift
//  Pods
//
//  Created by Chang, Hao on 22/05/2017.
//
//

import UIKit

extension UIViewController: ProgressParent {
    open func add(progressorView: ProgressorView, completion: @escaping (() -> Void)) {
        view.add(progressorView: progressorView, completion: completion)
    }
    
    open func remove(progressorView: ProgressorView, completion: @escaping (() -> Void)) {
        view.remove(progressorView: progressorView, completion: completion)
    }
}

