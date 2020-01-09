//
//  Repository.swift
//  CombineSwiftUISample
//
//  Created by 中山 陽介 on 2020/01/09.
//  Copyright © 2020 Yosuke Nakayama. All rights reserved.
//

import Foundation
import Combine
 
protocol CompanyRepository {
    func loadEmployees() -> AnyPublisher<Employee, Error>
}
 
class CompanyRepositoryImpl: CompanyRepository {
    func loadEmployees() -> AnyPublisher<Employee, Error> {
        let urlStr = "https://postman-echo.com/get?name=Taro"
        let result = URLSession.shared.dataTaskPublisher(for: URL(string: urlStr)!)
            .tryMap({ data, response -> Data in
                guard let httpRes = response as? HTTPURLResponse else {
                    throw APIError(description: "http response not found")
                }
                if (200..<300).contains(httpRes.statusCode) == false {
                    throw APIError(description: "Bad Http Status Code")
                }
                return data
            })
            .decode(type: Employee.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
 
        return result
    }
}
