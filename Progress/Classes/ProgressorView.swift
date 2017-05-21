//
//  ProgressorView.swift
//  Pods
//
//  Created by Chang, Hao on 19/05/2017.
//
//

import UIKit

open class ProgressorView: UIView {
    // MARK: - to be override
    open func prepareForProgress(parameter: Any? = nil) {}
    open func startProgress(parameter: Any? = nil, completion: @escaping (() -> Void)) {
        completion()
    }
    open func update(progress: Float) {}
    open func endProgress(completion: @escaping (() -> Void)) {
        completion()
    }

}
