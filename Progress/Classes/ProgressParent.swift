//
//  ProgressParent.swift
//  Pods
//
//  Created by Chang, Hao on 19/05/2017.
//
//

import Foundation

/**
 Classes that conform to this protocol are able to add/remove `ProgressView`.
 */
public protocol ProgressParent: class {
    func add(progressorView: ProgressorView, completion: @escaping (() -> Void))
    func remove(progressorView: ProgressorView, completion: @escaping (() -> Void))
}
