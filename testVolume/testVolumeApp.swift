//
//  testVolumeApp.swift
//  testVolume
//
//  Created by GALKIN Aleksandr on 25.11.2024.
//

import SwiftUI

@main
struct testVolumeApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }.windowStyle(.volumetric)

        WindowGroup("Drag & Drop") {
            DragDropView()
        }
        .windowStyle(.volumetric)
    }
}
