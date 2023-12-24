//
//  ResultPage.swift
//  Artector
//
//  Created by Lujain Yhia on 11/06/1445 AH.
//

import SwiftUI

struct ResultPage: View {
    let painting: Painting?
    let image: UIImage?
    @State private var showingCredits = false
    
    func buttonPressed() {
        print("button pressed") }
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("No Image Available")
            }
            
            if let painting = painting {
                Button(" More info "){
                    
                    showingCredits.toggle()
                }
                .padding(.top, 120.0)
                //.offset(x:0, y:300)
                
                
                
                .sheet(isPresented: $showingCredits) {
                    
                    
                    Button (action:{
                        buttonPressed()
                    }) {
                        Image("back") }
                    .padding(.trailing,290)
                    //.padding(.bottom,50.0)
                    .padding(.top,50)
                    
                    
                    
                    
                    
                    Button (action:{
                        buttonPressed()
                    }) {
                        Image("sound") }
                    .padding(.leading,290)
                    //.padding(.bottom,50.0)
                    // .lineSpacing(50)
                    .padding(.top,-25)
                    
                    ScrollView {
                        Text("Name: \(painting.name)")
                        Text("Artist: \(painting.artist)")
                        Text("artistStory: \(painting.artistStory)")
                        Text("paintingStory: \(painting.paintingStory)")
                        Text("paintingDescription: \(painting.paintingDescription)")
                        
                    }
                    
                    .presentationDetents([ .large])
                }
                
                
            }
            
        }
    }
    
    
}
