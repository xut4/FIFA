//{
//"email": "910325.nicole@gmail.com",
//"password": "Nn910325"
//}
import SwiftUI

struct LoginView: View {
    func configureBackground() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(Color("fiia"))
        UINavigationBar.appearance().standardAppearance = barAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @Binding var showflag:Int
    
    var body: some View {
        NavigationView {
            VStack{
                Text("YourEmail")
                TextField("", text: $email)
                    .frame(width: 300.0, height: 50.0)
                    .overlay(textFieldBorder)
                Text("Password")
                TextField("", text: $password)
                    .frame(width: 300.0, height: 50.0)
                    .overlay(textFieldBorder)
                Button {
                    Login.shared.fetchFavorites(Email:email,Password:password) { result in
                        switch result {
                        case .success(let user):
                            self.showflag=2
                            print(user)
                        case .failure(let error):
                            showAlert=true
                            print(error)
                        }
                    }
                } label: {
                    Text("login")
                        .fontWeight(.bold)
                        .foregroundColor(Color("fiia"))
                        .padding(.bottom, 50.0)
                }.alert(isPresented: $showAlert) { () -> Alert in
                    return Alert(title: Text("錯誤"),
                                 message:Text(LoginError.message)
                                 , dismissButton: .default(Text("OK"))
                    )
                }
                NavigationLink(
                    destination: SignView(showflag: $showflag),
                    label: {
                        Text("I don't have account,Let's ")
                            .foregroundColor(Color("fiia"))+Text("sign up").bold().italic()
                    }).navigationTitle("登入").onAppear(perform: {configureBackground()})
            }
        }
        
    }
    var textFieldBorder: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color("fiia"), lineWidth: 1)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showflag: .constant(0))
    }
}
