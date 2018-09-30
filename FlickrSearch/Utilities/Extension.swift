//
//  Extension.swift
//  FlickrSearch
//
//  Created by Satyadev on 30/09/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

import UIKit

//MARK:- UICollectionView
extension UICollectionView {
    func register(nib nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}

//MARK:- UIImageView
extension UIImageView {
    
    func downloadImage(_ url: String) {
        
        ImageDownloadManager.shared.addOperation(url: url,imageView: self) {  [weak self](result,downloadedImageURL)  in
            GCD.runOnMainThread {
                switch result {
                case .Success(let image):
                    self?.image = image
                case .Failure(_):
                    break
                case .Error(_):
                    break
                }
            }
        }
    }
}
