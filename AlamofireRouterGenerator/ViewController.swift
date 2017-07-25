//
//  ViewController.swift
//  AlamofireRouterGenerator
//
//  Created by Nikita_Krasavin    on 14.07.17.
//  Copyright © 2017 Appcraft. All rights reserved.
//

import Cocoa
import ObjectMapper

class ViewController: NSViewController {
    
    @IBOutlet var PostmanTextView: NSTextView!
    @IBOutlet var SwiftTextView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PostmanTextView.lnv_setUpLineNumberView()
        SwiftTextView.lnv_setUpLineNumberView()
        
        PostmanTextView.becomeFirstResponder()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func generateButtonTapped(_ sender: Any) {
        let postmanStr = PostmanTextView.string
        
        guard let model = PostmanModel(JSONString: postmanStr ?? "") else {
            return
        }
        let generator = Generator(postmanModel: model)
        SwiftTextView.string  = generator.generateSwift3Router()
        //SwiftTextView.r
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        PostmanTextView.string = ""
        SwiftTextView.string = ""
    }
}

