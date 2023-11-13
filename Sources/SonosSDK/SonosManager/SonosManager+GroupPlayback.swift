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
}
