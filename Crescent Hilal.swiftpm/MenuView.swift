//
//  MenuView.swift
//  Crescent Hilal
//
//  Created by Carissa Farry Hilmi Az Zahra on 18/04/23.
//

import SwiftUI

struct MenuView: View {
    @State private var isShowingIntroduction = false
    @State private var isShowingFindHilal = false
    @State private var isFullScreen = true
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color(hex: "323E65"))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                ZStack(alignment: .top) {
                    Image("FullStars")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                
                ZStack(alignment: .top) {
                    Image("FullStars")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                
                ZStack(alignment: .top) {
                    Image("FullStars")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 25)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    VStack {
                        Button(action: {
                            self.isShowingIntroduction = true
                        }, label: {
                            ZStack {
                                Image("BtnBg")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 75)
                                
                                NavigationLink(
                                    destination:
                                        IntroductionView(
                                            contentsView: AnyView(FirstPageContent()),
                                            nextDestination: AnyView(
                                                IntroductionView (
                                                    informations: [
                                                        "Unlike the Gregorian calendar, which is based on the solar year, the Islamic calendar is based on the lunar year.",
                                                        "This means that each month starts with the sighting of the new crescent moon, and a year is made up of 12 lunar months.",
                                                        "This is why the Islamic calendar is 11 days shorter than the Gregorian calendar.",
                                                    ],
                                                    nextDestination: AnyView(
                                                        IntroductionView (
                                                            informations: [
                                                                "Traditionally, the sighting of the new crescent moon is done by trained observers who look for it with the naked eye. This is known as Ruqyatul Hilal.",
                                                                "The sighting must meet certain criteria to be accepted, such as being visible shortly after sunset and at a certain altitude. ",
                                                                "There are also other methods, such as astronomical calculations or using pre-calculated Islamic calendars.",
                                                            ],
                                                            nextDestination: AnyView(
                                                                FindHilalView(
                                                                    isFindHalal: true
                                                                )
                                                            ),
                                                            buttonLabel: "Let's Find Hilal!"
                                                        )
                                                    ),
                                                    buttonLabel: "Next"
                                                )
                                            ),
                                            buttonLabel: nil
                                        )
                                        .navigationBarBackButtonHidden(true)
                                ){
                                    Text("Get Started")
                                        .font(.system(.title2, design: .serif))
                                        .foregroundColor(Color.black)
                                }
                            }
                            .frame(width:150)
                        })
                    }
                }
                
                ZStack(alignment: .top) {
                    Image("FullStars")
                        .resizable()
                        .scaledToFit()
                }
                
                ZStack(alignment: .top) {
                    Image("FullStars")
                        .resizable()
                        .scaledToFit()
                }
                
                ZStack(alignment: .top) {
                    Image("FullStars")
                        .resizable()
                        .scaledToFit()
                }
            }
            
            Image("Title")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct TestIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(
            informations: [
                "Unlike the Gregorian calendar, which is based on the solar year, the Islamic calendar is based on the lunar year.",
                "This means that each month starts with the sighting of the new crescent moon, and a year is made up of 12 lunar months.",
                "This is why the Islamic calendar is 11 days shorter than the Gregorian calendar.",
            ],
            nextDestination: AnyView(FindHilalView(isFindHalal: true)),
            buttonLabel: nil)
    }
}
