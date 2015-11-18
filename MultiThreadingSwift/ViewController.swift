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
    var operationCount = 1000
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        downloadData()
    }
    @IBAction func startOperationPressed(sender: UIButton) {
        
    }
    
    @IBAction func nextStringButtonTapped(sender: AnyObject) {
        currentStringIndex++
        currentStringIndex = currentStringIndex < strings.count ? currentStringIndex : 0
        
        stringDisplayLabel.text = strings[currentStringIndex]
    }
    
    func downloadData() {
        let updateLabelQueue = NSOperationQueue()
        
        for i in 1...self.operationCount {
            let i = NSBlockOperation {
                self.downloadStatusLabel.text = "\(i)/\(self.operationCount)"
                sleep(1)
            }
            i.queuePriority = .Low
            updateLabelQueue.addOperations([i], waitUntilFinished: false)
        }
        self.downloadStatusLabel.text = "Completed!"
        
        
    }
}

