//
//  RideRequestView.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 24/6/23.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
            
            //MARK: - Trip info view
            
            HStack(spacing: 20) {
                VStack {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray))
                        .frame(width: 1, height: 26)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Current locations")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        Spacer()
                        
                        Text("01:30 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Coffe lover")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Text("03:11 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            
            Divider()

            //MARK: - Ride type selection view
            
            Text("SUGGESTED RIDE")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundColor(.gray)
            
            VStack(spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0 ..< 3, id: \.self) { _ in
                            VStack(alignment: .leading) {
                                Image("uber-x")
                                    .resizable()
                                    .scaledToFit()
                                
                                VStack(spacing: 4) {
                                    Text("UberX")
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                    Text("$22.04")
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                .padding(8)
                            }
                            .frame(width: 112, height: 140)
                            .background(Color(.systemGroupedBackground))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
                
                //MARK: - Payment Option View
                
                HStack(spacing: 12) {
                    Text("Visa")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(6)
                        .background(.blue)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                        .padding(.leading)
                    Text("****1234")
                        .fontWeight(.bold)
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .imageScale(.medium)
                        .padding()
                }
                .frame(height: 50)
                .background(Color(.systemGroupedBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                
                //MARK: - Request Ride Button
                
                Button {
                    
                } label: {
                    Text("CONFIRM RIDE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
        .background(.white)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
