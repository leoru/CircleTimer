//
//  TimerButtonModifier.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 25.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation
import SwiftUI

struct TimerButtonImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 20.0, height: 20.0)
    }
}

