//
//  TrackTableViewCell.swift
//  AlbumArt2
//
//  Created by Kyle Brooks Robinson on 5/29/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

protocol TrackTableViewCellDelegate {
    
    func playSongWithURL(url: String)
    
    
    
}

class TrackTableViewCell: UITableViewCell {
    
    var delegate: TrackTableViewCellDelegate?
    
    var buttonToggle: Int = 3
    
    var trackInfo: [String:AnyObject]! {
        
        didSet {
            
            trackNameLabel.text = trackInfo["trackName"] as? String
            
        }
        
    }

    @IBOutlet weak var trackNameLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func toggleSong(sender: UIButton) {
        
        buttonToggle += 1
        
        if buttonToggle % 2 == 0 {
            
        
        if let url = trackInfo["previewUrl"] as? String {
            
            delegate?.playSongWithURL(url)
    
        }
        
        playButton.backgroundColor = UIColor.redColor()
    
        } else if buttonToggle % 2 != 0 {
            
            
            player?.stop
            playButton.backgroundColor = UIColor.blueColor()
            
        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
