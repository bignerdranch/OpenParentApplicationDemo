//
//  AppDelegate.swift
//  OpenParentApplicationDemo
//
//  Created by SeanFarrell on 1/14/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication!,
        handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]!,
        reply: (([NSObject : AnyObject]!) -> Void)!) {
            getWordThatRhymesWithSat(userInfo, reply)
    }
    
    func getWordThatRhymesWithSat(userInfo: [NSObject : AnyObject]!, reply: (([NSObject : AnyObject]!) ->Void)!) {

        if let word = userInfo["Desired Word"] as? String {
            var urlString: String?
            
            switch word {
                case "cat":
                    urlString = "http://www.bignerdranch.com/img/blog/2015/01/mainPaletteColors.png"
                case "hat":
                    urlString = "http://www.bignerdranch.com/img/blog/2014/08/historic-logo.png"
                case "Mat":
                    urlString = "http://www.bignerdranch.com/img/nerds/hobby-shots/mathew-jackson.jpg"
                default:
                    urlString = ""
            }
            
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: config, delegate: nil, delegateQueue: nil)
            let url = NSURL(string: urlString!)!
            let request = NSURLRequest(URL: url)
            let dataTask = session.dataTaskWithRequest(request) {
                (data, response, error) -> Void in
                
                if data != nil {
                    let returnDictionary = ["Returned NSData":data];
                    reply(returnDictionary)
                }
            }
            dataTask.resume()
        }
    }

}

