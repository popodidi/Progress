//
//  Progress.swift
//  Pods
//
//  Created by Chang, Hao on 19/05/2017.
//
//

import Foundation

public final class Progress {
    static var shared: Progress = Progress()
    private init() {}
    internal var progressParents: [ProgressParent] = []
    internal var progressorViews: [[ProgressorView]] = []
    
    // MARK: - Progressors
    var builtInProgressorViewTypes: [String: ProgressorView.Type] = [
        "color": ColorProgressorView.self,
        "blur": BlurProgressorView.self,
        "activityIndicator": ActivityIndicatorProgressorView.self,
        "ring": RingProgressorView.self
    ]
    var customeProgressorViewTypes: [String: ProgressorView.Type] = [:]
    
    // MARK: - Data
    /**
     Check if the item is currently in progress
     
     - parameter parent: ProgressParent
     */
    public static func `is`(in parent: ProgressParent) -> Bool {
        return shared.progressParents.contains { $0 === parent }
    }
    
    /**
     Get all the progressor views in parent
     
     - parameter parent: ProgressParent
     */
    public static func progressorViews(of parent: ProgressParent) -> [ProgressorView] {
        guard let index = shared.progressParents.index(where: {$0 === parent}),
            index < shared.progressorViews.count else { return [] }
        return shared.progressorViews[index]
    }
    
    /**
     Register custom progressor view with identifier
     
     - parameter progressorViewType: progressor view type
     - parameter identifier: unique identifier for each progressor type
     */
    public static func register(progressorView progressorViewType: ProgressorView.Type, withIdentifier identifier: String) {
        shared.customeProgressorViewTypes[identifier] = progressorViewType
    }
    
    // MARK: - START
    /**
     Start progress in progress parent
     
     - parameter parent: progress parent to start progress in
     - parameter types: arbitrary number of progressor types
     - parameter completion: callback function after all the starting animation
     */
    public static func start(in parent: ProgressParent, _ types: ProgressorType..., completion: @escaping (()->Void) = {}) {
        guard !shared.progressParents.contains(where: { $0 === parent}) else {
            print("\(parent) is already in progress")
            return
        }
        shared.progressParents.append(parent)
        shared.progressorViews.append([])
        
        recursiveStart(in: parent, remainingTypes: types) { 
            completion()
        }
    }
    
    static func recursiveStart(in parent: ProgressParent, remainingTypes: [ProgressorType], completion: @escaping (()->Void)) {
        if let type = remainingTypes.first {
            Progress.start(in: parent, type: type) {
                var remain = remainingTypes
                remain.remove(at: 0)
                Progress.recursiveStart(in: parent, remainingTypes: remain, completion: completion)
            }
        } else {
            completion()
        }
    }
    
    static func start(in parent: ProgressParent, type: ProgressorType, completion: @escaping (()->Void)) {
        guard let index = shared.progressParents.index(where: {$0 === parent}),
            index < shared.progressorViews.count else { return }
        
        let progressorView = shared.progressView(with: type)
        shared.progressorViews[index].append(progressorView)
        progressorView.prepareForProgress(parameter: type.parameter)
        parent.add(progressorView: progressorView) {
            progressorView.startProgress(parameter: type.parameter, completion: completion)
        }
        
    }
    
    // MARK: - UPDATE
    /**
     Update progress in progress parent
     
     - parameter progress: completion percentage (suggested to be ranging from 0 to 1)
     - parameter parent: progress parent to update progress
     */
    public static func update(_ progress: Float, in parent: ProgressParent) {
        guard shared.progressParents.contains(where: { $0 === parent}) else {
            print("\(parent) is not in progress, use Progress.start(in:type:) instead.")
            return
        }
        
        for progressorView in progressorViews(of: parent) {
            progressorView.update(progress: progress)
        }
    }
    
    // MARK: - END
    /**
     End progress in progress parent
     
     - parameter parent: progress parent to end progress
     - parameter completion: callback function after all the ending animation
     */
    public static func end(in parent: ProgressParent, completion: @escaping (()->Void) = {}) {
        recursiveEnd(in: parent, remainingProgressorViews: progressorViews(of: parent).reversed()) { 
            if let index = shared.progressParents.index(where: { $0 === parent}) {
                shared.progressParents.remove(at: index)
                shared.progressorViews.remove(at: index)
            }
            completion()
        }
    }
    
    static func recursiveEnd(in parent: ProgressParent, remainingProgressorViews: [ProgressorView], completion: @escaping (()->Void)) {
        if let progressorView = remainingProgressorViews.first {
            progressorView.endProgress() {
                parent.remove(progressorView: progressorView) {
                    var remain = remainingProgressorViews
                    remain.remove(at: 0)
                    Progress.recursiveEnd(in: parent, remainingProgressorViews: remain, completion: completion)
                }
            }
        } else {
            completion()
        }
    }
    
}
