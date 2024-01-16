
//  Space.swift
//  Cool Loaders
//
//  Created by vijay verma on 24/12/23.
//

import SwiftUI

class CoolBackgroundProps: ObservableObject {
    // @Published var props: NSMutableDictionary = [:]
    @Published var mode = "stars"
}

struct CoolBackground: View {
    @ObservedObject var props = CoolBackgroundProps()

    var shaderColor: Shader {
        let function = ShaderFunction(
            library: .default,
            name: "aqua"
        )
        let shader = Shader(function: function, arguments: [])
        return shader
    }

    @State private var circleRotation1: Double = 0.0
    @State private var circleRotation2: Double = 0.0


    let start = Date()
    @State private var xOffset = -500.0 // Start offscreen to the left

    var body: some View {
        ZStack{
            if props.mode == "stars" {
                TimelineView(.animation) { context in

                                Rectangle()
                                    .foregroundStyle(.white)
                                    .starField(
                                        seconds: context.date.timeIntervalSince1970 - self.start.timeIntervalSince1970
                                    )
                                    // .frame(width: 400, height: 400)
                }
            }

             else {
                TimelineView(.animation) { context in

                                Rectangle()
                                    .foregroundStyle(.white)
                                    .circleLoader(
                                        seconds: context.date.timeIntervalSince1970 - self.start.timeIntervalSince1970
                                    )
                                    // .frame(width: 400, height: 400)
                }
            }


                // if props.mode == "circles" {
                //                 Rectangle()
                //                     .foregroundStyle(.white)
                //                     .circleLoader(
                //                         seconds: context.date.timeIntervalSince1970 - self.start.timeIntervalSince1970
                //                     )
                //                     // .frame(width: 400, height: 400)
                //             }
            // }
        }
    }
}
// Nativescript



extension View {
    func circleLoader(seconds: Double) -> some View {
        self
            .colorEffect(
                ShaderLibrary.default.circleLoader(.boundingRect, .float(seconds))
            )
    }
}

extension View {
    func starField(seconds: Double) -> some View {
        self
            .colorEffect(
                ShaderLibrary.default.starField(.boundingRect, .float(seconds))
            )
    }
}
