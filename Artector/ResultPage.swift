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
        VStack(spacing: 20){
            ScrollView {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .accessibilityLabel("Displayed Image")
                    .accessibility(hint: Text("Displayed image for painting result"))
                
            } else {
                Text("No Image Available")
                    .font(.headline)
                    .foregroundColor(.red)
                    .accessibilityLabel("No Image Available")
                    .accessibility(hint: Text("No image is available for the painting result"))

            }
            
                VStack(alignment: .leading){
                    if let painting = painting {

                        VStack(alignment: .leading){
                            //  Text("Name:")
                            Text("\(painting.name)")
                                .accessibilityLabel("Painting Name")
                                .bold()
                                .font(.title)
                        }.padding()
                        
                                VStack(alignment: .leading){
                                        
                                    Text("by \(painting.artist)")
                                        .accessibilityLabel("Artist Name")
                                        .font(.title3)
                                }.padding()
                        
                                VStack(alignment: .leading, spacing: 20){
                                    Text("Artist Story:")
                                        .bold()
                                        .font(.title3)
                                    Text("\(painting.artistStory)")
                                        .accessibilityLabel("Artist Story")
                                        .font(.body)
                                }.padding()
                        
                                VStack(alignment: .leading, spacing: 20){
                                    Text("Painting Story:")
                                        .bold()
                                        .font(.title3)
                                    Text("\(painting.paintingStory)")
                                        .accessibilityLabel("Painting Story")
                                        .font(.body)
                                }.padding()
                        
                                VStack(alignment: .leading, spacing: 20){
                                    Text("Painting Description:")
                                        .bold()
                                        .font(.title3)
                                    Text("\(painting.paintingDescription)")
                                        .accessibilityLabel("Painting Description")
                                        .font(.body)
                                }.padding()
                                
                                
                                
                          
                        }//if
                    
                }//vstack

            }//scroll
                
        }//vstack

    }
    
    
}
