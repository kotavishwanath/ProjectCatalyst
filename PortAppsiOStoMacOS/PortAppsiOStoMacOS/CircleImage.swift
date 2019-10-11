//
//  CircleImage.swift
//  PortAppsiOStoMacOS
//
//  Created by Vishwanath Kota on 11/10/2019.
//  Copyright © 2019 Vishwanath Kota. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("arrow")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 30) 
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
