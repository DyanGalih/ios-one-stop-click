//
//  RegisterWorker.swift
//  OSC
//
//  Created by Dyan Galih on 07/05/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Alamofire

class RegisterWorker
{
    func doRegister(request: Register.NewUser.Request, completion:@escaping (Register.NewUser.Response?, Error?)-> Void)
    {
        let parameters = [
            "name": request.name,
            "email": request.email,
            "password": request.password,
            "password_confirmation": request.password_confirmation
        ]
        
        Alamofire.request(Config().endpoint + "auth/register", method: .post, parameters: parameters as Parameters, encoding:URLEncoding.default).debugLog().responseJSON{ response in
            do{
                let registerStruct = try JSONDecoder().decode(Register.NewUser.Response.self, from: response.data!)
                completion(registerStruct, nil)
            }catch let err{
                completion(nil, err)
            }
        }
    }
}
