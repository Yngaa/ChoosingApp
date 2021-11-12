//
//  ChoosingViewModel.swift
//  Choosing
//
//  Created by YANG YANG on 11/10/21.
//

import SwiftUI

class ChoosingViewModel: ObservableObject {
    
   @Published var chooseOptions = ["answers", "hello", "where", "lunch", "dinner", "breakfast", "eugine", "portland", "china"]
    
    
    private var model: Choosing<String> = Choosing()
    
    
    var contents: Array<Choosing<String>.Content> {
        return model.contents
    }
}
