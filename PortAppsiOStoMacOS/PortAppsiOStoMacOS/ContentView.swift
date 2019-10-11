//
//  ContentView.swift
//  PortAppsiOStoMacOS
//
//  Created by Vishwanath Kota on 10/10/2019.
//  Copyright © 2019 Vishwanath Kota. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            //Invoking MapView.swift class
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            //Invoking CircleView.swift class
            CircleImage().offset(y: -130).padding(.bottom, -130)
                
            //Textview
            VStack(alignment: .leading) {
                Text("Welcome to the new world of Swift UI")
                    .font(.title)
                    .fontWeight(.light)
                HStack {
                    Text("Racelogic")
                        .font(.subheadline)
                    Spacer()
                    Text("Buckinghamshire")
                        .font(.subheadline)
                }
            }.padding()
             Spacer()
        }
       
    }
}
//#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//#endif
