//
//  PlaylistService.swift
//
//
//  Created by Mia Yu on 2023/12/14.
//

import Foundation
import SonosNetworking
import SwiftyJSON

struct GroupPlaylistService {

    func getPlaylist(authenticationToken: AuthenticationToken,
                     householdId: String,
                     success: @escaping ([Playlist]) -> (),
                     failure: @escaping (Error?) -> ()) {

        PlaylistsGetNetwork(accessToken: authenticationToken.access_token,
                            householdId: householdId) { data in

            guard let playlist = data.map({ self.decode($0) }) else {
                
                let error = NSError.errorWithMessage(message: "Could not create Playlists object.")
                failure(error)
                return
                
            }
            
            success(playlist)
            
        } failure: { error in
            
            failure(error)
            
        }.performRequest()
    }

    func loadPlaylist(authenticationToken: AuthenticationToken,
                      groupId: String,
                      playlistId: String,
                      success: @escaping (Error?) -> (),
                      failure: @escaping (Error?) -> ()) {

        PlaylistsLoadPlaylistNetwork(accessToken: authenticationToken.access_token,
                                     groupId: groupId, action: "REPLACE",
                                     playlistId: playlistId,
                                     playOnCompletion: true,
                                     playModes: nil) { data in

            guard let data = data else {
                
                success(nil)
                
                return
                
            }
            
            success(NSError.errorWithData(data: data))
            
        } failure: { error in
            
            failure(error)
            
        }.performRequest()
    }

    func subscribe(authenticationToken: AuthenticationToken,
                   householdId: String,
                   success: @escaping () -> (),
                   failure: @escaping (Error?) -> ()) {

        PlaylistsSubscribeNetwork(accessToken: authenticationToken.access_token,
                                  householdId: householdId) { data in
            
            success()
            
        } failure: { error in
            
            failure(error)
            
        }.performRequest()
    }

    func unsubscribe(authenticationToken: AuthenticationToken,
                     householdId: String,
                     success: @escaping () -> (),
                     failure: @escaping (Error?) -> ()) {

        PlaylistsUnsubscribeNetwork(accessToken: authenticationToken.access_token,
                                    householdId: householdId) { data in
            
            success()
            
        } failure: { error in
            
            failure(error)
            
        }.performRequest()
    }

    fileprivate func decode(_ data: Any) -> [Playlist] {

        let json = JSON(data)
        var playlists = [Playlist]()
        for item in json["playlists"].arrayValue {
            
            if let playlist = Playlist(item) {
                
                playlists.append(playlist)
                
            }
        }
        return playlists
    }

}
