//
//  ProgressorView.swift
//  Pods
//
//  Created by Chang, Hao on 19/05/2017.
//
//

import UIKit

/**
 Subclass to have custom progressor.
 */
open class ProgressorView: UIView {
    // MARK: - to be override
    /**
     The func will be executed before added to progress parent.
     
     - parameter parameter: The parameter passed in `ProgressorType.custom(identifier:parameter:)`
     */
    open func prepareForProgress(parameter: Any? = nil) {}
    
    /**
     Progress starting animation. 
     Always call completion at the end of starting animation
     
     - parameter parameter: The parameter passed in `ProgressorType.custom(identifier:parameter:)`
     - parameter completion: Callback function after starting animation
     */
    open func startProgress(parameter: Any? = nil, completion: @escaping (() -> Void)) {
        completion()
    }
    
    /**
     Update progress view for progress completion
     
     - parameter progress: completion percentage (suggested to be ranging from 0 to 1) 
     */
    open func update(progress: Float) {}
    
    /**
     Progress ending animation.
     Always call completion at the end of ending animation
     
     - parameter completion: Callback function after ending animation
     */
    open func endProgress(completion: @escaping (() -> Void)) {
        completion()
    }

}
