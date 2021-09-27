//
//  ContentView.swift
//  App01-MiPerfil
//
//  Created by David Cantú Delgado on 20/09/21.
//

import SwiftUI

struct ProfileView: View {
    
    
    @State var name: String = "Sergio Lopez Urzaiz"
    @State var city: String = "Monterrey"
    @State var email: String = "A00827462@itesm.mx"
    @State var id: String = "A00827462"
    @State var date: Date = Date()
    @State var showData: Bool = false;
    @State var backgroundColor: Color = Color("Background")
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/mm/dd"
        return formatter
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                Text("Mi Perfil")
                    .modifier(TitleModifier())
                    .padding(.bottom,20)
                    .padding(.top,80)
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:300)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 6)
                            .foregroundColor(Color("Title"))
                    )
                    .padding(.vertical,60)
                
                TextView(text: name, image: "person.fill", font: "Black", size:24)
                TextView(text: city, image: "house.fill", font: "Regular", size:24)
                TextView(text: email, image: "envelope.fill", font: "Regular", size:24)
                TextView(text: id, image: "qrcode", font: "Regular", size:24)
                HStack {
                    Image(systemName: "calendar")
                    Text("\(dateFormat.string(from: date))").font(.Gluten(style: "Regular", size: 24)).foregroundColor(Color("Font"))
                }
                Button(action: {
                    showData.toggle()
                }, label: {
                    Text("Editar Datos").font(.Gluten(style: "Bold", size: 40)).foregroundColor(.white).padding().background(Color.green).cornerRadius(20)
                })
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showData) {
            ProfileDataView(name: $name, date:$date, backgroundColor: $backgroundColor)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
                .preferredColorScheme(.light)
            ProfileView()
                .preferredColorScheme(.dark)
        }
    }
}
