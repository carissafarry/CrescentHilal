//
//  IntroductionView.swift
//  Crescent Hilal
//
//  Created by Carissa Farry Hilmi Az Zahra on 18/04/23.
//

import SwiftUI

struct IntroductionView: View {
    var contentsView: AnyView? = nil
    var informations: [String]? = []
    var nextDestination: AnyView
    var buttonLabel: String = "Next"
    
    
    init(contentsView: AnyView, nextDestination: AnyView, buttonLabel: String?) {
        self.contentsView = contentsView
        self.nextDestination = nextDestination
        self.buttonLabel = buttonLabel ?? "Next"
    }
    
    init(informations: [String], nextDestination: AnyView, buttonLabel: String?) {
        self.informations = informations
        self.nextDestination = nextDestination
        self.buttonLabel = buttonLabel ?? "Next"
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(hex: "323E65"))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ZStack {
                Image("BGCircles2")
                    .resizable()
                    .scaledToFill()
            }
            
            VStack(spacing: UIScreen.main.bounds.height * 0.2) {
                ZStack {
                    ZStack {
                        Image("Stars1")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    VStack() {
                        contentsView

                        if (self.informations != nil) {
                            ForEach(self.informations ?? [""], id:\.self) { info in
                                BubbleWrapper(content: info)
                            }
                        }
                        
                    }
                }
                
                HStack(alignment: .bottom) {
                    Image("Rissa")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190, height: 190, alignment: .leading)
                    
                    Button(action: {}, label: {
                        ZStack {
                            Image("BtnBg")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 175)
                            
                            NavigationLink(
                                destination: self.nextDestination
                                    .navigationBarBackButtonHidden(true)
                            ) {
                                Text(buttonLabel)
                                    .font(.system(.title2, design: .serif))
                                    .foregroundColor(Color.black)
                                    .frame(width: 175)
                            }
                        }
                    })
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func BubbleWrapper(content: String) -> some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                Image("BubbleLeft-sm")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: UIScreen.main.bounds.width * 1,
                        height: UIScreen.main.bounds.height * 0.15,
                        alignment: .leading
                    )
                
                Text(content)
                    .font(.system(.title2, design: .serif))
                    .foregroundColor(Color.black)
                    .frame(
                        maxWidth: UIScreen.main.bounds.width * 0.42,
                        maxHeight: UIScreen.main.bounds.height * 0.095,
                        alignment: .leading
                    )
                    .padding(.all, UIScreen.main.bounds.width * 0.03)
                    
            }
            .padding(.leading, UIScreen.main.bounds.width * 0.1)
        }
        .scaledToFit()
        
    }
}

struct FirstPageContent: View {
    var body: some View {
        ZStack {
            Image("BtnBg")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.8)
        
            VStack {
                Text("Hilal ")
                    .font(.system(.largeTitle, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 40)
                
                Text("Is the Arabic word for the crescent moon. \n\nIn Islam, it is used to determine the beginning and end of each month in the Lunar Calendar. The sighting of Hilal is a special event that marks the start of a new month and is celebrated by Muslims around the world.")
                    .font(.system(.title2, design: .serif))
                    .foregroundColor(Color.black)
            }
            .frame(width: UIScreen.main.bounds.width * 0.7)
            .multilineTextAlignment(.center)
            
        }
        
    }
}

struct SecondPageContent: View {
    var body: some View {
        ZStack {
            VStack(spacing: UIScreen.main.bounds.height * 0.2) {
                ZStack {
                    VStack {
                        IntroductionView(
                            informations: [
                                "Unlike the Gregorian calendar, which is based on the solar year, the Islamic calendar is based on the lunar year.",
                                "This means that each month starts with the sighting of the new crescent moon, and a year is made up of 12 lunar months.",
                                "This is why the Islamic calendar is 11 days shorter than the Gregorian calendar.",
                            ],
                            nextDestination: AnyView(FindHilalView(isFindHalal: false)),
                            buttonLabel: "Next"
                        )
                    }
                }
            }
        }
    }
}

struct ThirdPageContent: View {
    var body: some View {
        ZStack {
            Image("BtnBg")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.8)
        
            VStack {
                Text("Hilal ")
                    .font(.system(.largeTitle, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(.bottom, 40)
                
                Text("Traditionally, the sighting of the new crescent moon is done by trained observers who look for it with the naked eye. This is known as Ruqyatul Hilal. \n\nThe sighting must meet certain criteria to be accepted, such as being visible shortly after sunset and at a certain altitude. However, in modern times, technology has also been used to help find hilal.")
                    .font(.system(.title2, design: .serif))
                    .foregroundColor(Color.black)
            }
            .frame(width: UIScreen.main.bounds.width * 0.7)
            .multilineTextAlignment(.center)
        }
    }
}

@ViewBuilder
func FourthPageContent() -> some View {
    FindHilalView(
        isFindHalal: false,
        contents: AnyView(ZStack{})
    )
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(informations: ["haha", "hihi"], nextDestination: AnyView(FindHilalView(isFindHalal: true)), buttonLabel: "Let's find the Hilal!")
    }
}

struct FirstPageContent_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageContent()
    }
}

struct SecondPageContent_Previews: PreviewProvider {
    static var previews: some View {
        SecondPageContent()
    }
}

struct ThirdPageContent_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPageContent()
    }
}

struct FourthPageContent_Previews: PreviewProvider {
    static var previews: some View {
        FourthPageContent()
    }
}
