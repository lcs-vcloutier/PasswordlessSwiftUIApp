//
//  LeaveRequestView.swift
//  PasswordlessSwiftUIApp
//
//  Created by Cloutier, Vincent on 2020-11-05.
//

import SwiftUI

struct LeaveRequestView: View {
    let typesOfLeave = ["Lakefield", "Bridge", "Peterborough"]
        @State private var typeOfLeave : Int = 0
        @State private var numberOfPeople: Int = 0
        @State private var time: Int = 0
        @State private var name = ["", "", ""]
    
    var body: some View {
        VStack(alignment: .leading) {
    
            
            Form {
                        Section(header: Text("Type of Leave")) {
                            Picker("Type Of Leave", selection: $typeOfLeave) {
                                Text("Lakefield").tag(0)
                                Text("Bridge").tag(1)
                                Text("Peterborough").tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
        
            CustomStyledButton(title: "Go to \(typesOfLeave[typeOfLeave])", action: {})    // 2
               // .disabled(email.isEmpty)
            
           // Spacer()
        }
        }
        //.padding()
        .navigationBarTitle("Leave Request")
    }
}

struct LeaveRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveRequestView()
    }
}
