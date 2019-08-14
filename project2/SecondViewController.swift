//
//  SecondViewController.swift
//  project2
//
//  Created by JIN on 08/08/2019.
//  Copyright © 2019 sy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,  UITextViewDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true //편집가능 //위치수정 -> 초기화시
        
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var idField: UITextField!
    @IBOutlet var passwordField: UITextField! 
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var introduceField: UITextView!
    @IBOutlet var nextButton: UIButton!
    
    //Tap imageView - 사진첩불러오기
    @IBAction func tapImageView(_ sender: UITapGestureRecognizer) {
        self.present(self.imagePicker, animated: true, completion: nil)
        
    }
    
    //Cancel Selecting Image
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Select Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage: UIImage =
            info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = editedImage
            UserInformation.shared.profileImage = self.imageView.image
            determineButtonState() //profileImage도 필수조건으로
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //TapView - 키보드내림
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    //detect textField - nextButton 활성화
    @IBAction func textFieldTextEdited(_ sender: UITextField) {
        determineButtonState()
        
        //전달
        UserInformation.shared.id = idField.text
        UserInformation.shared.password = passwordField.text
    }
    
    //textView - 자기소개전달 (필수조건으로 변경)
    func textViewDidChange(_ textView: UITextView) {
        determineButtonState()
        UserInformation.shared.introduce = introduceField.text
    }
    
    //Dismiss modal - 취소
    @IBAction func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
        
        //User information 모두 삭제
        UserInformation.shared.reset()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //lastviewcontroller에서 돌아왔을때 - 자동?
//        if let id: String = UserInformation.shared.id, let password: String = UserInformation.shared.password{
//            idField.text = id
//            passwordField.text = password
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introduceField.delegate = self
    }
    
    func determineButtonState() {
        if let id: String = idField.text, id.count > 0,
            let password: String = passwordField.text, password.count > 0,
            let confirmPassword: String = confirmPasswordField.text, confirmPassword == password,
            let introduce: String = introduceField.text, introduce.count > 0,
            UserInformation.shared.profileImage != nil {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
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
