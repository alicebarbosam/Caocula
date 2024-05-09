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
    @State var result: Int?
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porte: String = "Pequeno"
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Quantos anos completos seu cão tem.", value: $years, format: .number)
              
                
            Text("Meses")
            TextField("E quantos meses além disso ele tem.", value: $months, format: .number)
            
            Text("Porte")
            
            Picker("Porte", selection: $porte){
                ForEach(portes, id: \.self) { porte in
                    Text(porte)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
                .background(.purple)
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
                
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 20)
            }
            
            Spacer()
            Button(action: processYears, label: {
                ZStack{
                    Color.purple
                    Text("Cãocular")
                        .foregroundStyle(.white)
                }
            })
            .cornerRadius(10)
            .frame(height: 50)
                
                
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
    }
    func processYears(){
        guard let years, let months else{
            print("preencha o campo de entrada")
            return
        }
        guard years > 0 || months > 0 else{
            print("algum campo tem que ter valor maior que zero")
            return
        }
        result = years * 7 + months*7/12
    }
}

#Preview {
    ContentView()
}
