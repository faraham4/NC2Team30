//
//  CameraPage.swift
//  Artector
//
//  Created by Farah Alamri on 07/06/1445 AH.
//

import SwiftUI

struct CameraPage: View {
    
        @State private var isShowingCamera = true
        @State private var capturedImage: UIImage?

        var body: some View {
            VStack {
                if let image = capturedImage {
                    
                    ContentView(capturedImage: image)
                        
                } else {
                    EmptyView()
                }
            }
            .sheet(isPresented: $isShowingCamera) {
                CameraView(capturedImage: $capturedImage)
            }
            .onAppear {
                isShowingCamera = true
            }
        }
    }

    struct CameraView: UIViewControllerRepresentable {
        @Binding var capturedImage: UIImage?

        func makeUIViewController(context: Context) -> UIImagePickerController {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.delegate = context.coordinator
            return imagePicker
        }//returns the chosen picture from gallery

        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

        func makeCoordinator() -> Coordinator {
            Coordinator(capturedImage: $capturedImage)
        }//returns an object of coordinator class

        final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
            @Binding var capturedImage: UIImage?

            init(capturedImage: Binding<UIImage?>) {
                _capturedImage = capturedImage
            }//constructor

            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
                if let image = info[.originalImage] as? UIImage {
                    capturedImage = image
                }
                picker.dismiss(animated: true)
            } // take the inmage to the showing page

            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true)
            }
        }
    }

#Preview {
    CameraPage()
}
