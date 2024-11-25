//
//  DragDropView.swift
//  GalkinHomework10
//
//  Created by GALKIN Aleksandr on 25.11.2024.
//

import SwiftUI
import RealityKit

struct DragDropView: View {
    @State private var droppedFiles: [URL] = []

    var body: some View {
        VStack {
            Text("Drag & Drop Area")
                .font(.title)
                .padding()

            Rectangle()
                .fill(.quaternary)
                .frame(height: 200)
                .dropDestination(for: URL.self) { urls, location in
                    droppedFiles.append(contentsOf: urls)
                    return true
                }
                .overlay(
                    Text("Drop your .usda/.usdz files here")
                        .foregroundColor(.secondary)
                )

            if !droppedFiles.isEmpty {
                List(droppedFiles, id: \.self) { url in
                    Text(url.lastPathComponent)
                }
                .frame(maxHeight: 200)
            }
        }
        .padding()
    }
}
