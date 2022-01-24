//
//  PickerTitleModifier.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 24.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation
import SwiftUI

struct TimePickerTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .padding(3.0)
            .font(Font.system(size:10.0).bold())
      }
}

struct TimePickerTitleContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.green).cornerRadius(12.0)
      }
}

