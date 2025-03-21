//
//  AudioPlayer.swift
//  BrainBlast_Submission
//
//  Created by Rachit Prajapati on 3/20/25.
//

import AVFoundation

class AudioPlayer {
    static let shared = AudioPlayer()
    var player: AVAudioPlayer?

    func playClip(named fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Audio file \(fileName).mp3 not found!")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = 0
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}
