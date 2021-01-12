//
//  PlayerViewController.swift
//  MyMusic
//
//  Created by Afraz Siddiqui on 4/3/20.
//  Copyright © 2020 ASN GROUP LLC. All rights reserved.
//

import AVFoundation
import UIKit
var isMix = false

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []

    @IBOutlet var holder: UIView!

    var player: AVAudioPlayer?

    // User Interface elements

//    private let albumImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 8.0
//        return imageView
//    }()

    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()

    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()

    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()
    
    let songTitle : UILabel = {
         let label = UILabel()
         label.text = "unknown"
         label.font = UIFont.systemFont(ofSize : 18)
         label.textColor = UIColor.black
         return label
     }()
    
    
    let artistImage : UIImageView = {
       let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let playBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "play"), for: .normal)
        btn.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        return btn
    }()
    
    
    let artistName : UILabel = {
           let label = UILabel()
           label.text = "unknown"
           label.font = UIFont.systemFont(ofSize : 12)
           label.textColor = UIColor.lightGray
           return label
       }()
    
    let backBtn : UIButton = {
          let btn = UIButton(type: .system)
          btn.setImage(UIImage(named: "back"), for: .normal)
          btn.addTarget(self, action: #selector(_back), for: .touchUpInside)

          return btn
      }()
      let nextBtn : UIButton = {
          let btn = UIButton(type: .system)
          btn.setImage(UIImage(named: "next"), for: .normal)
          btn.addTarget(self, action: #selector(_next), for: .touchUpInside)

          return btn
      }()
      
    let time : UILabel = {
          let label = UILabel()
           label.text = "-:--"
           label.font = UIFont.systemFont(ofSize : 12)
           label.textColor = .black
           return label
       }()
       let totalTime : UILabel = {
            let label = UILabel()
             label.text = "-:--"
             label.font = UIFont.systemFont(ofSize : 12)
        label.textColor = .black
             return label
         }()

    let slider : UISlider = {
           
           let slider = UISlider()
           slider.maximumValue = 1000
           slider.minimumValue = 0
           slider.tintColor = UIColor.black
           slider.addTarget(self, action: #selector(_slider), for: .touchDragInside)
           return slider
       }()
    
    let playPauseButton = UIButton()
    
    @objc func _slider () {
        if player!.isPlaying {
            player?.stop()
            player?.currentTime =  TimeInterval(slider.value)
            player?.play()
        }else{
            player?.currentTime = TimeInterval(slider.value)
        }
    }
    
    let mix : UIButton = {
           let btn = UIButton()
           btn.setImage(UIImage(named: "mix"), for: .normal)
           btn.addTarget(self, action: #selector(_mix), for: .touchUpInside)

           return btn
       }()
    
    @objc func _mix ()
      {
       if isMix{
           isMix = false
           mix.setImage(UIImage(named: "mix"), for: .normal)
       }
       else{
           isMix = true
           mix.setImage(UIImage(named: "mix-selected"), for: .normal)
       }
    
       }
    
    @objc func _back ()
       {
//           if isMix {
//               if rondomInt < songList.count - 1 {
//                   rondomInt -= 1
//                   if rondomInt < 0  {
//                       rondomInt = 0
//                       return
//                   }
//                   activeSong = rondomInt
//                   playThisSong(activeSong: songList[rondomInt])
//                   time.text = ""
//                   totalTime.text = ""
//                   updateTime()
//                   getArtistInfo()
//                   audioPlayer.play()
//                   playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//               else{
//                   rondomInt = 0
//                   activeSong = 0
//                   playThisSong(activeSong: songList[activeSong])
//                   time.text = ""
//                   totalTime.text = ""
//                    updateTime()
//                    getArtistInfo()
//                     audioPlayer.play()
//                   playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//           }else{
//
//               if activeSong < songList.count - 1 {
//                   activeSong -= 1
//                   if activeSong < 0 {
//                       activeSong = 0
//                       return
//                   }
//                   playThisSong(activeSong: songList[activeSong])
//                   time.text = ""
//                    totalTime.text = ""
//                  updateTime()
//                  getArtistInfo()
//                  audioPlayer.play()
//                   playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//               else {
//                   activeSong = 0
//                   playThisSong(activeSong: songList[activeSong])
//                   time.text = ""
//                   totalTime.text = ""
//                    updateTime()
//                   getArtistInfo()
//                  audioPlayer.play()
//                 playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//
//          }
//
       }
       @objc func _next ()
       {
//           if isMix {
//               if rondomInt < songList.count - 1 {
//                   rondomInt += 1
//                   activeSong = rondomInt
//                      playThisSong(activeSong: songList[activeSong])
//                               time.text = ""
//                               totalTime.text = ""
//                                updateTime()
//                               getArtistInfo()
//                              audioPlayer.play()
//                             playBtn.setImage(UIImage(named: "pause"), for: .normal)
//
//               }else{
//                   rondomInt = 0
//                   activeSong = 0
//                   playThisSong(activeSong: songList[activeSong])
//                                   time.text = ""
//                                   totalTime.text = ""
//                                    updateTime()
//                                   getArtistInfo()
//                                  audioPlayer.play()
//                                 playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//
//           }else{
//               if activeSong < songList.count - 1 {
//                   activeSong += 1
        
//                   if activeSong > songList.count {
//                       activeSong = 0
//                       return
//                   }
//                   playThisSong(activeSong: songList[activeSong])
//                    time.text = ""
//                   totalTime.text = ""
//                    updateTime()
//                    getArtistInfo()
//                   getCoverImage()
//                     audioPlayer.play()
//                 playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }else{
//                   activeSong = 0
//                   playThisSong(activeSong: songList[activeSong])
//                                                             time.text = ""
//                                                             totalTime.text = ""
//                                                              updateTime()
//                                                             getArtistInfo()
//                                                            audioPlayer.play()
//                                                           playBtn.setImage(UIImage(named: "pause"), for: .normal)
//               }
//           }
           
        }
    
    @objc func update (_timer : Timer ) {
        slider.value = Float(player!.currentTime)
           time.text =  stringFormatterTimeInterval(interval: TimeInterval(slider.value)) as String
       }
    
    func updateTime() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        slider.maximumValue = Float(player!.duration)
        totalTime.text = stringFormatterTimeInterval(interval: player!.duration) as String
    }
    func stringFormatterTimeInterval(interval : TimeInterval) ->NSString {
        let ti = NSInteger(interval)
        let second = ti % 60
        let minutes = ( ti / 60) % 60
        return NSString(format: "%0.2d:%0.2d", minutes,second)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        let playerIconsStack = UIStackView(arrangedSubviews: [backBtn,nextBtn,mix,playBtn])
                 playerIconsStack.distribution = .fillEqually
                 playerIconsStack.axis = .horizontal
                 playerIconsStack.spacing = 10
                 
                 view.addSubview(playerIconsStack)
                 
                 playerIconsStack.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, rigth: view.rightAnchor, marginTop: 0, marginLeft: 20, marginBottom: 80, marginRigth: 20, width: 0, heigth: 0)
                 
                 view.addSubview(slider)
                 
                 slider.anchor(top: nil, left: view.leftAnchor, bottom: playerIconsStack.topAnchor, rigth: view.rightAnchor, marginTop: 0, marginLeft: 30, marginBottom: 12, marginRigth: 30, width: 0, heigth: 0)
                 
                 view.addSubview(time)
                 time.anchor(top: nil, left: view.leftAnchor, bottom: slider.topAnchor, rigth: nil, marginTop: 0, marginLeft: 30, marginBottom: 8, marginRigth: 0, width: 0, heigth: 0)
                 
                 view.addSubview(totalTime)
                 totalTime.anchor(top: nil, left: nil, bottom: slider.topAnchor, rigth: view.rightAnchor, marginTop: 0, marginLeft: 0, marginBottom: 8, marginRigth: 30, width: 0, heigth: 0)
                 
                 
                 let songInfoStack = UIStackView(arrangedSubviews: [songTitle,artistName])
                 songInfoStack.axis = .vertical
                 songInfoStack.alignment = .center
                 songInfoStack.distribution = .equalCentering
                 songInfoStack.spacing = 8
         
            
                    
                 
                 
                 view.addSubview(songInfoStack)
                 songInfoStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 songInfoStack.anchor(top: nil, left: nil, bottom: totalTime.topAnchor, rigth: nil, marginTop: 0, marginLeft: 0, marginBottom: 12, marginRigth: 0, width: 0, heigth: 0)

                 view.addSubview(artistImage)
                 
                 artistImage.anchor(top: nil, left: view.leftAnchor, bottom: songInfoStack.topAnchor, rigth: view.rightAnchor, marginTop: 20, marginLeft: 20, marginBottom: 20, marginRigth: 20, width: self.view.frame.width, heigth: self.view.frame.height / 2)
        
                
        let song = songs[position]

                let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")

                do {
                    try AVAudioSession.sharedInstance().setMode(.default)
                    try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                    guard let urlString = urlString else {
                        print("urlstring is nil")
                        return
                    }

                    player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

                    guard let player = player else {
                        print("player is nil")
                        return
                    }
                    player.volume = 0.5

                    player.play()
                }
                catch {
                    print("error occurred")
                }

    
                artistImage.image = UIImage(named: song.imageName)
                
                holder.addSubview(artistImage)

                // Labels: Song name, album, artist
                songNameLabel.frame = CGRect(x: 10,
                                             y: artistImage.frame.size.height + 10,
                                             width: holder.frame.size.width-20,
                                             height: 70)
    
                songNameLabel.text = song.name
        
                songTitle.text = song.albumName
        
                artistName.text = song.artistName
     
                holder.addSubview(songNameLabel)
                holder.addSubview(albumNameLabel)
                holder.addSubview(artistNameLabel)

                // Player controls
                let nextButton = UIButton()
                let backButton = UIButton()

                // Frame
                let yPosition = artistNameLabel.frame.origin.y + 70 + 20
                let size: CGFloat = 70

                nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
                backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)

                // Styling
            playBtn.setImage(UIImage(named: "pause"), for: .normal)
      
        
        
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if holder.subviews.count == 0 {
//            configure()
//
//        }
//
   

    func configure() {
        // set up player
        let song = songs[position]

        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5

            player.play()
        }
        catch {
            print("error occurred")
        }

        // set up user interface elements

        // album cover
//        artistImage.frame = CGRect(x: 10,
//                                      y: 80,
//                                      width: holder.frame.size.width-20,
//                                      height: holder.frame.size.width-20)
//        artistImage.image = UIImage(named: song.imageName)
        
        
        holder.addSubview(artistImage)

        // Labels: Song name, album, artist
        songNameLabel.frame = CGRect(x: 10,
                                     y: artistImage.frame.size.height + 10,
                                     width: holder.frame.size.width-20,
                                     height: 70)
//        albumNameLabel.frame = CGRect(x: 10,
//                                     y: albumImageView.frame.size.height + 10 + 70,
//                                     width: holder.frame.size.width-20,
//                                     height: 70)
//        artistNameLabel.frame = CGRect(x: 10,
//                                       y: albumImageView.frame.size.height + 10 + 140,
//                                       width: holder.frame.size.width-20,
//                                       height: 70)

        songNameLabel.text = song.name
//        albumNameLabel.text = song.albumName
//        artistNameLabel.text = song.artistName

        holder.addSubview(songNameLabel)
        holder.addSubview(albumNameLabel)
        holder.addSubview(artistNameLabel)

        // Player controls
        let nextButton = UIButton()
        let backButton = UIButton()

        // Frame
        let yPosition = artistNameLabel.frame.origin.y + 70 + 20
        let size: CGFloat = 70

//        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
//                                       y: yPosition,
//                                       width: size,
//                                       height: size)

//        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20,
//                                  y: yPosition,
//                                  width: size,
//                                  height: size)
//
//        backButton.frame = CGRect(x: 20,
//                                  y: yPosition,
//                                  width: size,
//                                  height: size)

        // Add actions
   //     playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)

        // Styling
    playBtn.setImage(UIImage(named: "pause"), for: .normal)
//        playPauseButton.setBackgroundImage(UIImage(systemName: "pause"), for: .normal)
//        backButton.setBackgroundImage(UIImage(systemName: "back"), for: .normal)
//        nextButton.setBackgroundImage(UIImage(systemName: "next"), for: .normal)
//
//        playPauseButton.tintColor = .black
//        backButton.tintColor = .black
//        nextButton.tintColor = .black

//        holder.addSubview(playPauseButton)
//        holder.addSubview(nextButton)
//        holder.addSubview(backButton)

        // slider
//        let slider = UISlider(frame: CGRect(x: 20,
//                                            y: holder.frame.size.height-60,
//                                            width: holder.frame.size.width-40,
//                                            height: 50))
//        slider.value = 0.5
//        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
//        holder.addSubview(slider)
    }

    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }

    @objc func didTapNextButton() {
        if position < (songs.count - 1) {
            position = position + 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }

    @objc func didTapPlayPauseButton() {
//        if player?.isPlaying == true {
//            // pause
//            player?.pause()
//            // show play button
//            playPauseButton.setBackgroundImage(UIImage(systemName: "play"), for: .normal)
//
//            // shrink image
//            UIView.animate(withDuration: 0.2, animations: {
//                self.albumImageView.frame = CGRect(x: 30,
//                                                   y: 30,
//                                                   width: self.holder.frame.size.width-60,
//                                                   height: self.holder.frame.size.width-60)
//            })
//        }
//        else {
//            // play
//            player?.play()
//            playPauseButton.setBackgroundImage(UIImage(systemName: "pause"), for: .normal)
//
//            // increase image size
//            UIView.animate(withDuration: 0.2, animations: {
//                self.albumImageView.frame = CGRect(x: 10,
//                                              y: 10,
//                                              width: self.holder.frame.size.width-20,
//                                              height: self.holder.frame.size.width-20)
//            })
//        }
        if player!.isPlaying {
            player?.pause()
            playBtn.setImage(UIImage(named: "play"), for: .normal)
            updateTime()
        }else{
            player?.play()
//            getArtistInfo ()
            playBtn.setImage(UIImage(named: "pause"), for: .normal)
            updateTime()

        }
    }

    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
//    override func viewWillAppear(_ animated: Bool) {
//        if player!.isPlaying {
//              // getArtistInfo()
//               updateTime()
//               playBtn.setImage(UIImage(named: "pause"), for: .normal)
//           }
//       }

}
extension UIView{
    func anchor(top : NSLayoutYAxisAnchor?
                ,left : NSLayoutXAxisAnchor?,
                 bottom : NSLayoutYAxisAnchor? ,
                 rigth: NSLayoutXAxisAnchor?,
                 marginTop : CGFloat ,
                 marginLeft : CGFloat ,
                marginBottom: CGFloat
                ,marginRigth : CGFloat ,
                 width : CGFloat ,
                 heigth : CGFloat
    
    )  {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: marginTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: marginLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -marginBottom).isActive = true
        }
        if let rigth = rigth {
            self.rightAnchor.constraint(equalTo: rigth, constant: -marginRigth).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if heigth != 0{
            heightAnchor.constraint(equalToConstant: heigth).isActive = true
        }
    }
    
    

}


