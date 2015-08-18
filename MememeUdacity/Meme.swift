//
//  Meme.swift
//  MememeUdacity
//
//  Created by A658308 on 8/18/15.
//  Copyright (c) 2015 Joe Susnick Co. All rights reserved.
//

import Foundation
import UIKit

class Meme: NSObject {
    let image: UIImage!
    var memedImage: UIImage?
    let topText, bottomText: String!
    
    init(topText: String, bottomText: String, image: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.image = image
        self.memedImage = nil
    }
}
