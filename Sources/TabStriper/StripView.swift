//
//  StripView.swift
//  
//
//  Created by giiiita on 2020/06/16.
//

import SwiftUI

@available(OSX 10.15, *)
public struct StripView: Identifiable {
    public var id: Int
    public var title: String
    public var view: AnyView
    
    public init(id: Int,
         title: String,
         view: AnyView) {
        self.id = id
        self.title = title
        self.view = view
    }
}
