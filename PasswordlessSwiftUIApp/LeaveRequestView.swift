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
    @State private var time: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
                    Picker("Type Of Leave", selection: $typeOfLeave) {
                        Text("Lakefield").tag(0)
                        Text("Bridge").tag(1)
                        Text("Peterborough").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                                 
                
                CustomStyledButton(title: "Go to \(typesOfLeave[typeOfLeave])", action: {
                    // set time of leave do database logic etc. & go to during leave view
                    
                })
            Spacer()
        }
        .padding()
        .navigationBarTitle("Leave Request")
    }
}

struct LeaveRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveRequestView()
    }
}
