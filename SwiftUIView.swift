//
//  SwiftUIView.swift
//  Artector
//
//  Created by Farah Alamri on 12/06/1445 AH.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var isSoundEnabled = false
    var body: some View {
        VStack(spacing: 15){
            //image
            //painting name
            //artist name
            
            
            //about the painting
            
            //about the artist
            
            //painting description
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                                   Button(action: {
                                       // Perform action when sound button is tapped
                                       isSoundEnabled.toggle()
                                   }) {
                                       Image(systemName: isSoundEnabled ? "speaker.fill" : "speaker.slash.fill")
                                           .foregroundColor(isSoundEnabled ? .green : .red)
                                           .imageScale(.large)
                                           .accessibility(label: Text("Sound"))
                                   }
                               }
                           }
        }
    }


#Preview {
    SwiftUIView()
}
