//
//  ProductDetailViewController.swift
//  OSC
//
//  Created by Dyan Galih on 08/07/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Alamofire
import AlamofireImage
import UIKit

protocol ProductDetailDisplayLogic: class
{
    func displayProductDetail(viewModel: ProductDetail.Item.ViewModel)
}

class ProductDetailViewController: UIViewController, ProductDetailDisplayLogic
{
    var interactor: ProductDetailBusinessLogic?
    var router: (NSObjectProtocol & ProductDetailRoutingLogic & ProductDetailDataPassing)?
    var ImageCache = [String: UIImage]()
    var defaultImage: UIImage?
    let util = Util()
    
    @IBOutlet var titleTxt: UILabel!
    @IBOutlet var previewImg: UIImageView!
    @IBOutlet var priceTxt: UILabel!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = ProductDetailInteractor()
        let presenter = ProductDetailPresenter()
        let router = ProductDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier
        {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector)
            {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doDisplayProductDetail()
        defaultImage = UIImage(named: "noimage")
    }
    
    // MARK: Do something
    
    // @IBOutlet weak var nameTextField: UITextField!
    
    func doDisplayProductDetail()
    {
        interactor?.doDisplayProductDetail()
    }
    
    func displayProductDetail(viewModel: ProductDetail.Item.ViewModel)
    {
        titleTxt.text = viewModel.name
        priceTxt.text = util.numberFormat(number: viewModel.price) 
        let dishName = viewModel.thumbnail
        if let dishImage = ImageCache[dishName]
        {
            previewImg.image = imageRatio(image: dishImage)
        }
        else
        {
            // Download image
            // We should perform this in a background thread
            Alamofire.request(Config().endpoint + viewModel.thumbnail).validate(statusCode: 200..<300)
                .responseImage
            { response in
                if let image = response.result.value
                {
                    // Store the commit date in to our cache
                    self.ImageCache[dishName] = image
                }
                else
                {
                    self.ImageCache[dishName] = self.defaultImage
                }
                DispatchQueue.main.async
                {
                    self.previewImg.image = self.imageRatio(image: self.ImageCache[dishName]!)
                }
            }
        }
    }
}
