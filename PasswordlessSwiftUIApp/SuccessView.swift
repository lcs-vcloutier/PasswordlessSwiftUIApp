//
//  SuccessView.swift
//  PasswordlessSwiftUIApp
//
//  Created by Russell Gordon on 2020-11-04.
//

import SwiftUI

/// Displayed when a user successfuly logs in.
struct SuccessView: View {
    
    let email: String
    
    var body: some View {
        
        /// The first view in this `ZStack` is a `Color` view that expands
        /// to set the background color of the `SucessView`.
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Group {
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(email.lowercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text("Well done, user.")
                }
                .padding(.leading)
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.5)
            }
            .foregroundColor(.white)
        }
    }
}
