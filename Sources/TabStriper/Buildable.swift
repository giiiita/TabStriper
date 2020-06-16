//
//  Buildable.swift
//  
//
//  Created by giiiita on 2020/06/16.
//

protocol Buildable { }

extension Buildable {
    func mutating<T>(keyPath: WritableKeyPath<Self, T>, value: T) -> Self {
        var newSelf = self
        newSelf[keyPath: keyPath] = value
        return newSelf
    }
}
