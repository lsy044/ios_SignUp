//
//  LastViewController.swift
//  project2
//
//  Created by JIN on 08/08/2019.
//  Copyright © 2019 sy. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet var phoneNumberField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    
    let dateFormatter: DateFormatter =  {
        let formatter: DateFormatter = DateFormatter()
        
        formatter.dateStyle = .medium
        return formatter
    }()
    
    //detect textField
    @IBAction func textFieldTextEdited(_ sender: UITextField) {
        determineButtonState()
        UserInformation.shared.phoneNumber = phoneNumberField.text //임시전달
    }
    
    //TapView - 키보드내림
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    //datePicker값 바뀔때
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        //label에 date나오게
        let date: Date = self.datePicker.date //= sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.birthDateLabel.text = dateString
        determineButtonState()
        UserInformation.shared.birthDate = birthDateLabel.text
    }
    
    //Dismiss modal - 취소
    @IBAction func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
        
        //User information 모두 삭제
        UserInformation.shared.reset()
    }
    
    //pop - 이전
    @IBAction func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //signUp버튼 동작
    @IBAction func signUp() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //keep information
        phoneNumberField.text = UserInformation.shared.phoneNumber
        birthDateLabel.text = UserInformation.shared.birthDate
        
        //옵셔널 수정
        if let string: String = birthDateLabel.text {
            if let setDate: Date =  dateFormatter.date(from: string) {
                self.datePicker.date = setDate
            }
        }
        
         determineButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    }
    
    func determineButtonState() {
        if let phoneNumber: String = phoneNumberField.text, phoneNumber.count > 0, let birthDate: String = self.birthDateLabel.text, birthDate.count > 0 {
            signUpButton.isEnabled = true
        } else {
            signUpButton.isEnabled = false
        }
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
