//
//  ViewController.swift
//  MultiThreadingSwift
//
//  Created by Benjamin Encz on 10/2/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var downloadStatusLabel: UILabel!
  @IBOutlet var stringDisplayLabel: UILabel!
  
  let strings = ["Test1", "Test2", "Test3"]
  var currentStringIndex = 0
  var operationCount = 20
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    downloadData()
  }
  
  @IBAction func nextStringButtonTapped(sender: AnyObject) {
    currentStringIndex++
    currentStringIndex = currentStringIndex < strings.count ? currentStringIndex : 0
    
    stringDisplayLabel.text = strings[currentStringIndex]
  }
  
  func downloadData() {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0)) {
        for i in 1...self.operationCount {
            self.downloadStatusLabel.text = "\(i)/\(self.operationCount)"
            sleep(1)
        }
        
        self.downloadStatusLabel.text = "Completed!"
    }
  }
}

