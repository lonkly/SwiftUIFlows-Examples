//
//  FullScreenExampleView.swift
//  SwiftUIFlows-Examples
//
//  Created by Vivienne Fosh on 26.09.2023.
//

import Foundation
import SwiftUI

struct VersatileExampleView: View {
    var isFullscreen = true
    var color: Color
    @EnvironmentObject var flow: ExampleFlow
    
    var body: some View {
        VStack {
            
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            if isFullscreen {
                                flow.dismissFullScreen()
                            } else {
                                flow.dismissSheet()
                            }
                        }
                    } label: {
                        Text("Dismiss")
                            .foregroundColor(Color.almostWhite)
                            .font(.headline.bold())
                    }
                    .padding(15)
                    .background(Color.darkSlateGray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(30)
                    
            }
            Spacer()
            
            
            Text("\(isFullscreen ? "Full Screen" : "Sheet") View")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            
            Spacer()
            
            Text("BottomText")
        }
        .onAppear {
            print("\(isFullscreen ? "Full Screen" : "Sheet") View Appeared")
        }
        .onDisappear {
            print("\(isFullscreen ? "Full Screen" : "Sheet") View Disappeared")
        }
        .foregroundStyle(Color.primary)
        .background(color)
    }
}

// To see how pure View looks
struct FullscreenExampleView_Preview: PreviewProvider {
    static var previews: some View {
        VersatileExampleView( color: .goldenrodYellow)
            .environmentObject(ExampleFlow(isPresented: .constant(true)))
    }
}
