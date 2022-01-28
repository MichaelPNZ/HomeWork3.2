//
//  ColorSliderView.swift
//  HomeWork3.2
//
//  Created by Михаил Позялов on 28.01.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var text = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(color)
                .frame(width: 40)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: value) { newValue in
                    text = "\(lround(newValue))"
                }
                    
            TextFieldView(text: $text, value: $value)
        }
        .onAppear {
            text = "\(lround(value))"
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(100), color: .red)
    }
}
