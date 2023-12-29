import SwiftUI

struct BoardingView: View {
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                VStack (alignment: .leading){
                    Text("Artector")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 180)
                        .foregroundStyle(.black) .padding([.top, .leading])
                        .accessibilityLabel("Artector App")
                    
                    Text("Find out the story behind a famous painting with a tap!")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding([.leading, .bottom, .trailing])
                        .frame(width: 350)
                        .accessibilityLabel("Discover stories behind famous paintings")
                    
                }.padding(.vertical)
                
                ZStack{
                    Image("borderGroup").position(x: 195, y:190)
                    
                    Image("mona lisa").resizable().frame(width: 210, height: 250).mask(Rectangle().frame(width: 220, height: 220)).position(x:195, y: 190)
                        .accessibilityLabel("Mona Lisa Painting Image")
                    
                }.padding(.top)
                
                
                NavigationLink(
                    destination: CameraPage(),
                    label: {
                        Text("Get Started")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(
                                width: 250)
                            .background(Color.black)
                            .cornerRadius(10).position(x: 180, y:190)
                    }
                )
                .padding()
                .accessibilityLabel("Get Started")
                
            }
        }
    }
    
    
}



struct BoardingView_Previews: PreviewProvider {
    static var previews: some View {
        BoardingView()
    }
}
