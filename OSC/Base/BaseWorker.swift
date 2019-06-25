//
//  BaseWorker.swift
//  OSC
//
//  Created by Dyan Galih on 25/06/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import UIKit

class BaseWorker {
    func getHeader() -> [String: String] {
        let clientAuth = ClientAuth()

        let token: String = clientAuth.getToken()!
        return ["Authorization": "Bearer " + token]
    }
}
