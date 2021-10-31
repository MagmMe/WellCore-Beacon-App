//
//  ContentView.swift
//  Wellcore Beacon App
//
//  Created by Magme on 31/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    let gradinetBg = LinearGradient(gradient: Gradient(colors: [
        Color.purple,
        Color.red
    ]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack{
            gradinetBg.ignoresSafeArea()
            VStack{
                Text("Wellcore Beacon")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                Text("Just put beacon near to your IPhone.")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
                HStack{
                }
            }
            .foregroundColor(.white)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
