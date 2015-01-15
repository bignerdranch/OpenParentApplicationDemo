//
//  ViewController.swift
//  OpenParentApplicationDemo
//
//  Created by SeanFarrell on 1/14/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImageView() {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let getDictionary = ["Desired Word" : "cat"]
        appDelegate.getWordThatRhymesWithSat(getDictionary) {(result: [NSObject : AnyObject]!) in
            let data = result["Returned NSData"]! as NSData

            let image = UIImage(data: data)
            self.imageView.image = image
        }
    }


}

