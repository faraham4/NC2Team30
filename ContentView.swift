//
//  ContentView.swift
//  Artector
//
//  Created by Lujain Yhia on 11/06/1445 AH.
//

import SwiftUI
import CoreML
import CoreImage

struct ContentView: View {
    @State private var error: Bool = false
    @State private var predictedImage: UIImage?
    let labels = ["monalisa", "theraftofthemedusa", "thestarrynight", "theweddingatcana", "womenofalgiers"]
    @State private var classificationLabel = ""
    @State private var selectedPainting: Painting?
    
    
    
     var capturedImage: UIImage

    let model: MyImageClassifier = {
        do {
            let config = MLModelConfiguration()
            config.computeUnits = .cpuOnly
            return try MyImageClassifier(configuration: config)
        } catch {
            print(error)
            fatalError("")
        }
    }()

    var body: some View {

            VStack (spacing: 20){
                // image is here
                Image(uiImage: capturedImage)
                    .resizable()
                    .frame(width: 299, height: 299)
                    .accessibilityLabel("Captured Image")
                    .accessibility(hint: Text("Image for identification"))
                
                Spacer()

                Button("Identify") {
                    classifyImage(capturedImage: capturedImage)
                }
                .padding()
                .frame(width: 250)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(10)
                .accessibilityLabel("Identify Image")
                .accessibility(hint: Text("Tap to start image Identification"))

                NavigationLink(destination: ResultPage(painting: selectedPainting, image: predictedImage)) {
                    Text("Show Painting Info")
                        .padding()
                        .frame(width: 250)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2) // Apply border color and width
                        )
                }
                .padding()
                .accessibilityLabel("Show Painting Info")
                .accessibility(hint: Text("Navigate to painting info page"))

                Text(classificationLabel)
                    .padding()
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .accessibilityLabel("Image Identification Result")
                    .accessibility(hint: Text("Result of the identification"))
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        
                        }
                    }
            }
            .padding()
            .navigationBarTitle("Image Identification", displayMode: .inline)
        
    }

    private func classifyImage(capturedImage: UIImage) {
        do {
             /*let image = capturedImage,*/ //UIImage(named: "Image")
            guard let ciImage = CIImage(image: capturedImage),
                  let pixelBuffer = capturedImage.pixelBuffer() else {
                return
            }

            let input = MyImageClassifierInput(image: pixelBuffer)
            let prediction = try model.prediction(input: input)
            print("✓ Prediction done")

            // Update the classificationLabel with the predicted classLabel
            self.classificationLabel = "✔️✔️✔️"//success message

            // Find the corresponding Painting based on the predicted label
            if let matchedPainting = paintings[prediction.target] {
                self.selectedPainting = matchedPainting
                self.predictedImage = capturedImage
            } else {
                // Reset selectedPainting and predictedImage if no match is found
                self.selectedPainting = nil
                self.predictedImage = nil
            }

        } catch {
            // Handle errors
            self.error = true
            print("Something went wrong!\n\(error.localizedDescription)\n\nMore Info:\n\(error)")

            // Update the classificationLabel with an error message
            self.classificationLabel = "Image Identification Unsuccessful"
        }
    }


}


extension UIImage {
    func pixelBuffer() -> CVPixelBuffer? {
        guard let ciImage = CIImage(image: self) else {
            return nil
        }

        var pixelBuffer: CVPixelBuffer?
        let options: [CIImageOption: Any] = [
            .applyOrientationProperty: true,
            .colorSpace: CGColorSpaceCreateDeviceRGB()
        ]

        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         Int(ciImage.extent.width),
                                         Int(ciImage.extent.height),
                                         kCVPixelFormatType_32ARGB,
                                         options as CFDictionary,
                                         &pixelBuffer)

        guard status == kCVReturnSuccess, let buffer = pixelBuffer else {
            return nil
        }

        let context = CIContext()
        context.render(ciImage, to: buffer)

        return buffer
    }
}
//#Preview {
//    ContentView()
//}









