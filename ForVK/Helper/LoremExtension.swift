//
//  Lorem+Avatar.swift
//  VKClient
//
//  Created by Vadim on 23.07.2020.
//  Copyright © 2020 Vadim. All rights reserved.
//

import UIKit

public extension Lorem {
    
    static var avatar: UIImage? {
        return UIImage(named: "Avatar/\(String(Int.random(in: 1...9)))")
    }
    
    
    static var img: UIImage? {
        return UIImage(named: "Img/\(String(Int.random(in: 1...8)))")
    }
    
}
