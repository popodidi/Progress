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
    internal func progressor(with type: ProgressorType) -> Progressor {
        switch type {
        case .custom(let (identifier, param)): return customProgressor(with: identifier, parameter: param)
        default: return builtInProgressor(with: type.identifier, parameter: type.parameter)
        }
    }
    
    internal func builtInProgressor(with identifier: String, parameter: Any?) -> Progressor {
        guard let progressor = builtInProgressorTypes[identifier]?.init(parameter: parameter) else {
            fatalError("progressor view with identifier \"\(identifier)\" not fount.")
        }
        return progressor
    }
    
    internal func customProgressor(with identifier: String, parameter: Any?) -> Progressor {
        guard let progressor = customeProgressorTypes[identifier]?.init(parameter: parameter) else {
            fatalError("progressor view with identifier \"\(identifier)\" not fount.")
        }
        return progressor
    }
    
}
