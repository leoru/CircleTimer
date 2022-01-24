//
//  TimePickerView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import SwiftUI

struct TimePickerView: View {
    
    var viewModel = TimePickerViewModel()
    
    @Binding public var hour: Int
    @Binding public var minute: Int
    @Binding public var second: Int
    
    var body: some View {
        componentPickers
    }
    
    private var componentPickers: some View {
        HStack {
            hoursPicker
            minutesPicker
            secondsPicker
        }
        .pickerStyle(.wheel)
    }
    
    private var hoursPicker: some View {
        Picker(selection: $hour) {
            ForEach(viewModel.hours) { hour in
                Text(hour.formattedString)
                    .minimumScaleFactor(0.5)
                    .tag(hour)
            }
        } label: {
            pickerTitle(for: "hours".localized)
        }
    }
    
    private var minutesPicker: some View {
        Picker(selection: $minute) {
            ForEach(viewModel.minutes) { minute in
                Text(minute.formattedString)
                    .minimumScaleFactor(0.5)
                    .tag(minute)
            }
        } label: {
            pickerTitle(for: "minutes".localized)
        }
    }
    
    private var secondsPicker: some View {
        Picker(selection: $second) {
            ForEach(viewModel.seconds) { second in
                Text(second.formattedString)
                    .minimumScaleFactor(0.5)
                    .tag(second)
            }
        } label: {
            pickerTitle(for: "seconds".localized)
        }
    }
    
    private func pickerTitle(for text: String) -> some View {
        VStack {
            Text(text).modifier(TimePickerTitleModifier())
        }.modifier(TimePickerTitleContainerModifier())
    }
}
