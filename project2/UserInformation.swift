//
//  UserInformation.swift
//  project2
//
//  Created by JIN on 08/08/2019.
//  Copyright © 2019 sy. All rights reserved.
//

import UIKit

class UserInformation: NSObject {
    
    var id: String?
    var password: String?
    var introduce: String?
    var phoneNumber: String?
    var birthDate: String?
    var profileImage: UIImage? 
    
    static let shared: UserInformation = UserInformation()
    
    func reset() {
        UserInformation.shared.id = nil
        UserInformation.shared.password = nil
        UserInformation.shared.introduce = nil
        UserInformation.shared.phoneNumber = nil
        UserInformation.shared.birthDate = nil
        UserInformation.shared.profileImage = nil
        print("true")
    }
}
