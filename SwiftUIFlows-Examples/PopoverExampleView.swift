//
//  PopoverExampleView.swift
//  SwiftUIFlows-Examples
//
//  Created by Vivienne Fosh on 26.09.2023.
//

import Foundation
import SwiftUI

// Big popup in the center
struct PopupExampleView: View {
    var showDismissButton = true
    @EnvironmentObject var flow: ExampleFlow
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            //HStack { Spacer() }
            
            Text("Popup 1")
                .font(.title)
                .padding()
            
            Text("Drag a bit to move, or a lot to dismiss, \nor")
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .foregroundColor(.darkSlateGray)
                .font(.subheadline)
            
            if showDismissButton {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            flow.dismissPopup()
                        }
                    } label: {
                        Text("Dismiss")
                            .tint(.black)
                            .foregroundColor(.black)
                    }
                    .foregroundStyle(Color.persianRose)
                    .padding()
                    .background(Color.electricLime)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .onAppear {
            print("PopupExample1 appeared")
        }
        .onDisappear {
            print("PopupExample1 disappeared")
        }
        .background(Color.lavenderGray)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// Small Popover
struct PopupExample2View: View {
    var showDismissButton = true
    @EnvironmentObject var flow: ExampleFlow
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack { Spacer() }
            
            Spacer()
            
            Text("Popup 2")
                .font(.title)
                .padding()
                .foregroundStyle(Color.almostWhite)
            
            if showDismissButton {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation {
                            flow.dismissPopup()
                        }
                    } label: {
                        Text("Dismiss")
                            .tint(.black)
                            .font(.headline.bold())
                            .foregroundColor(Color.darkSlateGray)
                            
                    }
                    .padding()
                    .background(Color.goldenrodYellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .onAppear {
            print("PopupExample2 appeared")
        }
        .onDisappear {
            print("PopupExample2 disappeared")
        }
        .background(Color.midnightGreen)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// To see how pure View looks
struct PopupExampleView_Preview: PreviewProvider {
    static var previews: some View {
        PopupExampleView()
            .environmentObject(ExampleFlow(isPresented: .constant(true)))
        PopupExample2View()
            .environmentObject(ExampleFlow(isPresented: .constant(true)))
    }
}
