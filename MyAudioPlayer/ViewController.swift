//
//  ViewController.swift
//  MyMusic
//
//  Created by Afraz Siddiqui on 4/3/20.
//  Copyright © 2020 ASN GROUP LLC. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBAction func favBtn(_ sender: UIButton) {
        
        
    showToast(message: "Audio added to your favorites")
        
    }
    
    @IBAction func backToVid(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    @IBOutlet var table: UITableView!

    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    func configureSongs() {
       songs.append(Song(name: "Song Track 1",
                          albumName: "123 Other",
                          artistName: "Rnado",
                          imageName: "cover7",
                         trackName: "song1"
       ))
        songs.append(Song(name: "Havana",
                          albumName: "Havana album",
                          artistName: "Camilla Cabello",
                          imageName: "cover9",
                          trackName: "song3"
        ))
        songs.append(Song(name: "Viva La Vida",
                          albumName: "123 Something",
                          artistName: "Coldplay",
                          imageName: "cover5",
                          trackName: "song1"
        ))
        songs.append(Song(name: "Background music",
                          albumName: "123 Other",
                          artistName: "Rnado",
                          imageName: "cover4",
                          trackName: "song1"
        ))
     
    }
    @objc func cellsharebtntapped(sender:UIButton){
           
         let activityVC = UIActivityViewController(activityItems: ["https://www.google.com"], applicationActivities: nil)
           self.present(activityVC, animated: true, completion: nil)
          activityVC.isModalInPresentation = true
           print("button tapped")
                  }


    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MuCell", for: indexPath) as! MusicCell
        let song = songs[indexPath.row]
        // configure
        cell.MuText.text = song.name
     //   cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.ImgView.image = UIImage(named: song.imageName)
        cell.ShareBtnClicked.tag = indexPath.row
        cell.ShareBtnClicked.addTarget(self, action: #selector(cellsharebtntapped(sender:)), for: .touchUpInside)
     //   cell.MuText?.font = UIFont(name: "Helvetica-Bold", size: 18)
        //cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }


}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
extension UIViewController {
    func showToast(message: String) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 18)
        toastLbl.textColor = UIColor.white
        toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLbl.numberOfLines = 0
        
        
        let textSize = toastLbl.intrinsicContentSize
        let labelHeight = ( textSize.width / window.frame.width ) * 30
        let labelWidth = min(textSize.width, window.frame.width - 40)
        let adjustedHeight = max(labelHeight, textSize.height + 20)
        
        toastLbl.frame = CGRect(x: 20, y: (window.frame.height - 90 ) - adjustedHeight, width: labelWidth + 20, height: adjustedHeight)
        toastLbl.center.x = window.center.x
        toastLbl.layer.cornerRadius = 10
        toastLbl.layer.masksToBounds = true
        
        window.addSubview(toastLbl)
        
        UIView.animate(withDuration: 8.0, animations: {
            toastLbl.alpha = 0
        }) { (_) in
            toastLbl.removeFromSuperview()
        }
        
    
        
    }
}

