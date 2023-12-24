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
                    .accessibilityLabel("Displayed Image")
                    .accessibility(hint: Text("Displayed image for painting result"))
            } else {
                Text("No Image Available")
                    .accessibilityLabel("No Image Available")
                    .accessibility(hint: Text("No image is available for the painting result"))
            }
            
            if let painting = painting {
                Button(" More info "){
                    
                    showingCredits.toggle()
                }
                .padding(.top, 120.0)
                .accessibilityLabel("More Information Button")
                .accessibility(hint: Text("Tap to view more information about the painting"))
                
                
                
                .sheet(isPresented: $showingCredits) {
                    
                    
                    Button (action:{
                        buttonPressed()
                    }) {
                        Image("back") }
                    .padding(.trailing,290)
                    //.padding(.bottom,50.0)
                    .padding(.top,50)
                    .accessibilityLabel("Back Button")
                    .accessibility(hint: Text("Go back to the previous screen"))
                    
                    
                    
                    
                    
                    Button (action:{
                        buttonPressed()
                    }) {
                        Image("sound") }
                    .padding(.leading,290)
                    //.padding(.bottom,50.0)
                    // .lineSpacing(50)
                    .padding(.top,-25)
                    .accessibilityLabel("Sound Button")
                    .accessibility(hint: Text("Access additional sound options"))
                    
                    ScrollView {
                        Text("Name: \(painting.name)")
                            .accessibilityLabel("Painting Name")
                        
                        Text("Artist: \(painting.artist)")
                            .accessibilityLabel("Artist Name")
                        
                        Text("Artist Story: \(painting.artistStory)")
                            .accessibilityLabel("Artist Story")
                        
                        Text("Painting Story: \(painting.paintingStory)")
                            .accessibilityLabel("Painting Story")
                        
                        Text("Painting Description: \(painting.paintingDescription)")
                            .accessibilityLabel("Painting Description")
                    }
                    
                    .presentationDetents([ .large])
                }
                
                
            }
            
        }
    }
    
    
}
