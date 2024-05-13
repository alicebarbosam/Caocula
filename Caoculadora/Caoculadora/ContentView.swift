//
//  ContentView.swift
//  Caoculadora
//
//  Created by Alice Barbosa on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    @State var porteSelecionado: Porte = .pequeno
    @State var failedInput = false
    let tituloPreencherCampos = "Preencha os campos para poder cãocular!"
    let tituloCamposZero = "Algum dos campos precisa ter valor maior que 0"
    @State var zeroInput = false
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                    Text("Anos")
                        .font(.body1)
                    TextField("Quantos anos completos seu cão tem.", value: $years, format: .number)
                    
                    
                    Text("Meses")
                        .font(.body1)
                    TextField("E quantos meses além disso ele tem.", value: $months, format: .number)
                    
                    Text("Porte")
                        .font(.body1)
                    
                    Picker("Porte", selection: $porteSelecionado){
                        ForEach(Porte.allCases, id: \.self) { porte in
                            Text(porte.rawValue.capitalized)
                                .tag(porte)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Divider()
                        .background(.indigo600)
                    
                    if let result {
                        Text("Seu cachorro tem, em idade humana...")
                            .font(.body1)
                            .frame(maxWidth: .infinity)
                        
                        Spacer()
                        Text("\(result) anos").contentTransition(.numericText())
                            .font(.display)
                            .frame(maxWidth: .infinity)
                    } else {
                        
                        Spacer()
                        
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
                            Color.indigo600
                            Text("Cãocular")
                                .foregroundStyle(.white)
                                .font(.body1)
                        }
                    })
                    .cornerRadius(10)
                    .frame(height: 50)
                    
                    
                }
                
                .padding()
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .navigationTitle("Cãoculadora")
                
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.indigo600, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
                .alert(tituloPreencherCampos, isPresented: $failedInput){
                    Button("OK", role: .cancel, action: {})
                }
                .alert(tituloCamposZero, isPresented: $zeroInput){
                    Button("OK", role: .cancel, action: {})
                }
             
                /*.confirmationDialog(tituloPreencherCampos, isPresented: $failedInput, titleVisibility: .visible){
                    Button("OK", role: .cancel, action: {})
                }*/
            }
            .animation(.easeOut, value: result)
            .scrollDismissesKeyboard(.immediately)
        }
    }
    func processYears(){
        guard let years, let months else{
            print("preencha o campo de entrada")
            failedInput = true
            return
        }
        guard years > 0 || months > 0 else{
            print("algum campo tem que ter valor maior que zero")
            zeroInput = true
            return
        }
        withAnimation{
            result = porteSelecionado.conversaoDeIdade(anos: years, meses: months)
        }
    }
}

#Preview {
    ContentView()
}
