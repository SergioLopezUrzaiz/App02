//
//  DataView.swift
//  App02-MiPerfil
//
//  Created by user194222 on 9/23/21.
//

import SwiftUI

struct DataView: View {
    
    @Binding var counter: Int
    @Binding var color: Bool
    var body: some View {
        ZStack {
            color ? Color.blue : Color.purple
            VStack {
                Text("Counter: \(counter)").font(.Gluten(style: "Bold", size: 40))
                Button(action: {
                    counter += 1
                }, label: {
                    Image(systemName: "plus.circle.fill").font(.largeTitle).foregroundColor(.green)
                })
                Button(action: {
                    color.toggle()
                }, label: {
                    Text("Background").font(.Gluten(style: "Bold", size: 40)).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 20)).background(color ? Color.purple : Color.blue)
                })
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct DataView_Previews: PreviewProvider {
    
    @State static var counter: Int = 0
    @State static var color: Bool = false
    static var previews: some View {
        DataView(counter: $counter, color: $color)
    }
}
