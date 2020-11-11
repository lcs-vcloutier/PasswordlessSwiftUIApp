//
//  DuringLeaveView.swift
//  PasswordlessSwiftUIApp
//
//  Created by Cloutier, Vincent on 2020-11-11.
//

import SwiftUI

struct DuringLeaveView: View {
    var body: some View {
        VStack(alignment: .leading) {
                CustomStyledButton(title: "Check In", action: {
                    // send the location back to database with sign in time if valid & return to leave request view
                })
            Spacer()
        }
        .padding()
        .navigationBarTitle("Check In")
    }
}

struct DuringLeaveView_Previews: PreviewProvider {
    static var previews: some View {
        DuringLeaveView()
    }
}
