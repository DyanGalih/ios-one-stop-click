//
//  Auth.swift
//  OSC
//
//  Created by Dyan Galih on 21/06/19.
//  Copyright © 2019 Dyan Galih. All rights reserved.
//

import CoreData
import UIKit

class ClientAuth {
    func getToken() -> String? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Auth")

        var token: String?

        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                token = (data.value(forKey: "token") as! String)
            }
        } catch {
            token = nil
        }
        return token
    }
}
