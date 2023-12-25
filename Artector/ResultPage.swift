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
            
            ScrollView {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("No Image Available")
            }
            
            
            
            
            if let painting = painting {
                VStack {
                    
                        VStack {
                            Text("Name:")
                            Text("\(painting.name)")
                        }
                        VStack {
                            Text("Artist:")
                            Text("\(painting.artist)")
                        }
                        VStack {
                            Text("artistStory:")
                            Text("\(painting.artistStory)")
                        }
                        VStack {
                            Text("paintingStory:")
                            Text("\(painting.paintingStory)")
                        }
                        VStack {
                            Text("paintingDescription:")
                            Text("\(painting.paintingDescription)")
                        }
                        
                        
                        
                    }
                }
            }
                
        }
    }
    
    
}
