//
//  ViewController.swift
//  FilesApp
//
//  Created by Vishwanath Kota on 24/09/2019.
//  Copyright © 2019 Vishwanath Kota. All rights reserved.
//  https://www.reddit.com/r/swift/comments/8n1zyw/how_to_use_file_provider_in_ios_document_picker/

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController, UIDocumentPickerDelegate {
    
    let documentInteractionController = UIDocumentInteractionController()
    var urls1 : [NSURL] = []
    @IBOutlet weak var viewPlay: VideoView!
    @IBOutlet weak var viewPlay2: VideoView!
    @IBOutlet weak var viewPlay3: VideoView!
    var positionIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
//        documentInteractionController.delegate = self // as UIDocumentInteractionControllerDelegate
        
//        let ur = UserDefaults.standard.url(forKey: "1")
//        print(ur!)
////        urls1.append(ur! as NSURL)
//
//        let c = UserDefaults.standard.object(forKey: "12") as? String
//        print(c as Any)
//
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 1
        viewPlay.addGestureRecognizer(tap)
        viewPlay2.addGestureRecognizer(tap)
        
        let taps = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        taps.numberOfTapsRequired = 2
        viewPlay.addGestureRecognizer(taps)
        viewPlay2.addGestureRecognizer(taps)
        
        print(FileManager.default.contents(atPath: "file:///private/var/mobile/Containers/Data/Application/44D17A74-FDD8-494B-990A-4895FC7F7B7C/tmp/Com.VishK.FilesApp-Inbox/VBOX0001_0001.mp4"))
        if FileManager.default.isWritableFile(atPath: "file:///private/var/mobile/Containers/Data/Application/44D17A74-FDD8-494B-990A-4895FC7F7B7C/tmp/Com.VishK.FilesApp-Inbox/VBOX0001_0001.mp4"){
            print("Writable")
        } else {
            print("Readable")
        }
        
        
        let filepath1 = "file:///private/var/mobile/Containers/Data/Application/44D17A74-FDD8-494B-990A-4895FC7F7B7C/tmp/Com.VishK.FilesApp-Inbox/VBOX0001_0001.mp4"
        let file: FileHandle? = FileHandle(forReadingAtPath: filepath1)

        if file == nil {
            print("File open failed")
        } else {
            file?.seek(toFileOffset: 10)
            let databuffer = file?.readData(ofLength: 5)
            file?.closeFile()
        }
        
       
        let str1 = "file:///private/var/mobile/Containers/Data/Application/44D17A74-FDD8-494B-990A-4895FC7F7B7C/tmp/Com.VishK.FilesApp-Inbox/VBOX0001.vbo"
//        "file:///private/var/mobile/Containers/Data/Application/44D17A74-FDD8-494B-990A-4895FC7F7B7C/tmp/Com.VishK.FilesApp-Inbox/VBOX0001_0001.mp4"
        let url = NSURL(string: str1)
        viewPlay.configure(url: url! as URL)
        viewPlay.play()
        
        
        let str2 = "file:///private/var/mobile/Containers/Data/Application/44D17A74-FDD8-494B-990A-4895FC7F7B7C/tmp/Com.VishK.FilesApp-Inbox/VBOX0006_0001.mp4"
        let url2 = URL(string: str2)! as NSURL
        viewPlay2.configure(url: url2 as URL)
        viewPlay2.play()
       
      
        /*
        let u = NSURL(string: str2)
        do {
            let dataContent = try Data(contentsOf: url2 as URL, options: .alwaysMapped)
            print("Reading data from the content: \(dataContent)")
        } catch {
            print(error)
        }
        */
        viewPlay.isHidden = true
        viewPlay2.isHidden = true
        viewPlay3.isHidden = true
    }
    
    @objc func doubleTapped() {
        viewPlay.pause()
        viewPlay2.pause()
    }
    @objc func doubleTap() {
        viewPlay.play()
        viewPlay2.play()
    }
    
    @IBAction func showOptionsTapped(_ sender: UIButton) {
        /// Passing the remote URL of the file, to be stored and then opted with mutliple actions for the user to perform
//        storeAndShare(withURLString: "https://images5.alphacoders.com/581/581655.jpg")
        viewPlay.isHidden = true
        viewPlay2.isHidden = true
        viewPlay3.isHidden = true
        let importMenu = UIDocumentPickerViewController(documentTypes: ["uk.co.racelogic.vbo","public.mpeg-4","public.avi","public.item"], in: .import)
//        ["public.mpeg-4"] [kUTTypeMovie as String] "public.item"
        importMenu.delegate = self
        importMenu.allowsMultipleSelection = true
        urls1 = []
        self.present(importMenu, animated: true, completion: nil)
        
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
//        print("URL: \(String(describing: urls.first))")
        guard let selectedUrl = urls.first else {
            return
        }
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else  {
            return
        }
    
        for i in urls{
            self.urls1.append(i as NSURL)
        }
/*
        if (urls1.count > 3){
            urls1 = urls1.suffix(3)
        }
 */
           print(urls1)
//        let path = String(describing: urls.first)
        
//        URL(string: "file:///private/var/mobile/Containers/Data/Application/E7FFBC6B-E8F4-4C67-8F7B-C0F540950AA7/tmp/Com.VishK.FilesApp-Inbox/VBOX0005_0001.mp4")
        
//        let videoURL = URL(string: selectedUrl)
//        let player = AVPlayer(url: selectedUrl)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.viewPlay.frame
//        self.viewPlay.layer.addSublayer(playerLayer)
//        player.play()
        /* -------------------
        if (urls1.count == 1) {
            viewPlay.configure(url: urls1[0] as URL)
//            viewPlay.configure(url: URL(string: "file:///private/var/mobile/Containers/Data/Application/E7FFBC6B-E8F4-4C67-8F7B-C0F540950AA7/tmp/Com.VishK.FilesApp-Inbox/VBOX0001_0001.mp4")!)
            viewPlay.play()
        } else if (urls1.count == 2){
        
            viewPlay.configure(url: urls1[0] as URL)
//            viewPlay.configure(url: URL(string: "file:///private/var/mobile/Containers/Data/Application/E7FFBC6B-E8F4-4C67-8F7B-C0F540950AA7/tmp/Com.VishK.FilesApp-Inbox/VBOX0001_0001.mp4")!)
            viewPlay.play()
            
            viewPlay2.configure(url: urls1[1] as URL)
            
//            viewPlay2.configure(url: URL(string: "file:///private/var/mobile/Containers/Data/Application/E7FFBC6B-E8F4-4C67-8F7B-C0F540950AA7/tmp/Com.VishK.FilesApp-Inbox/VBOX0005_0001.mp4")!)
            viewPlay2.play()
        } else if (urls1.count == 3) {
            viewPlay.configure(url: urls1[0] as URL)
            viewPlay.play()
            
            viewPlay2.configure(url: urls1[1] as URL)
            viewPlay2.play()
            
            viewPlay3.configure(url: urls1[2] as URL)
            viewPlay3.play()
        }
 ------------------- */
        dismiss(animated: true, completion: nil)
        
        let vc = storyboard?.instantiateViewController(identifier: "AvaliableFilesList") as! AvaliableFilesList
        vc.urlsAry = urls1
//        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
        var urlsFound : [NSURL] = []
        vc.onDoneBlock = { result in
            print("testing the block \(result)")
            for i in self.urls1 {
                let lastPath = i.lastPathComponent
                let extenstion = i.pathExtension
                
                let serachFile = result.components(separatedBy: ".")
                let existingFiles = lastPath?.components(separatedBy: ".")
//                self.viewPlay.configure(url: i as URL)
//                self.viewPlay.play()
                /*
                if (serachFile[0] == existingFiles![0] && existingFiles![1] == "mp4"){
                    self.viewPlay.configure(url: i as URL)
                    self.viewPlay.play()
                }
                 */
                if (existingFiles![0].contains(serachFile[0]) && (existingFiles![1] == "mp4" || existingFiles![1] == "MP4")){
                    urlsFound.append(i)
                }
                
                if urlsFound.count == 1 {
                    self.viewPlay.isHidden = false
                    
                    self.viewPlay.configure(url: urlsFound[0] as URL)
                    self.viewPlay.play()
                } else if urlsFound.count == 2 {
                    self.viewPlay.isHidden = false
                    self.viewPlay2.isHidden = false
                    
                    self.viewPlay.configure(url: urlsFound[0] as URL)
                    self.viewPlay.play()
                    
                    self.viewPlay2.configure(url: urlsFound[1] as URL)
                    self.viewPlay2.play()
                    return
                } else if urlsFound.count == 3 {
                    self.viewPlay.isHidden = false
                    self.viewPlay2.isHidden = false
                    self.viewPlay3.isHidden = false
                    
                    self.viewPlay.configure(url: urlsFound[0] as URL)
                    self.viewPlay.play()
                    
                    self.viewPlay2.configure(url: urlsFound[1] as URL)
                    self.viewPlay2.play()
                    
                    self.viewPlay3.configure(url: urlsFound[2] as URL)
                    self.viewPlay3.play()
                }
            }
            

            
//            self.viewPlay.configure(url: self.urls1[result] as URL)
//            self.viewPlay.play()
        }
        
//        if (urls1.count == 2) {
////        let url2 = NSURL(fileURLWithPath: "file:///private/var/mobile/Containers/Data/Application/C9D7EF74-FE3F-41BD-9D52-6C543335E50D/tmp/Com.VishK.FilesApp-Inbox/VBOX0002_0001.mp4")
//            viewPlay2.configure(url: urls[1])
//            viewPlay2.play()
//        }
//
        
        
        /*
        if let filePath = Bundle.main.path(forResource: "small", ofType: ".mp4") {
            let filePathURL = NSURL.fileURL(withPath: filePath)

            let player = AVPlayer(url: filePathURL)
            let playerController = AVPlayerViewController()
            playerController.player = player
            self.present(playerController, animated: true) {
                player.play()
            }
        }
        */
//        let sanboxFileURL = dir.appendingPathComponent(selectedUrl.lastPathComponent)
//        if FileManager.default.fileExists(atPath: sanboxFileURL.path) {
//            print("Already exists! Do nothing")
//        } else {
//            do {
//                try FileManager.default.copyItem(at: selectedUrl, to: sanboxFileURL)
//                print("Copied File!")
//            } catch {
//                print("Error: \(error)")
//            }
//        }
    }
    
    
    /*
     func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
     guard let selectedUrl = urls.first else {
     return
     }
     guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else  {
     return
     }
     let sanboxFileURL = dir.appendingPathComponent(selectedUrl.lastPathComponent)
     if FileManager.default.fileExists(atPath: sanboxFileURL.path) {
     print("Already exists! Do nothing")
     } else {
     do {
     try FileManager.default.copyItem(at: selectedUrl, to: sanboxFileURL)
     print("Copied File!")
     } catch {
     print("Error: \(error)")
     }
     }
     }
     */
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        
        print("Nothing selected")
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
/*
extension ViewController {
    /// This function will set all the required properties, and then provide a preview for the document
    func share(url: URL) {
        documentInteractionController.url = url
        documentInteractionController.uti = url.typeIdentifier ?? "public.data, public.content"
        documentInteractionController.name = url.localizedName ?? url.lastPathComponent
        documentInteractionController.presentPreview(animated: true)
    }
    
    /// This function will store your document to some temporary URL and then provide sharing, copying, printing, saving options to the user
    func storeAndShare(withURLString: String) {
        guard let url = URL(string: withURLString) else { return }
        /// START YOUR ACTIVITY INDICATOR HERE
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let tmpURL = FileManager.default.temporaryDirectory
                .appendingPathComponent(response?.suggestedFilename ?? "fileName.png")
            do {
                try data.write(to: tmpURL)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                /// STOP YOUR ACTIVITY INDICATOR HERE
                self.share(url: tmpURL)
            }
            }.resume()
    }
}

extension ViewController: UIDocumentInteractionControllerDelegate {
    /// If presenting atop a navigation stack, provide the navigation controller in order to animate in a manner consistent with the rest of the platform
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        guard let navVC = self.navigationController else {
            return self
        }
        return navVC
    }
}

extension URL {
    var typeIdentifier: String? {
        return (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier
    }
    var localizedName: String? {
        return (try? resourceValues(forKeys: [.localizedNameKey]))?.localizedName
    }
}
*/
