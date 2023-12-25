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
                                    Text("Name:")
                                        .bold()
                                    Text("\(painting.name)")
                                        .accessibilityLabel("Painting Name")
                                }
                                VStack(alignment: .leading){
                                    Text("Artist:")
                                    Text("\(painting.artist)")
                                        .accessibilityLabel("Artist Name")
                                }
                                VStack(alignment: .leading){
                                    Text("artistStory:")
                                    Text("\(painting.artistStory)")
                                        .accessibilityLabel("Artist Story")
                                }
                                VStack(alignment: .leading){
                                    Text("paintingStory:")
                                    Text("\(painting.paintingStory)")
                                        .accessibilityLabel("Painting Story")
                                }
                                VStack(alignment: .leading){
                                    Text("paintingDescription:")
                                    Text("\(painting.paintingDescription)")
                                        .accessibilityLabel("Painting Description")
                                }
                                
                                
                                
                          
                        }//if
                    
                }//vstack

            }//scroll
                
        }//vstack

    }
    
    
}
