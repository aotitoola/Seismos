//
//  CellRow.swift
//  Seismos
//
//  Created by Aanuoluwa Otitoola on 17/05/2020.
//  Copyright © 2020 Aanuoluwa Otitoola. All rights reserved.
//

import SwiftUI

struct CellRow: View {
    var data: Features
    var body: some View {
        HStack(alignment: .center, spacing: 9){
            VStack(alignment: .leading){
                VStack {
                    Text(String(data.properties.mag))
                    .bold()
                        .foregroundColor(.white)
                        .font(.subheadline)
                }.frame(width: 50, height: 50)
                    .background(Color.green)
            }.clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            .shadow(radius: 1)
            
            VStack{
                Text(data.properties.place)
                    .foregroundColor(.gray)
                    .bold()
                
                Text("Time \(timeConverter(timeStamp: data.properties.time))")
                .italic()
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    .padding(.top, 2)
                    
            }
        }
    }
}

func timeConverter(timeStamp: Double) -> String {
    let unixTimestamp = timeStamp / 1000 // so we can get milliseconds
    let date = Date(timeIntervalSince1970: unixTimestamp)
    
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "dd MMM YY, hh:mm a"
    
    return dateFormatter.string(from: date)
}
