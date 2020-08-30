//
// File: ViewController.swift
// DATE: 2020/7/19
// USER: Jeffy

/// NOTE: 

// Copyright © 2020 Jeffy. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextViewDelegate {

    override var representedObject: Any? {
        didSet {
            for child in children {
                child.representedObject = representedObject
            }
        }
    }

    weak var document: Document? {
        if let docRepresentedObject = representedObject as? Document {
            return docRepresentedObject
        }
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear() {
        super.viewDidAppear()
    }

    // MARK: - NSTextViewDelegate

    func textDidBeginEditing(_ notification: Notification) {
        document?.objectDidBeginEditing(self)
    }

    func textDidEndEditing(_ notification: Notification) {
        document?.objectDidEndEditing(self)
    }

}

