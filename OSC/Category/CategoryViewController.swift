//
//  CategoryViewController.swift
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

protocol CategoryDisplayLogic: class {
    func displayCategoryList(viewModel: Category.List.ViewModel)
    func displayAlert(title: String, message: String)
}

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CategoryDisplayLogic {
    var interactor: CategoryBusinessLogic?
    var router: (NSObjectProtocol & CategoryRoutingLogic & CategoryDataPassing)?
    var categoryList: [Category.List.Item] = []

    @IBOutlet var categoryTableView: UITableView!

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = CategoryInteractor()
        let presenter = CategoryPresenter()
        let router = CategoryRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        doGetCategoryList()
    }

    // MARK: Do something

    // @IBOutlet weak var nameTextField: UITextField!

    func doGetCategoryList() {
        let request = Category.List.Request()
        interactor?.doGetCategoryList(request: request)
    }

    func displayCategoryList(viewModel: Category.List.ViewModel) {
        categoryList = viewModel.data.list
        categoryTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = categoryList[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell")

        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "CategoryTableViewCell")
        }

        cell?.textLabel?.text = list.category_name
        return cell!
    }

    func displayAlert(title: String, message: String) {
        showAlert(title: title, message: message, handler: nil)
    }
}
