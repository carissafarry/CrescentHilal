//
//  ColorSliderPickerView.swift
//  Crescent Hilal
//
//  Created by Carissa Farry Hilmi Az Zahra on 19/04/23.
//

import SwiftUI


struct ColorSliderPickerView: View {
    @State private var value: Double = 0.5
        @State private var color: Color = .red
    
    var body: some View {
        VStack { 
            Slider(value: $value)
                .accentColor(color)
            
            Rectangle()
                .fill(color)
                .frame(width: 100, height: 100)
            
            // TODO: Bulan bakal keliatan waktu nilai colornya dr berapa sampai berapa
            Image("Hilal")
                .background(color)
        }
        .onChange(of: value) { newValue in
            // TODO: Tentukan warna apa aja yg mau muncul (kuning ke purple harusnya)
            let hue = newValue * 360
            color = Color(hue: hue/360, saturation: 1, brightness: 1)
        }
    }
}

struct ColorSliderPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderPickerView()
    }
}
