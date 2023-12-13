//
//  GroupPlaybackMetadataService.swift
//
//
//  Created by Mia Yu on 2023/12/12.
//

import Foundation
import SonosNetworking

struct GroupPlaybackMetadataService {

    func getGroupPlaybackMetadata(authenticationToken: AuthenticationToken,
                                  groupId: String,
                                  success: @escaping ((MetadataStatus) -> ()),
                                  failure: @escaping (Error?) -> ()) {

        PlaybackGetMetadataNetwork(accessToken: authenticationToken.access_token,
                                   groupId: groupId) { data in

            guard let data = data,
                  let metadataStatus = MetadataStatus(data) else {

                let error = NSError.errorWithMessage(message: "Could not create MetadataStatus object.")
                failure(error)
                return

            }

            success(metadataStatus)

        } failure: { error in

            failure(error)

        }.performRequest()
    }

    func subscribe(authenticationToken: AuthenticationToken,
                   groupId: String,
                   success: @escaping () -> Void,
                   failure: @escaping (Error?) -> Void) {

        PlaybackSubscribeNetwork(accessToken: authenticationToken.access_token,
                                 groupId: groupId) { data in
            success()

        } failure: { error in

            failure(error)

        }.performRequest()
    }

    func unsubscribe(authenticationToken: AuthenticationToken,
                     groupId: String,
                     success: @escaping () -> Void,
                     failure: @escaping (Error?) -> Void) {

        PlaybackUnsubscribeNetwork(accessToken: authenticationToken.access_token,
                                   groupId: groupId) { data in
            success()

        } failure: { error in

            failure(error)

        }.performRequest()
    }

}
