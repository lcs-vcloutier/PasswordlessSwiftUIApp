//
//  PasswordlessSwiftUIAppApp.swift
//  PasswordlessSwiftUIApp
//
//  Created by Russell Gordon on 2020-11-04.
//

import SwiftUI
import Firebase

@main
struct PasswordlessSwiftUIAppApp: App {
    
    /// With the removal of 'AppDelegate', this is one of the ways to now configure Firebase.
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
