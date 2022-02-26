//
//  interactor.swift
//  viper
//
//  Created by Muhammad Faisal Imran Khan on 2022-02-25.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func getUsers()
}


class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                self.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self.presenter?.interactorDidFetchUsers(with: .success(entities))
                
            }
            catch {
                self.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
            }

        }
        
        task.resume()
        
        
    }
}
