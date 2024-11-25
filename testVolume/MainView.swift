//
//  MainView.swift
//  GalkinHomework10
//
//  Created by GALKIN Aleksandr on 25.11.2024.
//

import SwiftUI
import RealityKit

struct MainView: View {
    @State private var anchor = AnchorEntity(world: .zero)

    var body: some View {
        VStack {
            Text("3D Object Viewer")
                .font(.title)
                .padding()

            RealityView { content in
                content.add(anchor)
            }
            .dropDestination(for: URL.self) { urls, location in
                for url in urls {
                    if let modelEntity = try? Entity.loadModel(contentsOf: url) {
                        anchor.addChild(modelEntity)
                    }
                }
                return true
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.thinMaterial)

            Button("Add 3D Object") {
                addSampleObject()
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
    }

    private func addSampleObject() {
        let box = ModelEntity(mesh: .generateBox(size: 1), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
        anchor.addChild(box)
    }
}
