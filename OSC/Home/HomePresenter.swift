//
//  HomePresenter.swift
//  OSC
//
//  Created by Dyan Galih on 13/05/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic
{
  func presentHomeData(response: Home.Data.Response)
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentHomeData(response: Home.Data.Response)
  {
    let viewModel = Home.Data.ViewModel(data: response.data)
    viewController?.displayHomeList(viewModel: viewModel)
  }
}
