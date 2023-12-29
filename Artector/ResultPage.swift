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
            ScrollView{
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
                        Text("Name: \(painting.name)")
                            .accessibilityLabel("Painting Name")
                        
                        Text("Artist: \(painting.artist)")
                            .accessibilityLabel("Artist Name")
                        
                        HStack(alignment: .top){
                            Text("Artist Story: \(painting.artistStory)")
                                .accessibilityLabel("Artist Story")
                            VStack(alignment: .trailing) {
                                Button(action: {
                                    //add sound code
                                }, label: {
                                    Image(systemName: "speaker")
                                })
                            }.padding()
                            }
                        
                        Text("Painting Story: \(painting.paintingStory)")
                            .accessibilityLabel("Painting Story")
                        
                        Text("Painting Description: \(painting.paintingDescription)")
                            .accessibilityLabel("Painting Description")
                    }
                    
                }  //vstack
                
            }//scrollview
            
        }.padding(.all)//vstack
        
    }//end of body
    
}//end of struct
