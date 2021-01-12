//
//  ContentView.swift
//  CustomTabBar_SwiftUI
//
//  Created by Toxumuharu on 2021/01/12.
//

import SwiftUI

struct ContentView: View {
    init(){
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    @State var selectedIndex = 0
    @State var shouldShowModal = false
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                Spacer()
                Button(action: {
                    shouldShowModal.toggle()
                }, label: {
                    Text("Fullscreen cover")
                    })

                switch selectedIndex{
                case 0:
                    NavigationView{
                        ScrollView{
                            ForEach(0..<100) { num in
                                Text("\(num)")
                            }
                        }
                            .navigationTitle("First Tab")
                    }
                case 1:
                    ScrollView{
                        Text("Test")
                    }
                default:
                    NavigationView{
                        Text("Remaining Tabs")
                    }

                }
            }
            Spacer()
            Divider() // for separate the view with a line
                .padding(.bottom, 8)
            
            HStack{
                ForEach(0..<5){ num in
                    Button(action: {
                        if num == 2 {
                            shouldShowModal.toggle()
                            return
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                            .font(.system(size: 44, weight: .bold))
                            .foregroundColor(.red)
                        } else {
                        Image(systemName: tabBarImageNames[num])
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        Spacer()
                    })
                }
            }
        }
    }
    //        TabView{
    //            Text("First")
    //                .tabItem {
    //                    Image(systemName: "person")
    //                    Text("First")
    //                }
    //            Text("First")
    //                .tabItem {
    //                    Image(systemName: "gear®")
    //                    Text("First")
    //                }
    //        }
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
