//
//  StatsView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 09/12/20.
//

import SwiftUI
import MapKit

struct City: Identifiable {
  let id = UUID()
  let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
  
  @State private var cities: [City] = [
    City(coordinate: .init(latitude: 40.7128, longitude: 74.0060)),
    City(coordinate: .init(latitude: 37.7749, longitude: 122.4194)),
    City(coordinate: .init(latitude: 47.6062, longitude: 122.3321))
  ]
  
  @State private var userTrackingMode: MapUserTrackingMode = .follow
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.7617, longitude: 80.1918), span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
  )
  
  
  var body: some View {
    Map(coordinateRegion: $region, annotationItems: cities) { city in
      MapPin(coordinate: city.coordinate, tint: .green)
    }
  }
  
}

struct StatsView: View {
  
  @Namespace var animation
  @State var tab: String = "My Country"
  @State var subTab = "Total"
  
  var body: some View {
    VStack {
      
      HStack {
        Text("Statistics")
          .fontWeight(.semibold)
        
        Spacer(minLength: 0)
      }
      .padding()
      
      HStack(spacing: 0) {
        TabButton(selected: $tab, title: "My Country", animation: animation)
        TabButton(selected: $tab, title: "Global", animation: animation)
      }
      .padding(.all, 4)
      .background(Color(#colorLiteral(red: 0.2784313725, green: 0.2470588235, blue: 0.5921568627, alpha: 1)).opacity(0.08))
      .clipShape(Capsule())
      .padding(.horizontal)
      
      HStack(spacing: 20) {
        ForEach(subTabs, id: \.self) { tab in
          Button(action: { subTab = tab }) {
            Text(tab)
              .fontWeight(.semibold)
              .foregroundColor(Color.black.opacity(subTab == tab ? 1 : 0.4))
          }
        }
      }
      .padding()
      
      VStack(spacing: 16) {
        HStack(spacing: 16) {
          BoxView()
          BoxView()
        }
        
        HStack(spacing: 10) {
          BoxView()
          BoxView()
          BoxView()
        }
      }
      .padding(.top)
      .padding(.horizontal)
      
      //      Color.white
      //        .ignoresSafeArea(.all, edges: .bottom)
    }
  }
}

struct StatsView_Previews: PreviewProvider {
  static var previews: some View {
    StatsView()
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}

struct TabButton: View {
  
  @Binding var selected: String
  var title: String
  var animation: Namespace.ID
  
  var body: some View {
    Button(action: {
      withAnimation(.spring()) {
        selected = title
      }
    }) {
      ZStack {
        Capsule()
          .fill(Color.clear)
          .frame(height: 45)
        
        if selected == title {
          Capsule()
            .fill(Color.white)
            .frame(height: 45)
            .matchedGeometryEffect(id: "Tab", in: animation)
        }
        
        Text(title)
          .foregroundColor(selected == title ? .black : Color(#colorLiteral(red: 0.2745098039, green: 0.3137254902, blue: 0.5019607843, alpha: 1)))
          .fontWeight(.bold)
      }
    }
  }
  
}

var subTabs = ["Total", "Today", "Yesterday"]

struct BoxView: View {
  
  var body: some View {
    ZStack {
      Color.orange
      
      HStack {
        VStack(alignment: .leading, spacing: 22) {
          Text("Confirmed")
            .foregroundColor(.white)
          
          Text("1000,000")
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
        
        Spacer()
      }
      .padding()
    }
    .cornerRadius(10)
  }
  
}
