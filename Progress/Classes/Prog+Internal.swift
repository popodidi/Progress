//
//  Progress+Internal.swift
//  Pods
//
//  Created by Chang, Hao on 21/05/2017.
//
//

import Foundation

extension Prog {
    // MARK: - private func
    internal func progressView(with type: ProgressorType) -> ProgressorView {
        switch type {
        case .custom(let (identifier, _)): return customProgressorView(with: identifier)
        default: return builtInProgressorView(with: type.identifier)
        }
    }
    
    internal func builtInProgressorView(with identifier: String) -> ProgressorView {
        guard let progressorView = builtInProgressorViewTypes[identifier]?.init() else {
            fatalError("progressor view with identifier \"\(identifier)\" not fount.")
        }
        return progressorView
    }
    
    internal func customProgressorView(with identifier: String) -> ProgressorView {
        guard let progressorView = customeProgressorViewTypes[identifier]?.init() else {
            fatalError("progressor view with identifier \"\(identifier)\" not fount.")
        }
        return progressorView
    }
    
}
