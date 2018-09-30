//
//  Result.swift
//  FlickrSearch
//
//  Created by Satyadev on 30/09/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

import UIKit

enum Result <T>{
    case Success(T)
    case Failure(String)
    case Error(String)
}
