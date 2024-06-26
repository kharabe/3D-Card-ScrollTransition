//
//  ContentView.swift
//  3D Card Scroll Animation
//
//  Created by aakash kharabe on 26/06/24.

import SwiftUI

struct ListItem: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    
    static let preview: [ListItem] = [
        ListItem(title: "1", color: .purple),
        ListItem(title: "2", color: .green),
        ListItem(title: "3", color: .blue),
        ListItem(title: "4", color: .green),
        ListItem(title: "5", color: .red),
    ]
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
               
            ScrollView(.vertical){
            ForEach(ListItem.preview) { item in
                item.color
                    .frame(height: 550)
                    .overlay {
                        Text(item.title)
                        
                            .bold()
                    }
                    .cornerRadius(24)
                    .padding(.horizontal)
                    .scrollTransition { effect, phase in
                        effect
                            .scaleEffect(phase.isIdentity ? 1 : 0.6)
                            .offset(x: offset(for: phase))
                            .blur(radius: phase.value > 0 ? 5 : 0)
                            .rotationEffect(.degrees(phase.value > 0 ? 70 : 0))
                    }
                
            }
        }
    }
}
    func offset(for phase: ScrollTransitionPhase) -> Double {
        switch phase {
        case .topLeading:
            100
        case .identity:
            0
        case .bottomTrailing:
            100
     
            
        }
}


}

#Preview {
    ContentView()
}

                
    
