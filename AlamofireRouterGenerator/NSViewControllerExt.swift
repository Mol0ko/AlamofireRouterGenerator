//
//  NSViewControllerExt.swift
//  AlamofireRouterGenerator
//
//  Created by Nikita_Krasavin    on 25.07.17.
//  Copyright © 2017 Appcraft. All rights reserved.
//

import Foundation
import AppKit

extension NSViewController {
    func showDialogOK(text: String) {
        let alert = NSAlert()
        alert.informativeText = text
        alert.alertStyle = NSAlertStyle.warning
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}
