//
//  SecondViewController.swift
//  Assignment 1 - Grade Calculator
//
//  Created by Turing on 2/4/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let examOneWeight : Float                          = 0.18
    let examTwoWeight : Float                          = 0.18
    let quizzesWeight : Float                          = 0.14
    let finalExamWeight : Float                        = 0.20
    let assignmentsWeight : Float                      = 0.25
    let classParticipationAndAttendanceWeight : Float  = 0.05
    @IBOutlet weak var letterGradeLabel: UILabel!
    @IBOutlet weak var gradeProgressbar: UIProgressView!
    @IBOutlet weak var examOnePercentageLabel: UILabel!
    @IBOutlet weak var examOnePercentageSlider: UISlider!
    @IBOutlet weak var examTwoPercentageLabel: UILabel!
    @IBOutlet weak var examTwoPercentageSlider: UISlider!
    @IBOutlet weak var quizzesPercentageLabel: UILabel!
    @IBOutlet weak var quizzesPercentageSlider: UISlider!
    @IBOutlet weak var finalExamPercentageLabel: UILabel!
    @IBOutlet weak var finalExamPercentageSlider: UISlider!
    @IBOutlet weak var assignmentsPercentageLabel: UILabel!
    @IBOutlet weak var assignmentsPercentageSlider: UISlider!
    @IBOutlet weak var classParticipationAndAttendancePercentageLabel: UILabel!
    @IBOutlet weak var classParticipationAndAttendancePercentageSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    func reset() {
        letterGradeLabel.text = "-"
        letterGradeLabel.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        gradeProgressbar.setProgress(0.1, animated: true)
        gradeProgressbar.progressTintColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        examOnePercentageLabel.text = "0%"
        examTwoPercentageLabel.text = "0%"
        quizzesPercentageLabel.text = "0%"
        finalExamPercentageLabel.text = "0%"
        assignmentsPercentageLabel.text = "0%"
        classParticipationAndAttendancePercentageLabel.text = "0%"
        examOnePercentageSlider.value = 0.0
        examTwoPercentageSlider.value = 0.0
        quizzesPercentageSlider.value = 0.0
        finalExamPercentageSlider.value = 0.0
        assignmentsPercentageSlider.value = 0.0
        classParticipationAndAttendancePercentageSlider.value = 0.0
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            reset()
        }
    }
    
    @IBAction func examOneSliderChanged(_ sender: UISlider) {
        
        let examOneGrade : Int = Int(examOnePercentageSlider.value)
        
        examOnePercentageLabel.text = "\(examOneGrade)%"
        updateGrade();
        
    }
    @IBAction func examTwoSliderChanged(_ sender: UISlider) {
        
        let examTwoGrade : Int = Int(examTwoPercentageSlider.value)
        
        examTwoPercentageLabel.text = "\(examTwoGrade)%"
        updateGrade();
        
    }
    @IBAction func quizzesSliderChanged(_ sender: UISlider) {
        
        let quizzesGrade : Int = Int(quizzesPercentageSlider.value)
        
        quizzesPercentageLabel.text = "\(quizzesGrade)%"
        updateGrade();
        
    }
    @IBAction func finalExamSliderChanged(_ sender: Any) {
        
        let finalExamGrade : Int = Int(finalExamPercentageSlider.value)
        
        finalExamPercentageLabel.text = "\(finalExamGrade)%"
        updateGrade();
        
    }
    @IBAction func assignmentsSliderChanged(_ sender: UISlider) {
        
        let assignmentsGrade : Int = Int(assignmentsPercentageSlider.value)
        
        assignmentsPercentageLabel.text = "\(assignmentsGrade)%"
        updateGrade();
        
    }
    @IBAction func classParticipationAndAttendanceSliderChanged(_ sender: Any) {
        
        let classParticipationAndAttendanceGrade : Int = Int(classParticipationAndAttendancePercentageSlider.value)
        
        classParticipationAndAttendancePercentageLabel.text = "\(classParticipationAndAttendanceGrade)%"
        updateGrade();
        
    }
    func updateGrade() {
        
        var finalGrade : Float = examOnePercentageSlider.value * examOneWeight
        finalGrade             += examTwoPercentageSlider.value * examOneWeight
        finalGrade             += quizzesPercentageSlider.value * quizzesWeight
        finalGrade             += finalExamPercentageSlider.value * finalExamWeight
        finalGrade             += assignmentsPercentageSlider.value * assignmentsWeight
        finalGrade             += classParticipationAndAttendancePercentageSlider.value * classParticipationAndAttendanceWeight
        
        let gradeLetter : String = (finalGrade >= 90.0) ? "A" : (finalGrade >= 80.0) ? "B" : (finalGrade >= 70.0) ? "C" : (finalGrade >= 60.0) ? "D" : "F"
        var gradeColor : UIColor
        switch gradeLetter {
            case "A":
                gradeColor = UIColor(red: 0.0941176471, green: 0.858823529, blue: 0.298039216, alpha: 1.0)
                break
            case "B":
                gradeColor = UIColor(red: 0.0941176471, green: 0.42745098, blue: 0.858823529, alpha: 1.0)
                break
            case "C":
                gradeColor = UIColor(red: 0.890196078, green: 0.694117647, blue: 0.105882353, alpha: 1.0)
                break
            case "D":
                gradeColor = UIColor(red: 0.890196078, green: 0.549019608, blue: 0.105882353, alpha: 1.0)
                break
            default:
                gradeColor = UIColor(red: 0.890196078, green: 0.2, blue: 0.105882353, alpha: 1.0)
                break
        }
        gradeProgressbar.setProgress(finalGrade/100, animated: true)
        letterGradeLabel.text = gradeLetter
        letterGradeLabel.textColor = gradeColor
        gradeProgressbar.progressTintColor = gradeColor
        
    }
    @IBAction func resetButtonPushed(_ sender: Any) {
        
        reset()
        
    }
    @IBAction func courseDescriptionButtonPressed(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Course Description", message: "This course introduces the instruction set architectures (ISA), emphasizing central processor organization and operations. Specific topics include integer and floating-point representations, character codes, register architectures, caching and pipelining,  ISA-level addressing modes, instruction execution cycle, interrupt cycles, operating modes, subroutine call/return and I/O services, digital logic gates and basic Boolean algebra, sequential and combinational circuits and Karnaugh maps for circuit minimization. Programs will be assigned in a representative assembly language to explore these areas.", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        present(alertController, animated: true, completion: nil)
        
    }
    

}

