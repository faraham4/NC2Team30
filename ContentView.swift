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
    @State private var classificationLabel = "Default Classification"
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
        NavigationView {
            VStack {
                // image is here
                Image(uiImage: capturedImage)
                    .resizable()
                    .frame(width: 299, height: 299)

                Button("recognize") {
                    classifyImage(capturedImage: capturedImage)
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.darkGray)

                NavigationLink(destination: ResultPage(painting: selectedPainting, image: predictedImage)) {
                    Text("Show Result")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.black)
                }
                .padding()

                Text(classificationLabel)
                    .padding()
                    .font(.body)
            }
           // .navigationTitle("Image Classification")
        }
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
            self.classificationLabel = "Prediction: \(prediction.target)"

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
            self.classificationLabel = "Error making prediction"
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









