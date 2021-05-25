//
//  ContentView.swift
//  portfolio
//
//  Created by Mickale Saturre on 5/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var showSidebar: Bool = false
    
    var body: some View {
        SideBarStack(sidebarWidth: 125, showSidebar: $showSidebar) {
            Text("Ola")
        } content: {
            MainView(showSidebar: $showSidebar)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
