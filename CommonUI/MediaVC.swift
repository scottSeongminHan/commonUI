//
//  ViewController.swift
//  MediaVC
//
//  Created by sungals07 on 2021/09/28.
//

import UIKit
import MediaPlayer

private struct Observation {
    static let VolumeKey = "outputVolume"
    static let Rate = "rate"
    static var Context = 0
}


class MediaVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            AVAudioSession.sharedInstance().addObserver(self,
                                                        forKeyPath: Observation.VolumeKey,
                                                        options: [.initial, .new, .old],
                                                        context: &Observation.Context)
        } catch let err {
            print("err: \(err)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    // MARK: - KVO
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        /// When the media is paused, seek time still keeps on incrementing
        /// When the media is in buffering state. As discussed above i.e. rate is 1 and timeControlStatus is waitingToPlayAtSpecifiedRate, seek time still keeps on incrementing.
        /// To resolve these...
        
        print("observeValue: \(keyPath)")
        
        if context == &Observation.Context {
            if keyPath == Observation.VolumeKey,
               let oldVolume = (change?[.oldKey] as? NSNumber)?.floatValue,
               let newVolume = (change?[.newKey] as? NSNumber)?.floatValue {
                print("oldVolume: \(oldVolume)")
                print("newVolume: \(newVolume)")
                
//                let volumeMin: Float = 0.0625 // also interval
//                let volumeMax: Float = 0.9375
                
                var volume: Float = AVAudioSession.sharedInstance().outputVolume
//                if newVolume > oldVolume {
//                    volume += newVolume - oldVolume
//                } else {
//                    volume += oldVolume - newVolume
//                }
//                if oldVolume == volumeMin {
//                    volume = volumeMin
//                }
//                if oldVolume == volumeMax {
//                    volume = volumeMax
//                }
                
                print("volume: \(volume)")
                
                if let slider = (MPVolumeView().subviews.filter{ NSStringFromClass($0.classForCoder) == "MPVolumeSlider" }.first as? UISlider) {
                    //                    let avoidLimitsValue = max(min(AVAudioSession.sharedInstance().outputVolume, Float(1.0)), Float(0.0))
                    // should give a delay
                    // ref) https://stackoverflow.com/questions/50737943/how-to-change-volume-programmatically-on-ios-11-4
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        slider.setValue(volume, animated: false)
                    }
                }
            }
//            else if keyPath == Observation.Rate {
//                let status: AVPlayerItem.Status
//                if let statusNumber = change?[.newKey] as? NSNumber {
//                    status = AVPlayerItem.Status(rawValue: statusNumber.intValue)!
//                } else {
//                    status = .unknown
//                }
//
//                // Switch over status value
//                switch status {
//                case .readyToPlay:
//                    // Player item is ready to play.
//                    NotificationCenter.default.post(name:.AssistantMediaPlay, object: nil, userInfo: nil)
//                case .failed:
//                    // Player item failed. See error.
//                    NotificationCenter.default.post(name:.AssistantMediaStop, object: nil, userInfo: nil)
//                case .unknown:
//                    // Player item is not yet ready.
//                    NotificationCenter.default.post(name:.AssistantMediaStop, object: nil, userInfo: nil)
//                }
//            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
}

