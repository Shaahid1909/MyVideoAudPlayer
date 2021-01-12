//
//  VideoTabCell.swift
//  MyVideoPlayer
//
//  Created by Admin on 29/12/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class VideoTabCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    
    @IBOutlet var shareButton: UIButton!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var video: Video! {
        didSet{
            updateUI()
        }
        
    }
    
    func updateUI() {
        thumbnailImageView.image = UIImage(named: video.thumbnailFileName)
        thumbnailImageView.layer.cornerRadius = 8.0
        thumbnailImageView.layer.masksToBounds = true
        
    }
    

}
