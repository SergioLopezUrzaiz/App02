//
//  ProfileDataView.swift
//  App02-MiPerfil
//
//  Created by user194222 on 9/23/21.
//

import SwiftUI

struct ProfileDataView: View {
    
    @Binding var name: String
    @Binding var date: Date
    @Binding var backgroundColor: Color
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/mm/dd"
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Nombre:")
            TextField("Nombre", text: $name)
            Text("Fecha de nacimiento")
            DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                Text("\(dateFormat.string(from: date))")
            }
            ColorPicker("Color del fondo", selection: $backgroundColor)
        }
    }
}

struct ProfileDataView_Previews: PreviewProvider {
    
    @State static var name: String = "Sergio"
    @State static var date: Date = Date()
    @State static var backgroundColor: Color = Color("Background")
    
    static var previews: some View {
        ProfileDataView(name: $name, date: $date, backgroundColor: $backgroundColor)
    }
}
