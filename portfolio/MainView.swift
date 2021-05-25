//
//  MainView.swift
//  portfolio
//
//  Created by Mickale Saturre on 5/5/21.
//

import SwiftUI

struct MainView: View {
    @Binding var showSidebar: Bool
    
    init(showSidebar: Binding<Bool>) {
        self._showSidebar = showSidebar
    }

    private var TopView: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            showSidebar.toggle()
                        }
                    }) {
                        if showSidebar {
                            Image(systemName: "person")
                                .imageScale(.large)
                        } else {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                        }
                    }.foregroundColor(.white) 

                    Spacer()

                    Text("Portfolio")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)

                    Spacer()

                    Image(systemName: "swift")
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .position(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).midY / 4)
                .zIndex(1)
        
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "sampleImage"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height,
                               alignment: .center)
                    
                    BasicInformation
                }

                SocialMediaLinks
                    .position(x: geometry.frame(in: .global).midX, y: -50)
            }
        }
    }
    
    private var SocialMediaLinks: some View {
        Group {
            HStack {
                Image(uiImage: #imageLiteral(resourceName: "facebook"))
                    .socialMediaIcons()
                
                 Image(uiImage: #imageLiteral(resourceName: "github"))
                    .socialMediaIcons()
                
                Image(uiImage: #imageLiteral(resourceName: "instagram"))
                    .socialMediaIcons()
                
                Image(uiImage: #imageLiteral(resourceName: "linkedin"))
                    .socialMediaIcons()

                Image(uiImage: #imageLiteral(resourceName: "twitter"))
                    .socialMediaIcons()
                Image(uiImage: #imageLiteral(resourceName: "instagram"))
                    .socialMediaIcons()
            }
        }
    }
    
    
    private var BasicInformation: some View {
        Group {
            VStack {
                Text("Mickale L. Saturre")
                    .font(.title)
                    .italic()
                    .bold()
                    .foregroundColor(.red)
                    .padding(.bottom)
                
                Text("Achieve the goal then die")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .opacity(0.5)
                    )
            }
        }
    }
    
    private var BodyView: some View {
        List {
            Section(header:
                Text("Skills")
                        .font(.headline)
                        .italic()
                        .fontWeight(.light)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
            ) {
                Text("None")
                Text("None")
                Text("None")
                Text("None")
            }
        }
    }
    var body: some View {
        VStack {
            TopView
            
            BodyView
        }
    }
}

extension Image {
    func socialMediaIcons() -> some View {
        self
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.white)
            .frame(width: 25, height: 25, alignment: .center)
    }
}
