//
//  ChoosingApp.swift
//  Choosing
//
//  Created by YANG YANG on 11/9/21.
//

import SwiftUI

@main
struct ChoosingApp: App {
    let choose = ChoosingViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: choose)
        }
    }
}
