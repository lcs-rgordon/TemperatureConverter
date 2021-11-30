//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Russell Gordon on 2021-11-30.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    // Temperature in degrees Celsius
    @State var celsius = -5.0
                
    // MARK: Computed properties
    
    // Temperature in Fahrenheit
    var fahrenheit: Double {
        return celsius * 1.8 + 32
    }
    
    // Feedback about what to wear
    var feedback: String {
        
        if celsius >= -20 && celsius < 0 {
            return "Dress warmly!"
        } else {
            return ""
        }
        
    }
    
    // The user interface to be shown
    var body: some View {

        VStack(alignment: .leading) {
                        
            // Label for Celsius value
            Text("Celsius")
                .font(.title2)
                .bold()

            // Input - select temperature
            Slider(value: $celsius,
                   in: -50.0...50,
                   step: 1.0,
                   label: {
                Text("Guess")
            },
                   minimumValueLabel: {
                Text("-50 °C")
            },
                   maximumValueLabel: {
                Text("50 °C")
            })
            
            HStack {
                Spacer()
                
                // Output – show temperature in Celsius
                Text("\(String(format: "%.0f", celsius)) °C")
                    .font(.title2)
                    .bold()

                Spacer()
            }
            .padding(.vertical, 20)
            
            // Label for Fahrenheit value
            Text("Fahrenheit")
                .font(.title2)
                .bold()

            HStack {
                Spacer()
                
                // Output – show temperature in Fahrenheit
                Text("\(String(format: "%.1f", fahrenheit)) °F")
                    .font(.title2)
                    .bold()

                Spacer()
            }
            .padding(.vertical, 20)

            // Output - Show feedback
            HStack {

                Spacer()
                
                Text("\(feedback)")
                    .font(.title)
                    .italic()
                    .padding()
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            
            Spacer()
            
        }
        .padding(20)
        .navigationTitle("Temperature Converter")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
