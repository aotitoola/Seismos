//
//  NetworkingManager.swift
//  Seismos
//
//  Created by Aanuoluwa Otitoola on 17/05/2020.
//  Copyright © 2020 Aanuoluwa Otitoola. All rights reserved.
//

import Foundation

class NetworkingManager : ObservableObject {
 
  
  @Published var dataList = QuakeAPIList(features: [])
  
  init() {
      guard let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson") else {return}
      
      URLSession.shared.dataTask(with: url) {
          (data, _, _) in
          guard let data = data else {return}
          
          let dataList = try! JSONDecoder().decode(QuakeAPIList.self, from: data)
          
          DispatchQueue.main.async {
              self.dataList = dataList
//              print(dataList.features)
          }
      }.resume()
  }
}
