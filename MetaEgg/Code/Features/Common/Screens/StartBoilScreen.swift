//
//  StartBoilScreen.swift
//  MetaEgg
//
//  Created by Ivan Shturkhal on 12.03.2026.
//

import SwiftUI

struct StartBoilScreen: View {
    
    @StateObject private var startBoilViewModel = StartBoilViewModel()
    @State private var navigateToTimer = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                
                Text("Golden Chicken\nEggs Boil")
                    .font(.suraBold(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        NavigationLink(destination: InfoScreen()) {
                            Image("infoEgg")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 40)
                        },
                        alignment: .topTrailing
                    )
                HStack(alignment: .bottom, spacing: 26) {
                    ForEach(EggSize.allCases) { size in
                        VStack {
                            Image(size.data.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: size.imageHeight)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(size == startBoilViewModel.selectedSize ? Color.white : .clear, lineWidth: 2)
                                )
                        }
                        .onTapGesture {
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.impactOccurred()
                            startBoilViewModel.selectedSize = size
                        }
                    }
                }
                
                VStack(spacing: 8) {
                HStack {
                        Text("fridge")
                        Spacer()
                        Text("room")
                    }
                    .font(.suraRegular(size: 18))
                    
                    Slider(value: $startBoilViewModel.eggTemp, in: 4...25)
                        .accentColor(.whiteMain)
                        .onChange(of: startBoilViewModel.eggTemp) { _ in
                            let generator = UIImpactFeedbackGenerator(style: .light)
                            generator.impactOccurred()
                        }
                    HStack {
                        Spacer()
                        Text("\(Int(startBoilViewModel.eggTemp))°C")
                            .font(.suraRegular(size: 18))
                    }
                }
                
                EggStatusView(temperature: startBoilViewModel.targetTemp)
                    .frame(height: 140)
                
                VStack(spacing: 8) {
                    HStack {
                        Text("liquid")
                        Spacer()
                        Divider().frame(height: 20).background(Color.white)
                        Spacer()
                        Text("soft")
                        Spacer()
                        Divider().frame(height: 20).background(Color.white)
                        Spacer()
                        Text("hard")
                    }
                    .font(.suraRegular(size: 18))
                    .foregroundColor(.whiteMain)
                    
                    Slider(value: $startBoilViewModel.targetTemp, in: 56...85, step: 1)
                        .accentColor(.whiteMain)
                        .onChange(of: startBoilViewModel.targetTemp) { _ in
                            let generator = UIImpactFeedbackGenerator(style: .light)
                            generator.impactOccurred()
                        }
                    
                    HStack {
                        Spacer()
                        Text("\(Int(startBoilViewModel.targetTemp))°C")
                            .font(.suraRegular(size: 18))
                    }
                }
                .padding(.top, 10)
                
                Text(startBoilViewModel.formattedTime)
                    .font(.suraBold(size: 52))
                    .tracking(3)
                MainButtonView(title: "start", backgroundColor: .whiteMain, titleColor: .purpleMain, action: {
                    navigateToTimer = true
                })
                .padding(.top, 20)
                .navigationDestination(isPresented: $navigateToTimer) {
                    TimerScreen(
                        totalTime: startBoilViewModel.finalTime,
                        targetTemp: Int(startBoilViewModel.targetTemp),
                        startTemp: Int(startBoilViewModel.eggTemp),
                        facts: startBoilViewModel.eggFacts,
                        eggSize: startBoilViewModel.selectedSize
                    )
                }
                
                if !startBoilViewModel.currentFact.isEmpty {
                    Text(startBoilViewModel.currentFact)
                        .font(.suraRegular(size: 18))
                        .foregroundColor(.yellow)
                        .padding(.top)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            .padding()
            .background(Color.purpleMain.ignoresSafeArea())
            .foregroundColor(.white)
        }
    }
}
