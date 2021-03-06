//
//  ProductDetailInteractor.swift
//  OSC
//
//  Created by Dyan Galih on 08/07/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProductDetailBusinessLogic
{
    func doLikeProduct(request: ProductDetail.Like.Request)
    func doGetProductDetail()
}

protocol ProductDetailDataStore
{
    var productItem: Product.List.Item? { get set }
}

class ProductDetailInteractor: ProductDetailBusinessLogic, ProductDetailDataStore
{
    var productItem: Product.List.Item?
    var presenter: ProductDetailPresentationLogic?
    var worker: ProductDetailWorker?
    // var name: String = ""

    // MARK: Do something

    func doLikeProduct(request: ProductDetail.Like.Request)
    {
        worker = ProductDetailWorker()
        worker?.doLike(request: request, completion: {
            data, _ in
            if data != nil
            {
                self.presenter?.presentSuccessLike(message: data?.message ?? "You Liked This Product")
            }
            else
            {
                print("failed")
            }
        })
    }

    func doDisplayProductDetail(response: ProductDetail.DetailItem.Data)
    {
        presenter?.presentProductDetail(response: response)
    }

    func doGetProductDetail()
    {
        worker = ProductDetailWorker()
        let request = ProductDetail.DetailItem.Request(id: productItem!.id)
        worker?.doGetDetail(request: request, completion: {
            data, _ in
            if data != nil
            {
                self.doDisplayProductDetail(response: data!.data)
            }
            else
            {
                print("empty")
            }
        })
        print(productItem!)
    }
}
