//
//  PostmanModel.swift
//  AlamofireRouterGenerator
//
//  Created by Nikita_Krasavin    on 14.07.17.
//  Copyright © 2017 Appcraft. All rights reserved.
//

import Foundation
import ObjectMapper

class PostmanModel: Mappable {
    var info: InfoResponse?
    var item: [ItemResponse]?
    var variables: [AnyObject]?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        self.info <- map["info"]
        self.item <- map["item"]
        self.variables <- map["variables"]
    }
}

class InfoResponse: Mappable {
    var description: String?
    var name: String?
    var schema: String?
    var _postman_id: String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        self.description <- map["description"]
        self.name <- map["name"]
        self.schema <- map["schema"]
        self._postman_id <- map["_postman_id"]
    }
}

class ItemResponse: Mappable {
    var description: String?
    var name: String?
    var request: RequestResponse?
    var item: [ItemResponse]?
    var isSubFolder: Bool?
    
    var isFolder: Bool {        //if false - it's request item
        if let subfolder = isSubFolder, subfolder {
            return true
        }
        if item != nil, request == nil {
            return true
        }
        return false
    }
    var watched = false //for recognizing already watched folders
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        self.description <- map["description"]
        self.name <- map["name"]
        self.item <- map["item"]
        self.request <- map["request"]
        self.isSubFolder <- map["_postman_isSubFolder"]
    }
    
    //MARK: - Additional model fields and functions
    //MARK: -
    var hasParameters: Bool {
        guard let currentRequest = request, let urlString = currentRequest.url else {
            return false
        }
        if urlString.getQueryStringParameter().count > 0 {
            return true
        }
        if let requestBody = currentRequest.body, let bodyMode = requestBody.mode{
            switch bodyMode {
            case .formdata:
                if let requestBodyFormdata = requestBody.formdata, requestBodyFormdata.count > 0 {
                    return true
                }
                break
            case .urlencoded:
                if let requestBodyUrlencoded = requestBody.urlencoded, requestBodyUrlencoded.count > 0 {
                    return true
                }
                break
            case .raw:
                if let requestBodyRaw = requestBody.raw, requestBodyRaw.characters.count > 0 {
                    return true
                }
                break
            }
        }
        return false
    }
    
    func getNameForRouter() -> String {
        guard let reqName = name, let requestMethod = request?.method else {
            return ""
        }
        let trimmedRequestName = reqName.removeCharacters(from: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789").inverted)
        if trimmedRequestName.characters.count == 0 {       //log error
            NSLog("CONVERTING \(reqName) ERROR: Wrong request names format in collection. Reuest names can only include characters in set 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789'")
            return ""
        }
        return "\(requestMethod.rawValue.uppercased())\(trimmedRequestName)"
    }
}

class RequestResponse: Mappable {
    var description: String?
    var method: HTTPMethod?
    var body: BodyResponse?
    var url: String?
    var header: [ParameterResponse]?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        self.description <- map["description"]
        self.method <- map["method"]
        self.body <- map["body"]
        self.url <- map["url"]
        self.header <- map["header"]
    }
}

class BodyResponse: Mappable {
    var mode: HTTPBodyMode?
    var formdata: [ParameterResponse]?
    var urlencoded: [ParameterResponse]?
    var raw: String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        self.mode <- map["mode"]
        self.formdata <- map["formdata"]
        self.urlencoded <- map["urlencoded"]
        self.raw <- map["raw"]
    }
}

class ParameterResponse: Mappable {
    var description: String?
    var key: String?
    var value: String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        self.description <- map["description"]
        self.key <- map["key"]
        self.value <- map["value"]
    }
}

class UrlResponse: Mappable {
    var query: Any?
    var path: [String]?
    var raw: String?
    var host: [String]?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        self.query <- map["query"]
        self.path <- map["path"]
        self.raw <- map["raw"]
        self.host <- map["host"]
    }
}

