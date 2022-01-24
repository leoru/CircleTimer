//
//  IntExtension.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation

extension Int {
    var formattedString: String {
        String(format: "%02d", self)
    }
}
