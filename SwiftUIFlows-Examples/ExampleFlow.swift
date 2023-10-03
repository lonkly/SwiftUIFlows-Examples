//
//  ExampleFlow.swift
//  SwiftUIFlows-Examples
//
//  Created by Vivienne Fosh on 26.09.2023.
//

import Foundation
import SwiftUI
import SwiftUIFlows

@MainActor open class ExampleFlow: FlowBuilder {
    func presentPopup1() {
        presentPopup(
            PopupExampleView(showDismissButton: true)
                .environmentObject(self)
        )
    }
    
    /// only thing special about these methods is how you actually want to present you view - via popup, fullscreen or a modal sheet.
    func presentFullscreenExample() {
        presentFullScreen(
            VersatileExampleView(isFullscreen: true, color: .coralPink)
                .environmentObject(self)
        )
    }
    
    func presentPopup2() {
        presentPopup(
            PopupExample2View(showDismissButton: true)
                .environmentObject(self)
        )
    }
    
    func presentSheetExample(color: Color) {
        presentSheet(
            VersatileExampleView(isFullscreen: false, color: color)
                .environmentObject(self)
        )
    }
    
    func presentSheetExample2() {
        presentSheet(
            VersatileExampleView(isFullscreen: false, color: .red)
                .environmentObject(self)
        )
    }
}

struct previewz: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
