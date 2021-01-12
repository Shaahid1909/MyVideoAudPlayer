//
//  VideosTabViewController.swift
//  MyVideoPlayer
//
//  Created by Admin on 29/12/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideosTabViewController: UITableViewController {
    
    var videos: [Video] =  Video.fetchVideos()
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    let view1 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        tableView.delegate = self
        tableView.dataSource = self
      
    }
    
    @IBAction func DidTapRefresh(_ sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
    
    @objc func cellsharebtntapped(sender:UIButton){
        
      let activityVC = UIActivityViewController(activityItems: ["https://www.google.com"], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
       activityVC.isModalInPresentation = true
        print("button tapped")
               }

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTabCell
        
        let video = videos[indexPath.row]
        cell.video = video
        cell.shareButton.tag = indexPath.row
        cell.shareButton.addTarget(self, action: #selector(cellsharebtntapped(sender:)), for: .touchUpInside)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo(at: indexPath)
        
    }
    
    func playVideo(at IndexPath: IndexPath){
        let selectedvideo = videos[IndexPath.row]
        let videoPath = Bundle.main.path(forResource: selectedvideo.videoFileName, ofType: "mp4")
        let videoPathURL = URL(fileURLWithPath: videoPath!)
        player = AVPlayer(url: videoPathURL)
        playerViewController.player = player
        
        self.present(playerViewController, animated: true, completion: {
            self.playerViewController.player?.play()
        })
    }
 
    
}


