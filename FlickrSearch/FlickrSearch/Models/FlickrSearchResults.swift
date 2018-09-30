//
//  FlickrSearchResults.swift
//  FlickrSearch
//
//  Created by Satyadev on 30/09/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

import UIKit

struct FlickrSearchResults: Codable {
    let stat: String?
    let photos: Photos?
    
    /*enum CodingKeys: String, CodingKey {
        case stat
        case photos
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        stat = try container.decodeIfPresent(String.self, forKey: .stat)
        photos = try container.decodeIfPresent(Photos.self, forKey: .photos)
    }*/
}
