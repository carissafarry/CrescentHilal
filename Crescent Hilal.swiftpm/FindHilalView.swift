//
//  FindHilalView.swift
//  Crescent Hilal
//
//  Created by Carissa Farry Hilmi Az Zahra on 18/04/23.
//

import SwiftUI
//import AVFoundation


struct FindHilalView: View {
    @State var isFindHalal: Bool
    @State var contentsView: AnyView?
    
    @State var showImage = true
    @State private var selectedMoon: String?
    @State private var showMessage = false
    
    @State private var isCloudVisible = [true, true, true, true, true]
    @State private var cloudOffsets = [CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero, CGSize.zero]
    
//    @State private var value: Double = 0.5
//    @State private var color: Color = .red
    
    let moon = "Hilal"
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    
    init (isFindHalal: Bool, contents: AnyView? = nil) {
        self.isFindHalal = isFindHalal
        
        if contents != nil {
            self.contentsView = contents
        }
        
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hex: "323E65"))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
            VStack {
                
                if isFindHalal {
                    findHilal()
                } else {
                    if self.contentsView != nil {
                        contentsView
                    }
                }
                
                environment()
            }
        }
    }
    
    @ViewBuilder
    func environment() -> some View {
        ZStack(alignment: .bottom) {
            Image("SunsetLight2")
                .resizable()
                .scaledToFill()
                .offset(y: screenHeight/11)
            
            Image("Beach-4")
                .resizable()
                .scaledToFit()
                .padding(.bottom, -27)

            GeometryReader { geo in
                Image("Creatures3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 1)
                    .offset(y: geo.size.height * 0.86)
            }
        }
        .overlay(
            GeometryReader { geo in
                if let imageSize = getImageSize(imageName: "Binocular2") {
                    Image("Binocular2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.28)
                        .offset(
                            x: (geo.size.width/2) - (imageSize.width/4),
                            y: geo.size.height * 0.64
                        )
                }
            }
        )
    }
    
    @ViewBuilder
    func findHilal() -> some View {
        ZStack(alignment: .top) {
            Image("FullStars")
                .resizable()
                .scaledToFit()
                .overlay(
                    ZStack(alignment: .top) {
                        Text("To look for the new moon, you have to be in a wide environment with a clear sky from the clouds, like a beach or a mountain. Clear the sky from the clouds by tapping on the clouds.")
                            .font(.system(.title2, design: .serif))
                            .foregroundColor(.white)
                            .padding(.horizontal, 60)
                            .background(.black)
                    }
                )
            
            GeometryReader { geo in
                ZStack {
                    Button {
                        showMessage = true
                    } label: {
                        Image(moon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                    }
                    .sheet(isPresented: $showMessage) {
                        
                            MessageView()
//                        }
//                        .navigationViewStyle(.stack)
                    }
                    .position(
                        x: CGFloat.random(in: 0..<geo.size.width),
                        y: CGFloat.random(in: 0..<geo.size.height+10)
                    )
                }
            }
            
            removableCloud()
        }
    }
    
    
    func removableCloud() -> some View {
        return
            VStack {
                ForEach(Array(0..<isCloudVisible.filter({$0}).count), id: \.self) { index in
                    if isCloudVisible[index] {
                        GeometryReader { geo in
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    isCloudVisible[index] = false
                                }
                            }, label: {
                                Image("Cloud")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.25)
                                    .offset(cloudOffsets[index])
                                
                                    // TODO: Add Drag
//                                    .gesture(
//                                        DragGesture()
//                                            .onChanged { value in
//                                                cloudOffsets[index] = value.translation
//                                            }
//                                    )
//                                    .contentShape(Rectangle().offset(
//                                        x: -geo.frame(in: .global).minX/2,
//                                        y: -geo.frame(in: .global).minY/2))
//                                    .background(.red)
                            })
                            .offset(cloudOffsets[index])
                            .position(x: CGFloat.random(in: 0..<geo.size.width),
                                      y: CGFloat.random(in: 0..<geo.size.height+30))
                        }
                    }
                }
            }
    }
    
    func getImageSize(imageName: String) -> CGSize? {
        guard let image = UIImage(named: imageName) else {
            fatalError("Could not load image")
        }
        
        return image.size
    }
    
//    func setupAudioPlayer() {
//        let url = Bundle.main.url(forResource: "mysong", withExtension: "mp3")
//        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
//    }
}

struct MessageView: View {
    @State private var navigateToMainMenu = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if #available(iOS 16.0, *) {
                    Rectangle()
                        .fill(Gradient(colors: [Color(hex: "323E65"), Color(hex: "805E88")]))
                } else {
                    // Fallback on earlier versions
                    Rectangle()
                        .fill(Color(hex: "323E65"))
                }
                
                Image("BtnBg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                
                VStack(alignment: .center) {
                    Text("Congrats you found the Hilal! \n\n")
                        .font(.system(.title2, design: .serif))
                    
                    Text("Because the new moon is visible, tomorrow is the first day of the next month!")
                        .font(.system(.title2, design: .serif))
                        .frame(width: UIScreen.main.bounds.width * 0.557)
                }
            }
            
        }
    }
}

struct FindHilalView_Previews: PreviewProvider {
    static var previews: some View {
        FindHilalView(isFindHalal: true, contents: nil)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
