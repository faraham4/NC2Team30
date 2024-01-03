//
//  AudioSound.swift
//  Artector
//
//  Created by Farah Alamri on 16/06/1445 AH.
//

import Foundation
import AVFoundation

class AudioSound{
    var audioPlayer: AVAudioPlayer?
    let englishSound = ["tahani1", "tahani2", "tahani 3"]
    
    func setUpAudio(section: String){
        if (section == "artist"){
            if let audioFileURL = Bundle.main.url(forResource: "tahani1", withExtension: "wav"){
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
                    audioPlayer?.prepareToPlay()
                } catch {
                    print("Error loading audio file: \(error.localizedDescription)")
                }
            }
        }else if(section == "painting"){
            if let audioFileURL = Bundle.main.url(forResource: "tahani2", withExtension: "wav"){
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
                    audioPlayer?.prepareToPlay()
                } catch {
                    print("Error loading audio file: \(error.localizedDescription)")
                }
            }
        }else if(section == "description"){
            if let audioFileURL = Bundle.main.url(forResource: "tahani 3", withExtension: "wav"){
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
                    audioPlayer?.prepareToPlay()
                } catch {
                    print("Error loading audio file: \(error.localizedDescription)")
                }
            }
        }
        
    }//setupAudio
    
      func speakerButtonPressed() {
        guard let player = audioPlayer else { return }
        
        if player.isPlaying {
            player.pause()
            // Update UI for pause state if needed
        } else {
            player.play()
            // Update UI for play state if needed
        }
    } 
    
    
}
