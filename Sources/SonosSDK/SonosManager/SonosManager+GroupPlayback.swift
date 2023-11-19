//
//  File.swift
//  
//
//  Created by James Hickman on 3/11/21.
//

import Foundation

extension SonosManager {

    public func getGroupPlaybackStatus(groupId: String, success: @escaping (PlaybackStatus) -> Void, failure: @escaping (Error?) -> Void) {
        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }

        groupPlaybackService.getGroupPlaybackStatus(authenticationToken: authenticationToken, groupId: groupId, success: { playbackStatus in
            success(playbackStatus)
        }, failure: failure)
    }
    
    public func setGroupPlaybackPlay(groupId: String, success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }
        
        groupPlaybackService.setGroupPlaybackPlay(authenticationToken: authenticationToken, groupId: groupId, success: { data in
            success(data)
        }, failure: failure)
    }
    
    public func setGroupPlaybackPause(groupId: String, success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }
        
        groupPlaybackService.setGroupPlaybackPause(authenticationToken: authenticationToken, groupId: groupId, success: { data in
            success(data)
        }, failure: failure)
    }
    
    public func setGroupSkipToNext(groupId: String, success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }
        
        groupPlaybackService.setGroupSkipToNext(authenticationToken: authenticationToken, groupId: groupId, success: { data in
            success(data)
        }, failure: failure)
    }
    
    public func setGroupSkipToSeek(groupId: String, positionMillis: UInt, success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }
        
        groupPlaybackService.setGroupSkipToSeek(authenticationToken: authenticationToken, groupId: groupId, positionMillis: positionMillis, success: { data in
            success(data)
        }, failure: failure)
    }
    
    public func setGroupSkipToPrevious(groupId: String, success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }
        
        groupPlaybackService.setGroupSkipToPrevious(authenticationToken: authenticationToken, groupId: groupId, success: { data in
            success(data)
        }, failure: failure)
    }
    
    public func setGroupPlaybackModes(groupId: String, playModes: [String], success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }
        
        groupPlaybackService.setGroupPlaybackModes(authenticationToken: authenticationToken, groupId: groupId, playModes: playModes, success: { data in
            success(data)
        }, failure: failure)
    }
}
