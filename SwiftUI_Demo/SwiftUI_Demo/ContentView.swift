//
//  ContentView.swift
//  SwiftUI_Demo
//
//  Created by Techsaga Corp on 17/09/21.
//

import SwiftUI

struct MenuContent: View {
    var body: some View {
        List {
            
//            HStack
//            {
//                Image("sound-2")
//                imageScale(.large)
//            }
//            .padding(.top, 20)
//            .padding(.leading, 100)
//            .padding(.bottom, 50)
            
            HStack{
                Image(systemName: "house.fill")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Home")
                    .foregroundColor(.gray)
                    .font(.headline)
            }.padding(.top, 20)
            
            HStack{
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Request")
                    .foregroundColor(.gray)
                    .font(.headline)
            }.padding(.top, 20)
            
            HStack{
                Image(systemName: "bell")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Notification")
                    .foregroundColor(.gray)
                    .font(.headline)
            }.padding(.top, 20)
            
            HStack{
                Image(systemName: "person.crop.circle")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
            }.padding(.top, 20)
        }
    }
}

struct ContentView: View {
    @State var menuOpen: Bool = false
    var body: some View {
        HStack {
                Button(action: {
                    self.openMenu()
                }, label: {
                    Image("menu")
                }).padding()
            
                  Image("sound-2")
                    .padding(.leading, 120)
                    .tabItem {
                    }
            Image("search")
                .padding(.leading, 80)
                .tabItem {
                }
            Image("comment")
                .padding(.leading, 30)
                .tabItem {
                    Image(systemName: "search")
                    Text("First")
                }
        }
        .padding(.top, 0)
        .padding(.leading, 0)
        .padding(.trailing, 0)
        ZStack{
            TabView {
                Text("Home Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
             
                Text("Request Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person")
                        Text("Request")
                    }
             
                Text("Voices Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image("sound-2")
                        Text("Voices")
                    }
             
                Text("Notification Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "bell")
                        Text("Notification")
                    }
                Text("Profile Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
            }
            SideMenu(width: 300,
                     isOpen: self.menuOpen,
                     menuClose: self.openMenu)
            
        }
    }
    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
