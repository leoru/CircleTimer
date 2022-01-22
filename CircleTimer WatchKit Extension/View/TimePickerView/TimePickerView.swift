//
//  TimePickerView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import SwiftUI

struct TimePickerView: View {
    
    private var viewModel = TimePickerViewModel()
    
    @State var hour: Int = 0
    @State var minute: Int = 0
    @State var second: Int = 0
    
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
            Text("Hours")
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
            Text("Minutes")
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
            Text("Seconds")
        }
    }
}

struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerView()
    }
}
