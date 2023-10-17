//
//  WeatherButton.swift
//  SwfitUI-Weather
//
//  Created by Marwan Hisham on 17/10/2023.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title).frame(width: 280, height: 50).background(backgroundColor).foregroundColor(textColor).cornerRadius(.infinity).font(.system(size: 18, weight: .bold, design: .default))
    }
}
