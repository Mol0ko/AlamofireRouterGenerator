//
//  NSStringExt.swift
//  AlamofireRouterGenerator
//
//  Created by Nikita_Krasavin    on 25.07.17.
//  Copyright © 2017 Appcraft. All rights reserved.
//

import Foundation

extension String {
    
    func removeCharacters(from forbiddenChars: CharacterSet) -> String {
        let passed = self.unicodeScalars.filter { !forbiddenChars.contains($0) }
        return String(String.UnicodeScalarView(passed))
    }
    
    func commonPrefixWith(aStr: String) -> String {
        var i = 0
        var stop = false
        
        return self.characters.reduce("") {
            aggregate, char in
            let index = self.index(startIndex, offsetBy: i)
            if !stop && index <= aStr.endIndex && char == aStr[index] {
                i += 1
                return aggregate + String(char)
            } else {
                stop = true
                return aggregate
            }
        }
    }
    
    func getQueryStringParameter() -> [URLQueryItem] {
        guard let url = URLComponents(string: self) else {
            return [URLQueryItem]()
        }
        
        return url.queryItems ?? [URLQueryItem]()
    }
    
    func getQueryStringWithoutParameters() -> String {
        guard let url = URLComponents(string: self) else {
            return ""
        }
        if let sheme = url.scheme, let host = url.host, let path = url.url?.path {
            return sheme + "://" + host + path
        }
        
        return ""
    }
}
