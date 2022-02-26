//
//  Router.swift
//  viper
//
//  Created by Muhammad Faisal Imran Khan on 2022-02-25.
//

import Foundation

import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
    
    
}

class UserRouter: AnyRouter {
    var entry: EntryPoint? = nil
    
    static func start() -> AnyRouter {
        var router = UserRouter()
        
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
