//
//  ContentView.swift
//  PasswordlessSwiftUIApp
//
//  Created by Russell Gordon on 2020-11-04.
//

import SwiftUI
import Firebase

//struct hasLoggedInItem: Identifiable, Codable {
//    var id: ObjectIdentifier
//
//    let hasLoggedInBool: Bool
//}
//
//class Expenses: ObservableObject {
//    @Published var items: [hasLoggedInItem] {
//        didSet {
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    init() {
//        if let items = UserDefaults.standard.data(forKey: "Items") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode([hasLoggedInItem].self, from: items) {
//                self.items = decoded
//                return
//            }
//        }
//
//        self.items = []
//    }
//}

struct ContentView: View {
    var hasSignedIn = false
    @State private var email: String = ""
    @State private var isPresentingSheet = false
    @State var msg = false
    @State var retrieved = ""
    
    
    // This property will cause an alert view to display when it has a non-nil value
    @State private var alertItem: AlertItem? = nil

    var body: some View {
        if msg == false {
        NavigationView {
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text("Input your LCS email below, then follow the emailed link.")
                        .padding(.bottom, 20)
                    
                    CustomStyledTextField(
                        text: $email, placeholder: "LCS Email", symbolName: "person.circle.fill"    // 1
                    )
                    //
                    CustomStyledButton(title: "Send Sign In Link", action: sendSignInLink)    // 2
                        .disabled(email.isEmpty)
                    
                    Spacer()
                }
                .padding()
                .navigationBarTitle("LCS Leave")
                
            }
            
        }
        .onOpenURL { url in   // 2
            let link = url.absoluteString
            if Auth.auth().isSignIn(withEmailLink: link) {    // 3
                passwordlessSignIn(email: email, link: link) { result in    // 4
                    switch result {
                    case let .success(user):
                        isPresentingSheet = user?.isEmailVerified ?? false
                    case let .failure(error):
                        isPresentingSheet = false
                        alertItem = AlertItem(
                            title: "An authentication error occurred.",
                            message: error.localizedDescription
                        )
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentingSheet) {   // 5
            SuccessView(email: email)
        }
        .alert(item: $alertItem) { alert -> Alert in    // *
            Alert(
                title: Text(alert.title),
                message: Text(alert.message)
            )
        }
        } else if msg == true { Text("go")}
    }
    private func sendSignInLink() {
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(
            string: "https://russellgordon.page.link/zXbp"    // 1
        )
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
        
        Auth.auth().sendSignInLink(toEmail: email,
                                   actionCodeSettings: actionCodeSettings) { error in   // 2
            if let error = error {
                alertItem = AlertItem(
                    title: "The sign in link could not be sent.",
                    message: error.localizedDescription
                )
            }
            else if error == nil {
                alertItem = AlertItem(
                    title: "The sign-in link was sent to \(email)", message:""
                )
               
            }
        }
    }
    
    private func passwordlessSignIn(email: String, link: String,
                                    completion: @escaping (Result<User?, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, link: link) { result, error in
            if let error = error {
                print("ⓧ Authentication error: \(error.localizedDescription).")
                completion(.failure(error))
            } else {
                print("✔ Authentication was successful.")
                completion(.success(result?.user))
                self.msg = true
                UserDefaults.standard.set(self.msg, forKey: "Bool")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

