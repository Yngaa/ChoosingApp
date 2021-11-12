//
//  Choosing.swift
//  Choosing
//
//  Created by YANG YANG on 11/10/21.
//

import Foundation

struct Choosing<String> {
   private(set) var contents: Array<Content>
    
    func choose(_ content: Content) {
        
    }
    
    init() {
        contents = Array<Content>()
            //
    }
    
    struct Content {
        var option: String
    }
}
