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
            VStack(spacing: 20) {
                ColorView(currentColor: Color(red: sliderValueRed / 255, green: sliderValueGreen / 255, blue: sliderValueBlue / 255))
                ColorSliderView(value: $sliderValueRed, textColor: .red)
                    .accentColor(Color.red)
                    .focused($focusedField)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            
                            Button("Done"){
                                focusedField = false
                            }
                        }
                    }
                ColorSliderView(value: $sliderValueGreen, textColor: .green)
                    .accentColor(Color.green)
                    .focused($focusedField)
                ColorSliderView(value: $sliderValueBlue, textColor: .blue)
                    .accentColor(Color.blue)
                    .focused($focusedField)

                Spacer()
            }
            .padding()
        }
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let textColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(textColor)
                .frame(width: 40)
            Slider(value: $value, in: 0...255, step: 1)
            TextField("255", value: $value, formatter: NumberFormatter())
                .bordered()
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .background(.white)
                .cornerRadius(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.black)
            )
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}
