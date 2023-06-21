//
//  UberSwiftUIApp.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 20/6/23.
//

import SwiftUI

@main
struct UberSwiftUIApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
