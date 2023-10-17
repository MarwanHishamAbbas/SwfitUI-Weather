//
//  ContentView.swift
//  SwfitUI-Weather
//
//  Created by Marwan Hisham on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Alexandria, Egypt")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 70)
                HStack (spacing: 30){
                    WeaherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 70)
                    WeaherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                    WeaherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55)
                    WeaherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                    WeaherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 25)
                }
                Spacer()
                Button{
                    isNight.toggle()}  label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeaherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek).font(.system(size: 16, weight: .medium, design: .default)).foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°").font(.system(size: 28, weight: (.medium))).foregroundStyle(.white)
        }
        
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding(.top, 20)

    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°").font(.system(size: 70, weight: (.medium))).foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

