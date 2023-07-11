//
//  Calculate.swift
//  IMC
//
//  Created by Daniel Pelluso Andrade on 06/07/23.
//

import Foundation

class BMIViewMode: ObservableObject {
    
    @Published var weight = ""
    @Published var height = ""
    @Published var bmi = ""

    
    private let model  = BMIModel()
    
    var imageName: String {
        
        guard let bmiValue = Double(bmi) else {
            return ""
        }
        
        switch bmiValue {
            
            case 0..<16:
                return "magreza"
            case 16..<18.5:
                return "abaixo"
            case 18.5..<25:
                return "ideal"
            case 25..<30:
                return "sobrepeso"
            default:
                return "obesidade"
        }
    }
    
    var message: String {
        
        guard let bmiValue = Double(bmi) else {
            return ""
        }
        
        switch bmiValue {
            
            case 0..<16:
                return "Muito abaixo do peso."
            case 16..<18.5:
                return "Abaixo do peso."
            case 18.5..<25:
                return "Peso ideal."
            case 25..<30:
                return "Sobrepeso."
            default:
                return "Obeso."
        }
    }

    func calculateBMI() {
        
        guard let weightValue = Double(weight.replacingOccurrences(of: ",", with: ".")), let heightValue = Double(height.replacingOccurrences(of: ",", with: ".")), heightValue > 0 else {
            bmi = ""
            return
        }

        let bmiValue = model.calculateBMI(weight: weightValue, height: heightValue)
        bmi = String(format: "%.1f",bmiValue)
    }
    
}
