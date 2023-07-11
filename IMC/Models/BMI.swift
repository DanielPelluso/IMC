//
//  BMI.swift
//  IMC
//
//  Created by Daniel Pelluso Andrade on 08/07/23.
//

import Foundation

struct BMIModel {
    func calculateBMI (weight: Double, height: Double) -> Double {
        return weight / (height * height)
    }
}
