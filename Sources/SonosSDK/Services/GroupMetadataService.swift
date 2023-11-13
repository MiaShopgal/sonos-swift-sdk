//
//  File.swift
//  
//
//  Created by von Selasinsky, Deno on 13.11.23.
//

import Foundation
import SwiftyJSON
import SonosNetworking

struct GroupMetadataService {
    func getGroupPlaybackMetadata(authenticationToken: AuthenticationToken, groupId: String, success: @escaping (PlaybackMetadata) -> (), failure: @escaping (Error?) -> ()) {
        PlaybackGetMetadataNetwork(accessToken: authenticationToken.access_token, groupId: groupId) { data in
            guard let data = data,
                  let playbackMetadata = PlaybackMetadata(data) else {
                let error = NSError.errorWithMessage(message: "Could not create PlaybackStatus object.")
                failure(error)
                return
            }
            success(playbackMetadata)
        } failure: { error in
            failure(error)
        }.performRequest()
    }
}
