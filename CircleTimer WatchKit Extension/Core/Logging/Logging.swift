//
//  Logging.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 16.02.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation


/// Log data in debug mode
/// - Parameters:
///   - tag: Data tag
///   - message: message data
func log(_ tag: String, _ message: Any...) {
#if DEBUG
    print("[\(tag)] \(message)")
#endif
}
