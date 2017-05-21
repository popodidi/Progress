//
//  ProgressorType.swift
//  Pods
//
//  Created by Chang, Hao on 21/05/2017.
//
//

import Foundation

public enum ProgressorType {
    case
    color(parameter: ColorProgressorParameter),
    blur(type: UIBlurEffectStyle),
    activityIndicator,
    ring,
    customer(identifier: String, parameter: Any?)
    
    var identifier: String {
        switch self {
        case .color: return "color"
        case .blur: return "blur"
        case .activityIndicator: return "activityIndicator"
        case .ring: return "ring"
        case .customer(let (id, _)): return id
        }
    }
    
    var parameter: Any? {
        switch self {
        case .color(let param): return param
        case .blur(let type): return type
        case .customer(let (_, param)): return param
        default: return nil
        }
    }
}
