//
//  ResultPage.swift
//  Artector
//
//  Created by Lujain Yhia on 11/06/1445 AH.


import SwiftUI

struct ResultPage: View {
    let painting: Painting?
    let image: UIImage?
   
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
                    
                }  //vstack
                
            }//scrollview
            
        }.padding(.all)//vstack
        
    }//end of body
    
}//end of struct
