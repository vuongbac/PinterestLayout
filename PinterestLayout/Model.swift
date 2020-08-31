//
//  Model.swift
//  PinterestLayout
//
//  Created by Vương Toàn Bắc on 8/31/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation
import UIKit

class Model: NSObject {
    
    var images : [UIImage] = []
    
    // Assemble an array of images to use for sample content for the collectionView
    func buildDataSource(){
        images = (1...8).map { UIImage(named: "image\($0)")! }
    }
    
}
