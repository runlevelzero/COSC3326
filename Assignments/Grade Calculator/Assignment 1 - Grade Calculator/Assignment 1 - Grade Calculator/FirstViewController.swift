//
//  FirstViewController.swift
//  Assignment 1 - Grade Calculator
//
//  Created by Turing on 2/4/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    let homeWorkWeight : Float                         = 0.60
    let finalProjectPrototypeWeight : Float            = 0.05
    let finalProjectImplementationWeight : Float       = 0.20
    let finalProjectPresentationWeight : Float         = 0.05
    let attendanceClassWorkParticipationWeight : Float = 0.10
    @IBOutlet weak var courseDescriptionButton: UIButton!
    @IBOutlet weak var courseGradeProgressBar: UIProgressView!
    @IBOutlet weak var courseGradeLabel: UILabel!
    @IBOutlet weak var homeWorkCategoryPercentageLabel: UILabel!
    @IBOutlet weak var homeWorkCategoryPercentageSlider: UISlider!
    @IBOutlet weak var finalProjectPrototypeCategoryPercentageLabel: UILabel!
    @IBOutlet weak var finalProjectCategoryPercentageSlider: UISlider!
    @IBOutlet weak var finalProjectImplementationCategoryPercentageLabel: UILabel!
    @IBOutlet weak var finalProjectImplementationCategoryPercentageSlider: UISlider!
    @IBOutlet weak var finalProjectPresentationCategoryPercentageLabel: UILabel!
    @IBOutlet weak var finalProjectPresentationCategoryPercentageSlider: UISlider!
    @IBOutlet weak var attendanceClassWorkParticipationCategoryPercentageLabel: UILabel!
    @IBOutlet weak var attendanceClassWorkParticipationCategoryPercentageSlider: UISlider!
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
        homeWorkCategoryPercentageSlider.value = 0.0
        finalProjectCategoryPercentageSlider.value = 0.0
        finalProjectPresentationCategoryPercentageSlider.value = 0.0
        finalProjectImplementationCategoryPercentageSlider.value = 0.0
        attendanceClassWorkParticipationCategoryPercentageSlider.value = 0.0
        homeWorkCategoryPercentageLabel.text = "0%"
        finalProjectPrototypeCategoryPercentageLabel.text = "0%"
        finalProjectImplementationCategoryPercentageLabel.text = "0%"
        finalProjectPresentationCategoryPercentageLabel.text = "0%"
        attendanceClassWorkParticipationCategoryPercentageLabel.text = "0%"
        courseGradeProgressBar.setProgress(0.1, animated: true)
        courseGradeLabel.text = "-"
        courseGradeLabel.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        courseGradeProgressBar.progressTintColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            reset()
        }
    }
    @IBAction func getCourseDescription(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Course Description", message: "The Mobile Programming course teaches students how to develop applications for Apple iOS devices such as iPhones and iPads. In this course, we will go through the process of building a mobile application from start to finish, that is, from an idea to an application ready to be submitted to the App Store. We will learn how to code our mobile applications using Swift, Apple’s newest programming language for iOS, OSX, tvOS, and watchOS. Students will also learn the MVC (Model, View, Controller) architecture to write clean and well-organized code in their mobile applications using  the Xcode IDE (Integrated Development Environment). The course will be centered around various projects that require critical thinking, creativity, communication and collaboration in order to create useful mobile applications. For the sake of keeping ourselves up-to-date with the latest trends in mobile programming, we will be using Apple’s latest version of Xcode v.11.3 and Swift v.4.2.1, which isused for building SDKs for iOS v.13.3,iPadOS v.13.3, tvOS v.13.3,watchOS v.6.1.1, and macOS Catalina v.10.15.2.", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }
    @IBAction func homeWorkCategoryPercentageChanged(_ sender: UISlider) {
        
        let homeWorkGrade : Int = Int(homeWorkCategoryPercentageSlider.value)
        homeWorkCategoryPercentageLabel.text = "\(homeWorkGrade)%"
        updateGrade()
        
    }
    
    @IBAction func finalProjectPrototypePercentageChanged(_ sender: UISlider) {
        
        let finalProjectPrototypeGrade : Int = Int(finalProjectCategoryPercentageSlider.value)
        finalProjectPrototypeCategoryPercentageLabel.text = "\(finalProjectPrototypeGrade)%"
        updateGrade()
        
    }
    @IBAction func finalProjectImplementationPercentageChanged(_ sender: UISlider) {
        
        let finalProjectImplementationGrade : Int = Int(finalProjectImplementationCategoryPercentageSlider.value)
        finalProjectImplementationCategoryPercentageLabel.text = "\(finalProjectImplementationGrade)%"
        updateGrade()
        
    }
    @IBAction func finalProjectPresentationPercentageChanged(_ sender: UISlider) {
        
        let finalProjectPresentationGrade : Int = Int(finalProjectPresentationCategoryPercentageSlider.value)
        finalProjectPresentationCategoryPercentageLabel.text = "\(finalProjectPresentationGrade)%"
        updateGrade()
        
    }
    @IBAction func attendanceClassWorkParticipationPercentageChanged(_ sender: UISlider) {
        
        let attendanceClassWorkParticipationGrade : Int = Int(attendanceClassWorkParticipationCategoryPercentageSlider.value)
        attendanceClassWorkParticipationCategoryPercentageLabel.text = "\(attendanceClassWorkParticipationGrade)%"
        updateGrade()
        
    }
    func updateGrade() {
        var totalGrade : Float = ((homeWorkCategoryPercentageSlider.value) * homeWorkWeight)
        totalGrade += ((finalProjectCategoryPercentageSlider.value) * finalProjectPrototypeWeight)
        totalGrade += ((finalProjectImplementationCategoryPercentageSlider.value) * finalProjectImplementationWeight)
        totalGrade += ((finalProjectPresentationCategoryPercentageSlider.value) * finalProjectPresentationWeight)
        totalGrade += ((attendanceClassWorkParticipationCategoryPercentageSlider.value) * attendanceClassWorkParticipationWeight)
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
        courseGradeProgressBar.setProgress(totalGrade/100, animated: true)
        courseGradeLabel.text = gradeLetter
        courseGradeLabel.textColor = gradeColor
        courseGradeProgressBar.progressTintColor = gradeColor
        
    }
    @IBAction func resetButtonPushed(_ sender: UIButton) {
        reset()
    }
}

