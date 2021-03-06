//
//  HomeView.swift
//  CardX
//
//  Created by 罗麟瑞 on 2022/4/16.
//

import SwiftUI
import ExytePopupView
import SwiftUIVisualEffects

struct HomeView: View {
    @State private var widgetName = ""
    @State private var isPopupOpen = false
    @Environment(\.openURL) var openURL
    
    let cardModels: [HomePageCardModel] = [
        HomePageCardModel("star.fill",
                          [String(localized: "Intro to widget")],
                          [.yellow, .orange],
                          String(localized: "https://support.apple.com/en-us/HT207122")),
        HomePageCardModel("ipad",
                          [String(localized: "Use on iPad")],
                          [.green, .cyan],
                          String(localized: "https://support.apple.com/en-us/HT211328")),
        HomePageCardModel("square.stack",
                          [String(localized: "Widget features")],
                          [.pink, .red],
                          String(localized: "https://eshop.macsales.com/blog/78194-ios-15-feature-roundup-widgets/"))
    ]
    
    let supportedWidgetsModel: [HomePageSupportedWidgetsModel] = [
        HomePageSupportedWidgetsModel(String(localized: "Environment"), [
            "Weather Widget"]),
        HomePageSupportedWidgetsModel(String(localized: "Images"), [
            "Random Photo Widget",
            "Random Animal Photo Widget"]),
        HomePageSupportedWidgetsModel(String(localized: "Random things"), [
            "Random Pokemon Widget",
            "Random Music Widget",
            "Movie Recommend Widget",
            "Random Word Widget",
            "Random Quote Widget"]),
        HomePageSupportedWidgetsModel(String(localized: "Knowledge"), [
            "Today In History Widget",
            "Useless Facts Widget"])
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ScrollView(.horizontal){
                        HStack(spacing: 25){
                            ForEach(0..<self.cardModels.count, id: \.self){
                                index in
                                
                                let model = self.cardModels[index]
                                
                                ZStack{
                                    ZStack{
                                        Image(systemName: model.sysIcon)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 45, height: 45, alignment: .topLeading)
                                            .padding(30)
                                    }
                                    .frame(width: 250, height: 250, alignment: .topLeading)
                                    VStack(alignment: .leading){
                                        ForEach(model.texts, id: \.self){
                                            Text($0)
                                                .font(.largeTitle)
                                                .bold()
                                        }
                                    }
                                    .padding(30)
                                    .frame(width: 250, height: 250, alignment: .bottomLeading)
                                }
                                .background(
                                    LinearGradient(gradient: Gradient(colors: model.colors), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 250, height: 250)
                                .cornerRadius(40)
                                .shadow(radius: 10)
                                .onTapGesture {
                                    openURL(URL(string: model.link)!)
                                }
                            }
                        }
                        .ignoresSafeArea()
                        .padding(30)
                    }
                    .padding([.top])
                    
                    ZStack{
                        HStack{
                            VStack(alignment: .leading){
                                VStack(alignment: .leading){
                                    Text("FAQ")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.white)
                                }
                                .padding()
                                Text("If you are still feeling confused after read the intro card. You can take a look at the FAQ page created by Widgetsmith!")
                                    .foregroundColor(.white)
                                    .padding([.leading, .vertical])
                                
                            }
                            .padding()
                            
                            Spacer()
                        }
                    }
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.cyan, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(40)
                    .padding()
                    .shadow(radius: 10)
                    .onTapGesture {
                        openURL(URL(string: "https://david-smith.org/widgetsmith-faq.html")!)
                    }
                    
                    ZStack{
                        HStack{
                            VStack(alignment: .leading){
                                VStack(alignment: .leading){
                                    Text("Supported")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.white)
                                    Text("Widgets")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.white)
                                }
                                .padding()
                                Text("Here is the list of the widgets we are currently supported:")
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                
                                List{
                                    ForEach(0..<self.supportedWidgetsModel.count, id: \.self){
                                        index in
                                        
                                        let item = self.supportedWidgetsModel[index]
                                        
                                        Section(header: Text(item.section)){
                                            ForEach(0..<item.items.count, id: \.self){
                                                i in
                                                
                                                let widget  = item.items[i]
                                                
                                                Text(LocalizedStringKey(widget).stringValue())
                                                    .onTapGesture{
                                                        self.isPopupOpen = true
                                                        self.widgetName = widget
                                                    }
                                            }
                                        }
                                        .listRowBackground(BlurView(style: .light))
                                    }
                                }
                                .listStyle(.insetGrouped)
                                .onAppear {
                                    UITableView.appearance().backgroundColor = .clear
                                }
                                
                            }
                            .padding()
                            
                            Spacer()
                        }
                    }
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(height: 600)
                    .cornerRadius(40)
                    .padding()
                    .shadow(radius: 10)
                    
                    Spacer()
                }
            }
            .navigationTitle("Home")
            .popup(isPresented: $isPopupOpen, type: .toast, position: .bottom){
                DraggableCardView(topPadding: 300, fixedHeight: true) {
                    WidgetDetailView(widgetName: $widgetName)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.locale, .init(identifier: "en"))
    }
}
