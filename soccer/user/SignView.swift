//
//  LoginView.swift
//  soccer
//
//  Created by User05 on 2022/12/21.
//
import SwiftUI
struct SignView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var showAlert = false
    @Binding var showflag:Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("YourName")
            TextField("Peter Pan", text: $name)
                .frame(width: 300.0, height: 50.0)
                .overlay(textFieldBorder)
            Text("YourEmail")
            TextField("Q@gmail.com", text: $email)
                .frame(width: 300.0, height: 50.0)
                .overlay(textFieldBorder)
            Text("Password")
            TextField("minimum allowed length (8)", text: $password)
                .frame(width: 300.0, height: 50.0)
                .overlay(textFieldBorder)
            Text("passwordConfirm")
            TextField("minimum allowed length (8)", text: $passwordConfirm)
                .frame(width: 300.0, height: 50.0)
                .overlay(textFieldBorder)
            Button {
                Sign.shared.fetchFavorites(Name:name,Email:email,Password:password,PasswordConfirm:passwordConfirm) { result in
                    switch result {
                    case .success(let user):
                        self.showflag=2
                        print(user)
                    case .failure(let error):
                        showAlert = true
                        print(error)
                    }
                }
            } label: {
                Text("sign")
                    .font(.title3)
                    .foregroundColor(Color("fiia"))
            }.padding(.leading, 250.0).alert(isPresented: $showAlert) { () -> Alert in
                return Alert(title: Text("錯誤"),
                             message:Text(SignError.message)
                             , dismissButton: .default(Text("OK"))
                )
            }
        }
        .navigationTitle("註冊")
        
    }
    var textFieldBorder: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color("fiia"), lineWidth: 1)
    }
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView(showflag: .constant(1))
    }
}
