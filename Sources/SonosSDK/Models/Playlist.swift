//
//  Playlist.swift
//
//
//  Created by Mia Yu on 2023/12/14.
//

import Foundation
import SwiftyJSON

public struct Playlist: Identifiable {

    public var id: String
    public var name: String
    public var type: String
    public var trackCount: Int

    init?(_ data: Any) {

        let json = JSON(data)
        guard let id = json["id"].string,
              let name = json["name"].string,
              let type = json["type"].string,
              let trackCount = json["trackCount"].int else {
            return nil
        }

        self.id = id
        self.name = name
        self.type = type
        self.trackCount = trackCount

    }

}
