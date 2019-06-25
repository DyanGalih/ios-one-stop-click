//
//  CategoryModels.swift
//  OSC
//
//  Created by Dyan Galih on 27/05/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Category {
    // MARK: Use cases

    enum List {
        struct TimeFormat:Decodable {
            var Time: String
            var Valid: Bool
        }

        struct Request {

        }
        
        struct Item:Decodable {
            var category_id: Int32
            var category_name: String
            var created_at: TimeFormat
            var updated_at: TimeFormat
        }
        
        struct Data:Decodable {
            var count: Int32
            var list: [Item]
        }

        struct Response:Decodable {
            var code: Int32
            var message: String
            var data: Data
        }

        struct ViewModel {
            var data:Data
        }
    }
}
