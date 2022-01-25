//
//  ColorView.swift
//  HomeWork3.2
//
//  Created by Михаил Позялов on 24.01.2022.
//

import SwiftUI

struct ColorView: View {
    
    let currentColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(height: 150)
            .foregroundColor(currentColor)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(currentColor: Color.blue)
    }
}
