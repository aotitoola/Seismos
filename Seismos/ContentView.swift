//
//  ContentView.swift
//  Seismos
//
//  Created by Aanuoluwa Otitoola on 17/05/2020.
//  Copyright © 2020 Aanuoluwa Otitoola. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkingManager = NetworkingManager()
    
    var body: some View {
        NavigationView{
            List(networkingManager.dataList.features,
                  id: \.properties){
                     data in
                    NavigationLink(destination: QuakeDetails(data: data)){
                        CellRow(data: data)
                    }
             }.navigationBarTitle("Quakes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
