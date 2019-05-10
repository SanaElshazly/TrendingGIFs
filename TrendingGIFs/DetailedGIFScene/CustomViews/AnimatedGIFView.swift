//
//  AnimatedGIFView.swift
//  TrendingGIFs
//
//  Created by Sana Elshazly on 5/9/19.
//  Copyright © 2019 Sana Elshazly. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Reusable

class AnimatedGIFView: UIView, NibOwnerLoadable {
    
//    var playerLayer: AVPlayerLayer?
//    var player: AVPlayer?
//    var isLoop: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNibContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadNibContent()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadNibContent()
    }
    
    
    func configure(url: String, playerView: UIView) {
        self.addSubview(playerView)
        playerView.frame = self.bounds
    }

//    func play() {
//        if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
//            player?.play()
//        }
//    }
//    
//    func pause() {
//        player?.pause()
//    }
//    
//    func stop() {
//        player?.pause()
//        player?.seek(to: CMTime.zero)
//    }
//    
//    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
//        if isLoop {
//            player?.pause()
//            player?.seek(to: CMTime.zero)
//            player?.play()
//        }
//    }
    
//    func configure(with gif: GIFViewModel) {
//        self.titleLabel.text = gif.title
//        gifImageView.sd_setImage(with: URL(string: gif.images?.preview_gif.url ?? "placeholder.png"))
//    }
}
