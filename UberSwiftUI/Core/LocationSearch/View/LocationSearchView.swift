//
//  LocationSearchView.swift
//  UberSwiftUI
//
//  Created by Sopnil Sohan on 21/6/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @Binding var mapState: MapViewState
    
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
                        .padding()
                        .accentColor(.blue)
                        .font(.footnote)
                        .frame(height: 32)
                        .padding(.trailing)
                        .modifier(customViewModifier(roundedCornes: 5, textColor: .gray))
                    
                    TextField("Where to?", text: $viewModel.quaryFragment)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(height: 32)
                        .padding(.trailing)
                        .autocorrectionDisabled(true)
                        .modifier(customViewModifier(roundedCornes: 5, textColor: .gray))
                    
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
                            withAnimation {
                                viewModel.selectLocation(result)
                                mapState = .locationSelected
                            }
                        }
                    }
                }
            }
        }
        .background(Color.theme.backgroundColor)
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
