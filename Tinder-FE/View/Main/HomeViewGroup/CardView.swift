//
//  CardView.swift
//  Tinder-FE
//
//  Created by Gia Huy on 09/09/2022.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var cardData: HomeViewModel
    @State var card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.5)])
    
    //MARK: GESTURE PROPERTIES
    @State var offsetX: CGFloat = 0
    @State var offsetY: CGFloat = 0
    @GestureState var isDragging: Bool = false
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack {
                Image(card.imageName)
                    .resizable()
                    .clipped()
                    .frame(width: size.width, height: size.height)
                    
                LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading){
                        HStack {
                            Text(card.name).font(.largeTitle).fontWeight(.bold)
                            Text(String(card.age)).font(.title)
                        }
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green)
                            Text(card.activeStatus[0]).font(.body)
                        }
                        HStack {
                            Image(systemName: "house")
                                .tint(.white)
                            Text(card.state).font(.body)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .offset(x: -60, y: -100)

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                
                HStack {
                    Image("likeLabel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:150)
                        .opacity(Double(offsetX/10 - 1))
                    Spacer()
                    Image("nopeLabel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:150)
                        .opacity(Double(offsetX/10 * -1 - 1))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                
            }
            .cornerRadius(15)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .offset(x: offsetX, y: offsetY)
        .rotationEffect(.init(degrees: getRotation(degree: 8)))
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .updating($isDragging, body: { value, out, _ in
                    out = true
                })
                .onChanged({ value in
                    withAnimation(.default) {
                        let translationX = value.translation.width
                        let translationY = value.translation.height
                        offsetX = (isDragging ? translationX : .zero)
                        offsetY = (isDragging ? translationY : .zero)
                    }
                })
                .onEnded({ value in
                    
                    let width = getRect().width - 50
                    let translationX = value.translation.width
                    
                    let checkingStatus = (translationX > 0 ? translationX : -translationX)
                    
                    //MARK: KHI KÉO HẾT HƠN 1 NỬA ĐỘ RỘNG MÀN HÌNH -> THÌ CARD SẼ ĐC REMOVE QUA TRÁI OR PHẢI
                    withAnimation(.default.speed(0.5)) {
                        if checkingStatus > (width / 2) {
                            
                            offsetX = (translationX > 0 ? width : -width) * 2
                            endSwipAction()
                            
                            //MARK: XỬ LÝ SỰ KIỆN KHI QUẸT TRÁI QUẸT PHẢI
                            if translationX > 0 {
                                rightSwipe()
                            } else {leftSwipe()}
                            
                        } else {
                            offsetX = .zero
                            offsetY = .zero
                        }
                    }
                })
        )
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("ACTION"), object: nil)) { data in
            
            guard let info = data.userInfo else {
                return
            }
            
            let id = info["id"] as? String ?? ""
            let rightSwipe = info["rightSwipe"] as? Bool ?? false
            let width = getRect().width - 50
            
            if card.id == id {
                withAnimation(.default.speed(0.5)) {
                    offsetX = (rightSwipe ? width : -width) * 2
                    endSwipAction()
                    
                    //MARK: XỬ LÝ SỰ KIỆN KHI QUẸT TRÁI QUẸT PHẢI
                    if rightSwipe {
                        self.rightSwipe()
                    } else {leftSwipe()}
                }
            }
            
        }
        
    }
    
    
    func endSwipAction() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let _ = cardData.displayData?.first {
                let _ = withAnimation(.default.speed(0.5)) {
                    cardData.displayData?.removeFirst()
                }
            }
        }
    }
    
    
    func getRotation(degree: Double) -> Double {
        let rotation = (offsetX / (getRect().width - 50)) * degree
        
        return rotation
    }
    
    func leftSwipe() {
        //MARK: LÀM ĐIỀU GÌ ĐÓ Ở BACKEND -> Ở ĐÂY TUI CHỈ CHO PRINT ĐẠI DÒNG NÀY TH NHA
        print("QUET TRAI")
    }
    
    func rightSwipe() {
        //MARK: LÀM ĐIỀU GÌ ĐÓ Ở BACKEND -> Ở ĐÂY TUI CHỈ CHO PRINT ĐẠI DÒNG NÀY TH NHA
        print("QUET PHAI")
    }
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(name: "Gin", imageName: "gin", age: 23, state: "Mexico"))
    }
}
