//
//  ThirdViewController.swift
//  Assignment 1 - Grade Calculator
//
//  Created by Ruben Ruiz on 2/5/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    let testsPercentageWeight: Float                   = 0.20
    let selfManagedTeamInsightsPercentageWeight: Float = 0.15
    let teamSprintPlanExecutionAndResultsWeight: Float = 0.25
    let classParticipationWeight: Float                = 0.10
    let teamEndOfProjectDemoPercentageWeight: Float    = 0.30
    
    @IBOutlet weak var letterGradeLabel: UILabel!
    @IBOutlet weak var gradeProgressBar: UIProgressView!
    @IBOutlet weak var testsPercentageLabel: UILabel!
    @IBOutlet weak var testsPercentageSlider: UISlider!
    @IBOutlet weak var selfManagedTeamInsightsPercentageLabel: UILabel!
    @IBOutlet weak var selfManagedTeamInsightsPercentageSlider: UISlider!
    @IBOutlet weak var teamSprintPlanExecutionAndResultsLabel: UILabel!
    @IBOutlet weak var teamSprintPlanExecutionAndResultsSlider: UISlider!
    @IBOutlet weak var classParticipationLabel: UILabel!
    @IBOutlet weak var classParticipationSlider: UISlider!
    @IBOutlet weak var teamEndOfProjectDemoPercentageLabel: UILabel!
    @IBOutlet weak var teamEndOfProjectDemoPercenageSlider: UISlider!
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
        gradeProgressBar.setProgress(0.1, animated: true)
        gradeProgressBar.progressTintColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        testsPercentageLabel.text = "0%"
        selfManagedTeamInsightsPercentageLabel.text = "0%"
        teamSprintPlanExecutionAndResultsLabel.text = "0%"
        classParticipationLabel.text = "0%"
        teamEndOfProjectDemoPercentageLabel.text = "0%"
        testsPercentageSlider.value = 0.0
        selfManagedTeamInsightsPercentageSlider.value = 0.0
        teamSprintPlanExecutionAndResultsSlider.value = 0.0
        classParticipationSlider.value = 0.0
        teamEndOfProjectDemoPercenageSlider.value = 0.0
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            reset()
        }
    }
    @IBAction func testsSliderChanged(_ sender: UISlider) {
        
        let grade:Int = Int(testsPercentageSlider.value)
        
        testsPercentageLabel.text = "\(grade)%"
        updateGrade()
        
    }
    @IBAction func selfManagedTeamInsightsSliderChanged(_ sender: UISlider) {
        
        let grade:Int = Int(selfManagedTeamInsightsPercentageSlider.value)
        
        selfManagedTeamInsightsPercentageLabel.text = "\(grade)%"
        updateGrade()
        
    }
    @IBAction func teamSprintPlanExecutionAndResultsSliderChanged(_ sender: UISlider) {
        
        let grade:Int = Int(teamSprintPlanExecutionAndResultsSlider.value)
        
        teamSprintPlanExecutionAndResultsLabel.text = "\(grade)%"
        updateGrade()
        
    }
    @IBAction func classParticipationSliderChanged(_ sender: UISlider) {
        
        let grade:Int = Int(classParticipationSlider.value)
        
        classParticipationLabel.text = "\(grade)%"
        updateGrade()
    }
    
    @IBAction func teamEndOfProjectDemoSliderChanged(_ sender: UISlider) {
        
        let grade:Int = Int(teamEndOfProjectDemoPercenageSlider.value)
        
        teamEndOfProjectDemoPercentageLabel.text = "\(grade)%"
        updateGrade()
        
    }
    func updateGrade() {
        var totalGrade : Float = ((testsPercentageSlider.value) * testsPercentageWeight)
        totalGrade += ((selfManagedTeamInsightsPercentageSlider.value) * selfManagedTeamInsightsPercentageWeight)
        totalGrade += ((teamSprintPlanExecutionAndResultsSlider.value) * teamSprintPlanExecutionAndResultsWeight)
        totalGrade += ((classParticipationSlider.value) * classParticipationWeight)
        totalGrade += ((teamEndOfProjectDemoPercenageSlider.value) * teamEndOfProjectDemoPercentageWeight)
        let gradeLetter : String = (totalGrade >= 90.0) ? "A" : (totalGrade >= 80.0) ? "B" : (totalGrade >= 70.0) ? "C" : (totalGrade >= 60.0) ? "D" : "F"
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
        gradeProgressBar.setProgress(totalGrade/100, animated: true)
        letterGradeLabel.text = gradeLetter
        letterGradeLabel.textColor = gradeColor
        gradeProgressBar.progressTintColor = gradeColor
        
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
    @IBAction func courseDescriptionButtonPressed(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Course Description", message: "An introduction to the theory, methods and tools of software engineering and system analysis. Each student will take part in the specification, design, implementation, testing, evolution, maintenance and management of a large-scale team project. Students will be exposed to best practices and use industry-standard tools. Topics include software development methodologies, object-oriented design, software testing, client management and technical communication.", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        present(alertController, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
