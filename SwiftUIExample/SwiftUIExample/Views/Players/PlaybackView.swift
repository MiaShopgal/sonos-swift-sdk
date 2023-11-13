//
//  PlaybackView.swift
//  SwiftUIExample
//
//
//  Created by von Selasinsky, Deno on 13.11.23.
//

import SwiftUI
import SonosSDK

struct PlaybackView: View {
    
    @State private var playbackMetadata: PlaybackMetadata?
    
    var groupId: String
    var player: Player
    var sonosManager: SonosManager = ConfigurationProvider.shared.resolve(SonosManager.self)
    
    @State var isErrorAlertPresented = false
    @State var error: Error?
    
    @State var isLoading = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                
                Text(playbackMetadata?.currentItem.track?.name ?? "no track")
                Text(playbackMetadata?.currentItem.track?.artist?.name ?? "no artist")
                Text(playbackMetadata?.currentItem.track?.album?.name ?? "no album")
            }
            .padding()
            Spacer()
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "backward.end.fill")
                    .font(.system(size: 25))
                Button(action: {
                    sonosManager.setGroupPlaybackPlay(groupId: groupId) { data in
                        print(data)
                        
                    } failure: { error in
                        presentErrorIfNeeded(error)
                        
                    }
                }, label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 25))
                })
                
                Image(systemName: "forward.end.fill")
                    .font(.system(size: 25))
            }
            HStack {
                Image(systemName: "shuffle")
                    .font(.system(size: 25))
                Image(systemName: "repeat")
                    .font(.system(size: 25))
            }
            Spacer()
        }
        .onAppear{
            isLoading.toggle()
            getPlayerMetadata {
                isLoading.toggle()
            }
        }
    }
    
    func getPlayerMetadata(usingCache: Bool = true, completion: @escaping (() -> Void)) {
        sonosManager.getGroupMetadataStatus(groupId: groupId) { playbackMetadata in
            self.playbackMetadata = playbackMetadata
            completion()
        } failure: { error in
            presentErrorIfNeeded(error)
            completion()
        }
    }
    
    func presentErrorIfNeeded(_ error: Error?) {
        guard let error = error else { return }
        self.error = error
        isErrorAlertPresented.toggle()
    }

}

