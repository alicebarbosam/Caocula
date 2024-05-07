//
//  ContentView.swift
//  Caoculadora
//
//  Created by Alice Barbosa on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var texto: String = ""
    @State var years: Int? = nil
    @State var months: Int? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão")
            Text("Anos")
            TextField("Quantos anos completos seu cão tem.", value: $years, format: .number)
              
                
            Text("Meses")
            TextField("E quantos meses além disso ele tem.", value: $months, format: .number)
                
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
    }
}

#Preview {
    ContentView()
}
