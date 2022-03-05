//
//  ContentView.swift
//  Memorize
//
//  Created by 宋浩辰 on 2022/3/2.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑"]
    @State var emojiCount = 8
    
    var emojiVehicle = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦽", "🛴", "🚲", "🛵", "🏍", "🛺", "🚂", "✈️", "🚀"]
    
    var emojiFace = ["😅", "🤣", "😇", "😍", "🥰", "😋", "😭", "🥵", "😱", "🤯"]
    
    var emojiAnimal = ["🐶", "🐻", "🐸", "🐯", "🐱", "🙈", "🐷", "🐴", "🦈"]
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        emoji in CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)

            Spacer()
            
            HStack {
                Spacer()
                buttonVehicle
                Spacer()
                buttonFace
                Spacer()
                buttonAnimal
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    
    var buttonVehicle: some View {
        Button {
            emojis = emojiVehicle.shuffled()
            emojiCount = emojis.count
            
        } label: {
            VStack {
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Vehicles")
                    .font(.caption)
            }
        }
    }
    var buttonFace: some View {
        Button {
            emojis = emojiFace.shuffled()
            emojiCount = emojis.count
            
        } label: {
            VStack {
                Image(systemName: "face.smiling")
                    .font(.largeTitle)
                Text("Faces")
                    .font(.caption)
            }
        }
    }
    var buttonAnimal: some View {
        Button {
            emojis = emojiAnimal.shuffled()
            emojiCount = emojis.count
            
        } label: {
            VStack {
                Image(systemName: "pawprint.circle")
                    .font(.largeTitle)
                Text("Animals")
                    .font(.caption)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portrait)
    }
}
