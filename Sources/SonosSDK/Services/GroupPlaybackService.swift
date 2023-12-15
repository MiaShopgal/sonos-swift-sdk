//
//  File.swift
//
//
//  Created by James Hickman on 2/17/21.
//

import Foundation
import SonosNetworking
import SwiftyJSON

struct GroupPlaybackService {

    func getGroupPlaybackStatus(authenticationToken: AuthenticationToken, groupId: String, success: @escaping (PlaybackStatus) -> (), failure: @escaping (Error?) -> ()) {
        PlaybackGetStatusNetwork(accessToken: authenticationToken.access_token, groupId: groupId) { data in
            guard let data = data,
                  let playbackStatus = PlaybackStatus(data) else {
                let error = NSError.errorWithMessage(message: "Could not create PlaybackStatus object.")
                failure(error)
                return
            }
            success(playbackStatus)
        } failure: { error in
            failure(error)
        }.performRequest()
    }

    func setPlay(authenticationToken: AuthenticationToken,
                 groupId: String,
                 success: @escaping () -> (),
                 failure: @escaping (Error?) -> ()) {

        PlaybackPlayNetwork(accessToken: authenticationToken.access_token,
                            groupId: groupId) { data in

            success()

        } failure: { error in

            failure(error)

        }.performRequest()
    }

    func setSeek(authenticationToken: AuthenticationToken,
                 groupId: String,
                 position: UInt,
                 success: @escaping () -> (),
                 failure: @escaping (Error?) -> ()) {

        PlaybackSeekNetwork(accessToken: authenticationToken.access_token,
                            groupId: groupId,
                            positionMillis: position) { data in

            success()

        } failure: { error in

            failure(error)

        }.performRequest()
    }

    func setPause(authenticationToken: AuthenticationToken,
                  groupId: String,
                  success: @escaping () -> (),
                  failure: @escaping (Error?) -> ()) {

        PlaybackPauseNetwork(accessToken: authenticationToken.access_token,
                             groupId: groupId) { data in

            success()

        } failure: { error in

            failure(error)

        }.performRequest()
    }

    func setSkipToNext(authenticationToken: AuthenticationToken,
                       groupId: String,
                       success: @escaping () -> (),
                       failure: @escaping (Error?) -> ()) {

        PlaybackSkipToNextTrackNetwork(accessToken: authenticationToken.access_token,
                                       groupId: groupId) { data in

            success()

        } failure: { error in

            failure(error)

        }.performRequest()
    }

    func setSkipToPrevious(authenticationToken: AuthenticationToken,
                           groupId: String,
                           success: @escaping () -> (),
                           failure: @escaping (Error?) -> ()) {

        PlaybackSkipToPreviousTrackNetwork(accessToken: authenticationToken.access_token,
                                           groupId: groupId) { data in

            success()

        } failure: { error in

            failure(error)

        }.performRequest()
    }

    func subscribe(authenticationToken: AuthenticationToken,
                   groupId: String,
                   success: @escaping () -> (),
                   failure: @escaping (Error?) -> ()) {

        PlaybackSubscribeNetwork(accessToken: authenticationToken.access_token,
                                 groupId: groupId) { data in
            success()

        } failure: { error in

            failure(error)

        }.performRequest()
    }

    func unsubscribe(authenticationToken: AuthenticationToken,
                     groupId: String,
                     success: @escaping () -> (),
                     failure: @escaping (Error?) -> ()) {

        PlaybackUnsubscribeNetwork(accessToken: authenticationToken.access_token,
                                   groupId: groupId) { data in
            success()

        } failure: { error in

            failure(error)

        }.performRequest()
    }
}
