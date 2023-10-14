import UIKit
class CalculateViewController: UIViewController {
    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let originalDouble = sender.value
        let formattedString = String(format: "%.2f", originalDouble)
        heightLabel.text = formattedString + "m"
    }
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value)) + "kg"
    }
    @IBAction func calculateBtn(_ sender: UIButton) {
        
        calculatorBrain.calculateBMI(Height: heightSlider.value, Weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        //  let secondVC = ResultViewController()
        //  self.present(secondVC, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMI()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
        
    }
    
}
