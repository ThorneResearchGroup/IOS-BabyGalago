//
//  LoginView.swift
//  Galago
//
//  Created by Inhee Kim on 2022-08-15.
//

import SwiftUI
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let storedUsername = "A"
let storedPassword = "B"

struct LoginView: View {
    
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    @EnvironmentObject var apiService: APIService
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authDidFail: Bool = false
    @State var authDidSucceed: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                
                LogoImage()
                LogoText()
                    .padding(.bottom, 75)
                
                UsernameTextField(username: $username)
                PasswordSecureField(password: $password)
                
                if authDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                Button(action: {
                    Task {
                        await apiService.Login(username: self.username, password: self.password) { isSuccessful in
                            
                            if isSuccessful {
                                
                                self.authDidSucceed = true
                                self.authDidFail = false
                                
                                DispatchQueue.main.async {
                                    apiService.isLoggedin = true
                                }
                                
                            } else {
                                self.authDidFail = true
                            }
                        }
                    }
                }) {
                    LoginButtonContent()
                }
                
            }
            .padding()
            
            VStack {
                if authDidSucceed {
                    Text("Login succeeded!")
                        .frame(width: 250, height: 80)
                        .font(.headline)
                        .background(Color.green)
                        .cornerRadius(20.0)
                        .foregroundColor(.white)
                        
                }
            }
            .animation(.easeInOut(duration: 0.4), value: authDidSucceed)
        }
        .offset(y: -keyboardResponder.currentHeight * 0.2)
    }
}



struct LogoText: View {
    var body: some View {
        return Text("Galago")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom)
            .foregroundColor(Color("Font"))
    }
}

struct LogoImage: View {
    var body: some View {
        return Image("GalagoLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(50)
            
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color("Buttons"))
            .cornerRadius(15.0)
        
    }
}

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        return TextField("Username", text: $username)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .foregroundColor(.black)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String
    var body: some View {
        return SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .foregroundColor(.black)
            .padding(.bottom, 20)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(APIService())
            .environmentObject(PopupManager())
    }
}
