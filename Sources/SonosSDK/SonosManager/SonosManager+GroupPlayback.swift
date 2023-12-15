//
//  File.swift
//
//
//  Created by James Hickman on 3/11/21.
//

import Foundation

extension SonosManager {

    public func getGroupPlaybackStatus(forGroup group: Group,
                                       success: @escaping (PlaybackStatus) -> Void,
                                       failure: @escaping (Error?) -> Void) {
        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }

        groupPlaybackService.getGroupPlaybackStatus(authenticationToken: authenticationToken,
                                                    groupId: group.id,
                                                    success: { playbackStatus in

                                                        success(playbackStatus)

                                                    }, failure: failure)
    }

    public func setGroupPlay(forGroup group: Group,
                             success: @escaping () -> Void,
                             failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }

        groupPlaybackService.setPlay(authenticationToken: authenticationToken,
                                     groupId: group.id) {
            success()

        } failure: { error in

            failure(error)

        }
    }

    public func setGroupSeekTo(position: UInt,
                               forGroup group: Group,
                               success: @escaping () -> Void,
                               failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }

        groupPlaybackService.setSeek(authenticationToken: authenticationToken,
                                     groupId: group.id,
                                     position: position) {
            success()

        } failure: { error in

            failure(error)

        }
    }

    public func setGroupSkipToNext(forGroup group: Group,
                                   success: @escaping () -> Void,
                                   failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }

        groupPlaybackService.setSkipToNext(authenticationToken: authenticationToken,
                                           groupId: group.id) {
            success()

        } failure: { error in

            failure(error)

        }
    }

    public func setGroupSkipToPrevious(forGroup group: Group,
                                       success: @escaping () -> Void,
                                       failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }

        groupPlaybackService.setSkipToPrevious(authenticationToken: authenticationToken,
                                               groupId: group.id) {
            success()

        } failure: { error in

            failure(error)

        }
    }

    public func setGroupPause(forGroup group: Group,
                              success: @escaping () -> Void,
                              failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {
            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return
        }

        groupPlaybackService.setPause(authenticationToken: authenticationToken,
                                      groupId: group.id) {
            success()

        } failure: { error in

            failure(error)

        }
    }

    public func subscribeToGroupPlaybackStatus(forGroup group: Group,
                                               success: @escaping () -> Void,
                                               failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {

            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return

        }

        groupPlaybackService.subscribe(authenticationToken: authenticationToken,
                                       groupId: group.id,
                                       success: success) { error in

            failure(error)

        }
    }

    public func unsubscribeToGroupPlaybackStatus(forGroup group: Group,
                                                 success: @escaping () -> Void,
                                                 failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {

            let error = NSError.errorWithMessage(message: "Could not load authentication token.")
            failure(error)
            return

        }

        groupPlaybackService.unsubscribe(authenticationToken: authenticationToken,
                                         groupId: group.id,
                                         success: success) { error in

            failure(error)

        }
    }
}
