//
//  ContentView.swift
//  IMC
//
//  Created by Daniel Pelluso Andrade on 29/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var calculate = false
    
    @StateObject private var bmiViewMode = BMIViewMode()
    
    var body: some View {
        
        Color(red: 81/255, green: 177/255, blue: 192/255)
        .ignoresSafeArea()
        .overlay {
            
            VStack(spacing: 30){

                VStack(spacing: 5){
                    
                    Text("Cálculo do IMC")
                        .font(.system (size: 36) .weight(.heavy))
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("Descubra o seu Índice de Massa Corporal")
                        .font(.system(size: 15) .weight(.light))
                        .foregroundColor(.white)
                }
                
                HStack(spacing: 60) {
                    VStack{
                        Text("Peso(Kg):")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                        
                        TextField("Ex.: 75", text: $bmiViewMode.weight)
                            .autocorrectionDisabled(true)
                            .frame(width: 100)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                    }
                    
                    VStack{
                        Text("Altura(m):")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                        
                        TextField("Ex.: 1,80", text: $bmiViewMode.height)
                            .autocorrectionDisabled(true)
                            .frame(width: 100)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                    }
                }
                
                VStack(spacing: 20){
                    Button {
                        calculate.toggle()
                        bmiViewMode.calculateBMI()
           
                    } label: {
                        Text("Calcular")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(width: 300, height: 60)
                    .buttonStyle(.bordered)
                    .background(.yellow)
                    .font(.system(size: 17, weight: .heavy))
                    .foregroundColor(.white)
        
                    Text("Seu índice de massa corporal é: \(bmiViewMode.bmi)")
                        .font(.system (size: 18))
                        .foregroundColor(.white)
                    
                    VStack{
                        ZStack{
                            Color.white
                                .frame(maxWidth: 300, maxHeight: 350)
                                .cornerRadius(10)
                                
                            
                            Image(bmiViewMode.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 300, maxHeight: 250)
                        }
                    }
                    
                    Text(bmiViewMode.message)
                        .font(.system (size: 18))
                        .foregroundColor(.white)
                        .frame(height: 18)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
