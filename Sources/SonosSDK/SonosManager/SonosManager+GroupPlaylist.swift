//
//  SonosManager+GroupPlaylist.swift
//
//
//  Created by Mia Yu on 2023/12/14.
//

import Foundation

extension SonosManager {

    public func getPlaylist(householdId: String,
                            success: @escaping ([Playlist]) -> Void,
                            failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
            
        }

        groupPlaylistService.getPlaylist(authenticationToken: authenticationToken,
                                         householdId: householdId,
                                         success: success, failure: failure)

    }

    public func loadPlaylist(groupId: String,
                             playlistId: String,
                             success: @escaping (Error?) -> Void,
                             failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {
            
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
            
        }

        groupPlaylistService.loadPlaylist(authenticationToken: authenticationToken,
                                          groupId: groupId,
                                          playlistId: playlistId,
                                          success: success,
                                          failure: failure)
    }

    public func subscribeToPlaylist(forHouseholdId householdId: String, 
                                    success: @escaping () -> Void,
                                    failure: @escaping (Error?) -> Void) {
        
        guard let authenticationToken = authenticationToken else {
            
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
            
        }

        groupPlaylistService.subscribe(authenticationToken: authenticationToken, 
                                       householdId: householdId,
                                       success: success,
                                       failure: failure)
    }

    public func unsubscribeToPlaylist(forHouseholdId householdId: String, 
                                      success: @escaping () -> Void,
                                      failure: @escaping (Error?) -> Void) {
        
        guard let authenticationToken = authenticationToken else {
            
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
            
        }

        groupPlaylistService.unsubscribe(authenticationToken: authenticationToken, 
                                         householdId: householdId,
                                         success: success,
                                         failure: failure)
    }
}
