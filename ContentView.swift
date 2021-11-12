//
//  ContentView.swift
//  Choosing
//
//  Created by YANG YANG on 11/9/21.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel: ChoosingViewModel

    @State private var add = ""
    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .shadow(radius: 5)
                    WheelShape(viewModel.chooseOptions)
                        .stroke(
                            Color(.black), lineWidth: 3.0)
                        .background(
                            Circle().stroke(Color(.black), lineWidth: 3.0))
                        .frame(width: geo.size.width * 0.95, height: geo.size.height * 0.95)
                        .overlay(
                            annotations.foregroundColor(.purple))
                    Circle()
                        .stroke(Color(.black), lineWidth: 4)
                        .background(Circle().fill(Color.white))
                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.2)
                    Text("Start")
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.45)
            TextField("Add", text: $add)
            Button("add") {
                addToSymbols()
            }
        }
    }
    
     func addToSymbols() {
         if self.add != "" {
             viewModel.chooseOptions.append(add)
             self.add = ""
        }
    }
    
    var annotations : some View {
        GeometryReader { geo in
            ZStack {
                let theta = CGFloat(2) * .pi / CGFloat(viewModel.chooseOptions.count)
                let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
                let radius = min(geo.size.width / 2, geo.size.height / 2) / 1.5
                ForEach(0..<viewModel.chooseOptions.count, id: \.self) { index in
                    let offset = theta * CGFloat(index) + theta / 2
                    // place SF Symbol, offset to center, then the radius
                    Text(viewModel.chooseOptions[index])
                        .offset(x: center.x, y: center.y)
                        .offset(x: radius * cos(offset), y: radius * sin(offset))
                        .frame(alignment: .center)
                        .offset(x: -10, y: -10)
                    // fudge factor to center symbol in wedge
                }
                
            }
        }
    }

    struct WheelShape: Shape {
        let contents : [String]
        
        init(_ contents: [String]) {
            self.contents = contents
        }
        
        func path(in rect: CGRect) -> Path {
            // center of the shape we are drawing in
            let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
            let radius = min(rect.size.width / 2, rect.size.height / 2)
            // each angle offset in radians
            let theta = CGFloat(2) * .pi / CGFloat(contents.count)
            var path = Path()
            
            // enumerate the array so index is available
            contents.enumerated().forEach({ (index, symbol) in
                let offset = theta * CGFloat(index)
                path.move(to: center)
                path.addLine(to: CGPoint(x: radius * cos(offset) + center.x, y: radius * sin(offset) + center.y))
            })
            
            return path
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let choose = ChoosingViewModel()
        ContentView(viewModel: choose)
    }
}
