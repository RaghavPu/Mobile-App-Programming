//
//  ContentView.swift
//  Tip-Calculator
//
//  Created by Punnam, Raghav S on 11/2/21.
//

import SwiftUI

struct ContentView: View {
    @State private var bill: String = ""
    
    var body: some View {
        VStack {
            Text("Tip Calculator")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 50)
            HStack {
                Text("Bill Amount")
                TextField("$0.00", text: $bill)
            }.frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }.frame(width: 300, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
