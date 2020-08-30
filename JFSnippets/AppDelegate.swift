//
// File: AppDelegate.swift
// DATE: 2020/7/19
// USER: Jeffy

/// NOTE: 

// Copyright © 2020 Jeffy. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminate(_ sender: NSApplication)-> NSApplication.TerminateReply {
        
        return .terminateNow 
    }
    
    func applicationOpenUntitledFile(_ sender: NSApplication) -> Bool {
        
        return false;
    }
}

