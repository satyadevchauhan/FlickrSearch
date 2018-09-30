//
//  FlickrPhoto.swift
//  FlickrSearch
//
//  Created by Satyadev on 30/09/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

import UIKit

struct FlickrPhoto: Codable {
    
    let farm : Int
    let id : String
    
    let isfamily : Int
    let isfriend : Int
    let ispublic : Int
    
    let owner: String
    let secret : String
    let server : String
    let title: String
    
    /*enum CodingKeys: String, CodingKey {
        case farm
        case id
        
        case isfamily
        case isfriend
        case ispublic
        
        case owner
        case secret
        case server
        case title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        farm = try container.decode(Int.self, forKey: .farm)
        id = try container.decode(String.self, forKey: .id)
        
        isfamily = try container.decode(Int.self, forKey: .isfamily)
        isfriend = try container.decode(Int.self, forKey: .isfriend)
        ispublic = try container.decode(Int.self, forKey: .ispublic)
        
        owner = try container.decode(String.self, forKey: .owner)
        secret = try container.decode(String.self, forKey: .secret)
        server = try container.decode(String.self, forKey: .server)
        title = try container.decode(String.self, forKey: .title)
    }*/
    
    var imageURL: String {
        let urlString = String(format: FlickrConstants.imageURL, farm, server, id, secret)
        return urlString
    }
}
