//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Brandon Coston on 2/28/23.
//

import SwiftUI

//Custom modifiers

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func prominentTitleStyle() -> some View {
        modifier(ProminentTitle())
    }
}

//Custom View

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

//Testing

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is the title")
                .prominentTitleStyle()
            GridStack(rows: 4, columns: 4) { row, col in
                HStack {
                    Image(systemName: "\(row * 4 + col).circle")
                    Text("R\(row) C\(col)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
