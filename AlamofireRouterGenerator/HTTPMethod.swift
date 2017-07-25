//
//  HTTPMethod.swift
//  AlamofireRouterGenerator
//
//  Created by Nikita_Krasavin    on 25.07.17.
//  Copyright © 2017 Appcraft. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
