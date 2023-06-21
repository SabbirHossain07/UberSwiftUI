//
//  LocationSearchActivationView.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 20/6/23.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            Text("Where to?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .cornerRadius(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .black, radius: 3)
        )
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
