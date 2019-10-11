//
//  AvaliableFilesList.swift
//  FilesApp
//
//  Created by Vishwanath Kota on 08/10/2019.
//  Copyright © 2019 Vishwanath Kota. All rights reserved.
//

import UIKit

class AvaliableFilesList: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var filesList: UITableView!
    var urlsAry:[NSURL] = []
    var onDoneBlock : ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        print(urlsAry)
//
//        filesList.delegate = self
//        filesList.dataSource = self
//         print(urlsAry)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urlsAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let str = urlsAry[indexPath.row].lastPathComponent
        let ext = urlsAry[indexPath.row].pathExtension
        if (ext == "vbo"){
            cell.textLabel?.isUserInteractionEnabled = true
            cell.textLabel?.alpha = 1
        } else {
            cell.textLabel?.isUserInteractionEnabled = false
            cell.textLabel?.alpha = 0.2
        }
        cell.textLabel?.text = str
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPosition = indexPath.row
        print(indexPosition)
        let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.positionIndex = indexPosition
        onDoneBlock!(urlsAry[indexPosition].lastPathComponent!)
//        self.navigationController?.pushViewController(vc, animated: true)
        dismiss(animated: true, completion: nil)
    }

}
