//
//  InterfaceController.swift
//  OpenParentApplicationDemo WatchKit Extension
//
//  Created by SeanFarrell on 1/15/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var imageView: WKInterfaceImage!
    
    @IBAction func catPressed() {
        self.getDataFromParentApp("cat")
    }

    @IBAction func hatPressed() {
        self.getDataFromParentApp("hat")
    }
    
    @IBAction func matPressed() {
        self.getDataFromParentApp("Mat")
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func getDataFromParentApp(image: String) {
        let dictionary = ["Desired Word":image]
        WKInterfaceController.openParentApplication(dictionary) {
            (replyInfo, error) -> Void in
            if error == nil && replyInfo != nil {
                if let data = replyInfo["Returned NSData"] as? NSData {
                    let image = UIImage(data: data)
                    self.imageView.setImage(image)
                }
            }
        }
        

    }

}
