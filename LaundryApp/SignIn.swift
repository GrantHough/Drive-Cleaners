//
//  SignIn.swift
//  LaundryApp
//
//  Created by Grant Hough on 1/15/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    @Published var showing = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
                print("Signed In")
            }
            
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
    
    func resetPassword(email: String, resetCompletion: @escaping (Result<Bool,Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            
            if error != nil {
                
            }
            
            if let error = error {
                resetCompletion(.failure(error))
            } else {
                resetCompletion(.success(true))
            }
        })
    }
    
}
struct SignIn: View {
    
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottomLeading)
                
                VStack(spacing: 0) {
                    
                    Text("Sign In")
                        .font(.custom("Avenir", size: UIScreen.main.bounds.width * 0.1))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(5)
                        .shadow(radius: 10)
                    
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45, alignment: .center)
                        .cornerRadius(40, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 8)
                        .padding()
                    
                    TextField("Email Address", text: $email)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.04)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .padding(.top, 3)
                        .foregroundColor(Color(.white).opacity(0.65))
                        .background(Color(.blue).opacity(0.08))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(1), radius: 12, x: 0, y: 12)
                        .padding(.top)
                    
                    SecureField("Password", text: $password)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.04)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .foregroundColor(Color(.white).opacity(0.65))
                        .background(Color(.blue).opacity(0.08))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(1), radius: 12, x: 0, y: 12)
                        .padding()
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            
                            return()
                            
                        }
                        
                        viewModel.signIn(email: email, password: password)
                        
                    }, label: {
                        HStack {
                         
                            Text("Sign In")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.07)
                        .background(Color.white)
                        .cornerRadius(25, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .opacity(0.98)
                        .shadow(radius: 10)
                    })
                    .padding()
                    
                }
                
            }
            
            .ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
