import SwiftUI

struct CarouselView: View {
    let items: [CarouselItem]
    
    @State private var scrollOffset: CGFloat = 0
    @State private var currentIndex: Int = 0
    @State private var carouselHeight: CGFloat = 150  // Default value to prevent crashes
    
    let spacingRatio: CGFloat = 0.1 // Spacing relative to screen width
    
    var body: some View {
        GeometryReader { geometry in
            let cardWidth = geometry.size.width * 0.5 // Compute locally
            let spacing = geometry.size.width * spacingRatio
            let totalItemWidth = cardWidth + spacing
            let center = geometry.size.width / 2
            
            HStack(spacing: spacing) {
                ForEach(items.indices, id: \.self) { index in
                    VStack {
                        items[index].imageName
                            .resizable()
                            .scaledToFill()
                            .frame(width: cardWidth, height: cardWidth) // Use `@State cardWidth`
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(index == currentIndex ? Color.white : Color.clear, lineWidth: 4)
                            )
                            .shadow(radius: index == currentIndex ? 10 : 3)
                        
                        Text(items[index].name)
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: cardWidth, height: 50, alignment: .center)
                        
                    }
                    .scaleEffect(index == currentIndex ? 1.1 : 0.8)
                    .animation(.easeInOut(duration: 0.2), value: currentIndex)
                    .padding(.vertical)
                }
            }
            .padding(.horizontal, center - cardWidth / 2)
            .offset(x: scrollOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        scrollOffset = value.translation.width - CGFloat(currentIndex) * totalItemWidth
                    }
                    .onEnded { value in
                        let threshold: CGFloat = totalItemWidth / 2
                        let newIndex: Int
                        
                        if value.predictedEndTranslation.width > threshold {
                            newIndex = max(0, currentIndex - 1)
                        } else if value.predictedEndTranslation.width < -threshold {
                            newIndex = min(items.count - 1, currentIndex + 1)
                        } else {
                            newIndex = currentIndex
                        }
                        
                        withAnimation(.spring()) {
                            currentIndex = newIndex
                            scrollOffset = -CGFloat(newIndex) * totalItemWidth
                        }
                    }
            )
            .onAppear {
                carouselHeight = geometry.size.height // Assign width safely after view appears
            }
        }
//        .background(.red)
        .frame(height: carouselHeight) // Increased height to fit the content properly
    }
}

// Data Model
struct CarouselItem {
    let name: String
    let imageName: Image
}

// Preview
struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(items:  [
            CarouselItem(name: "Dosa", imageName: DesignSystem.Images.dosa),
            CarouselItem(name: "Idali", imageName: DesignSystem.Images.idali),
            CarouselItem(name: "Sambar", imageName: DesignSystem.Images.sambar),
            CarouselItem(name: "Chutney", imageName: DesignSystem.Images.chutney)
        ])
        .preferredColorScheme(.dark)
        .background(Color.black)
    }
}
