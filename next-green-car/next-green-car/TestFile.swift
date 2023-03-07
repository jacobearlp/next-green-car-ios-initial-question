//
//  TestFile.swift
//  next-green-car
//
//  Created by Jacob on 3/7/23.
//

import Foundation

struct Item {
    var id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

protocol APIDelegate {
    func fetchItems(completion: (Result<[Item], Error>) -> Void)
}

class API: APIDelegate {
    func fetchItems(completion: (Result<[Item], Error>) -> Void) {
        // Gets items from some hosted API
    }
}

class ClassToTest {
    private(set) var stateList = [String]()
    private let api: APIDelegate

    init(api: APIDelegate) {
        self.api = api
    }

    func functionToTest() {
        stateList.append("Loading")

        api.fetchItems { result in
            switch result {
            case .success:
                stateList.append("Success")
                break
            case .failure:
                stateList.append("Failed")
                break
            }
        }
    }
}

class MockAPI: APIDelegate {
    private let failingTest: Bool

    init(failingTest: Bool = false) {
        self.failingTest = failingTest
    }

    func fetchItems(completion: (Result<[Item], Error>) -> Void) {
        if failingTest {
            completion(.failure(CustomError.notFound))
        } else {
            completion(.success([]))
        }
    }
}

enum CustomError: Error {
    case unAuthorized
    case notFound
}
