//
//  AlertItem.swift
//  PasswordlessSwiftUIApp
//
//  Created by Russell Gordon on 2020-11-04.
//

import SwiftUI
import Firebase

/// Model object for an `Alert` view.
struct AlertItem: Identifiable {    // *
  var id = UUID()
  var title: String
  var message: String
}
