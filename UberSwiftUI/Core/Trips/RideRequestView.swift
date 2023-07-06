//
//  RideRequestView.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 24/6/23.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .uberX
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
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
                        
                        Text(locationViewModel.pickupTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        if let location = locationViewModel.selectedUberLocation {
                            Text(location.title)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        
                        Spacer()
                        
                        Text(locationViewModel.dropOffTime ?? "")
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
                        ForEach(RideType.allCases) { type in
                            VStack(alignment: .leading) {
                                Image(type.imageName)
                                    .resizable()
                                    .scaledToFit()
                                
                                VStack(alignment: .leading ,spacing: 4) {
                                    Text(type.description)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                    Text(locationViewModel.computerRidePrice(forType: type).toCurrency())
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                .padding()
                            }
                            .frame(width: 112, height: 140)
                            .foregroundColor(type == selectedRideType ? .white : Color.theme.primaryTextColor)
                            .background(type == selectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                            .scaleEffect(type == selectedRideType ? 1.2 : 1.0)
                            .cornerRadius(10)
                            .onTapGesture {
                                withAnimation(.spring(dampingFraction: 1.0)) {
                                    selectedRideType = type
                                }
                            }
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
                .background(Color.theme.secondaryBackgroundColor)
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
        .padding(.bottom, 16)
        .background(Color.theme.backgroundColor)
        .cornerRadius(20)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
