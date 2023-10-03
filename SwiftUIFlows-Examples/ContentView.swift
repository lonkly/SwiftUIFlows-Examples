//
//  ContentView.swift
//  SwiftUIFlows-Examples
//
//  Created by Vivienne Fosh on 26.09.2023.
//

import SwiftUI
import SwiftUIFlows

struct ContentView: View {
    @StateObject var flow = ExampleFlow(isPresented: .constant(true))
    
    @StateObject var anotherFlow = ExampleFlow(isPresented: .constant(true))
    
    func presentAll()  {
        
        /// Awaiting for 2 seconds here
        flow.presentPopup1()
        flow.presentFullscreenExample()
        anotherFlow.presentPopup2()
        
        flow.presentSheetExample(color: .coralPink)
        flow.presentSheetExample(color: .goldenrodYellow)
        flow.presentSheetExample2()
    }
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Root View")
                        .font(.largeTitle)
                    Text("Shows fullscreen, 2 popups and 3 sheets at once.")
                        .font(.title3)
                }
                .padding()
                .foregroundColor(.almostWhite)
                
                Spacer()
            }
            
            Spacer()
            
            Button(action: {
                
                presentAll()
                
            }) {
                Text("Show Everything")
                    .font(.title3)
                    .foregroundColor(.almostWhite)
            }
            .padding()
            .background(Color.coralPink)
            .cornerRadius(10)
            .foregroundStyle(Color.deepOceanBlue)
            
            Spacer()
        }
        
        .onAppear {
            Task {
                //await presentAll()
            }
        }
        
        // This line is required for flow to present native iOS sheets
        .sheetFlow(flow)
        // This line is required for flow to present full-screen views
        .fullScreenFlow(flow)
        // This line is required for flow to present popovers. You can provide different configs for respective flows
        .popupFlow(flow, config: PopoverConfig(
            width: 320,
            height: 300,
            dismissOnTapOutside: {
                flow.dismissPopup()
            },
            dismissBySwipeDown: {
                flow.dismissPopup()
            },
            verticalAlignment: .center
        ))
        .popupFlow(anotherFlow, config: PopoverConfig(
            width: 180,
            height: 200,
            dismissOnTapOutside: {
                anotherFlow.dismissPopup()
            },
            dismissBySwipeDown: {
                anotherFlow.dismissPopup()
            },
            horizontalAlignment: .trailing,
            verticalAlignment: .top,
            offsetX: -20,
            offsetY: 10
        ))
        .background(Color.deepOceanBlue)
    }
}

#Preview {
    ContentView()
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

extension Color {
    static let deepOceanBlue = Color(hex: 0x1B263B)
    static let softSkyBlue = Color(hex: 0xAEDFF7)
    static let coralPink = Color(hex: 0xFF6B6B)
    static let almostWhite = Color(hex: 0xE1E8ED)
    static let mediumGray = Color(hex: 0x7B8B9A)
    
    
    static let midnightGreen = Color(hex: 0x004949)
    static let softMintGreen = Color(hex: 0xA8E6CF)
    static let goldenrodYellow = Color(hex: 0xFFD700)
    
    static let lavenderGray = Color(hex: 0xC5C6C7)
    static let persianRose = Color(hex: 0xFE2E9A)
    static let electricLime = Color(hex: 0xCCFF00)
    static let darkSlateGray = Color(hex: 0x2B2B2B)
    static let mediumSlateGray = Color(hex: 0x7B7D7D)
}
