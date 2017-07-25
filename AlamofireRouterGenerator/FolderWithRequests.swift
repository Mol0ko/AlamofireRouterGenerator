//
//  FolderWithRequests.swift
//  AlamofireRouterGenerator
//
//  Created by Nikita_Krasavin    on 25.07.17.
//  Copyright © 2017 Appcraft. All rights reserved.
//

import Foundation

//sorted requests struct:
struct FolderWithRequests {
    var name: String
    var requests: [ItemResponse]
    
    init(folderName: String, requestsInFolder: [ItemResponse]) {
        name = folderName
        requests = requestsInFolder
    }
}
