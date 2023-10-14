import Foundation
import UIKit

struct CalculatorBrain{
    //  var BMI : Float?
    var bmi : BMI?
    func getBMI()->String{
        let bmiToOneDecimal = String(format: "%.1f",bmi?.value ?? 0.0)
        return bmiToOneDecimal
    }
    func getAdvice()-> String{
        return bmi?.advice ?? " "
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .blue
    }
    mutating func calculateBMI(Height:Float,Weight:Float) {
        let bmiValue = (Weight)/(pow(Height,2))
        if bmiValue < 18.5 {
            // Under weight
            bmi = BMI(value: bmiValue, advice: "Eat More pies", color: UIColor.green)
        }
        else if bmiValue < 24.9 {
            // Normal
            bmi = BMI(value: bmiValue, advice: "You are fit!", color: UIColor.yellow)
        }
        else {
            // Overweight
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.red)
        }
        
        
    }
}
