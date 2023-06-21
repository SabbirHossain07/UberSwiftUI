//
//  LocationSearchView.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 21/6/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var showLocationSearchView: Bool
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            //MARK: - Header View
            
            HStack {
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
                
                VStack {
                    TextField("Current locations", text: $startLocationText)
                        .accentColor(.blue)
                        .font(.footnote)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.quaryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                        .autocorrectionDisabled(true)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            //MARK: - List View
            
            ScrollView{
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultCell(
                            title: result.title, subtitle: result.subtitle
                        )
                        .onTapGesture {
                            viewModel.selectLocation(result)
                            showLocationSearchView.toggle()
                        }
                    }
                }
            }
        }
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(showLocationSearchView: .constant(false))
    }
}
