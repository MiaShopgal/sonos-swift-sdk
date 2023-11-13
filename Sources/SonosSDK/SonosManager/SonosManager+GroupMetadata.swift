//
//  File.swift
//  
//
//  Created by von Selasinsky, Deno on 13.11.23.
//

import Foundation

extension SonosManager {

    public func getGroupMetadataStatus(groupId: String, success: @escaping (PlaybackMetadata) -> Void, failure: @escaping (Error?) -> Void) {
        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }

        groupMetadataService.getGroupPlaybackMetadata(authenticationToken: authenticationToken, groupId: groupId, success: { playbackMetadata in
            success(playbackMetadata)
        }, failure: failure)
        
    }
    
}
