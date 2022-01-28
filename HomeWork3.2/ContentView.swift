//
//  ContentView.swift
//  HomeWork3.2
//
//  Created by Михаил Позялов on 24.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValueRed = 255.0
    @State private var sliderValueGreen = 255.0
    @State private var sliderValueBlue = 255.0
    @State private var alertPresented = false
    @FocusState private var focusedField: Bool
    
    var body: some View {
        ZStack {
            Color(.brown)
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = false
                }
            VStack(spacing: 20) {
                ColorView(red: sliderValueRed, green: sliderValueGreen, blue: sliderValueBlue)
                VStack {
                    ColorSliderView(value: $sliderValueRed, color: .red)
                    ColorSliderView(value: $sliderValueGreen, color: .green)
                    ColorSliderView(value: $sliderValueBlue, color: .blue)
                }
                .frame(height: 150)
                .focused($focusedField)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done"){
                            focusedField = false
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
        ContentView()
        }
    }
}


