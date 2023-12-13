//
//  SonosManager+GroupPlaybackMetadataService.swift
//
//
//  Created by Mia Yu on 2023/12/12.
//

import Foundation

extension SonosManager {

    public func getGroupPlaybackMetadataService(groupId: String,
                                                success: @escaping (MetadataStatus) -> Void,
                                                failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {

            let error = NSError.errorWithMessage(message: "Could not load authentication token.")

            failure(error)

            return

        }

        groupPlaybackMetadataService.getGroupPlaybackMetadata(token: authenticationToken.access_token,
                                                              groupId: groupId) { metadataStatus in

            success(metadataStatus)

        } failure: { error in

            failure(error)

        }
    }

    public func subscribeToGroupPlaybackMetadataService(forGroup group: Group,
                                                        success: @escaping () -> Void,
                                                        failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {

            let error = NSError.errorWithMessage(message: "Could not load authentication token.")

            failure(error)

            return

        }

        groupPlaybackMetadataService.subscribe(authenticationToken: authenticationToken,
                                               groupId: group.id,
                                               success: success) { error in
            failure(error)
            
        }
    }

    public func unsubscribeToGroupPlaybackMetadataService(forGroup group: Group,
                                                          success: @escaping () -> Void,
                                                          failure: @escaping (Error?) -> Void) {

        guard let authenticationToken = authenticationToken else {

            let error = NSError.errorWithMessage(message: "Could not load authentication token.")

            failure(error)

            return

        }

        groupPlaybackMetadataService.unsubscribe(authenticationToken: authenticationToken,
                                                 groupId: group.id, 
                                                 success: success) { error in

            failure(error)

        }
    }
}
