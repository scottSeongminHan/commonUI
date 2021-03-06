//
//  newWidget.swift
//  newWidget
//
//  Created by sungals07 on 2021/10/21.
//

import WidgetKit
import SwiftUI
import Intents

enum WidgetSize {
    case small, medium, large
}

/// 위젯 상태표현
enum Widget14State: String {
    case Login      = "로그인 필요"
    case CanCall    = "호출 가능"
    case Calling    = "호출 중"
    case Inspection = "점검 중"
     
    func getState(_ text: String = "") -> Text {
        
        switch self {
        case .Login:
            return Text("로그인 필요")
                .font(.custom("SpoqaHanSans-Regular", size: 12))
                .bold()
                .foregroundColor(Color(red: 165.0/255.0,
                                       green: 166.0/255.0,
                                       blue: 167.0/255.0))
        case .CanCall:
            return Text("호출 가능")
                .font(.custom("SpoqaHanSans-Regular", size: 12))
                .bold()
                .foregroundColor(Color(red: 59.0/255.0,
                                       green: 62.0/255.0,
                                       blue: 64.0/255.0))
        case .Calling:
            return Text("호출 중")
                .font(.custom("SpoqaHanSans-Regular", size: 12))
                .bold()
                .foregroundColor(Color(red: 59.0/255.0,
                                       green: 62.0/255.0,
                                       blue: 64.0/255.0))
        case .Inspection:
            var msg = "점검 중"
            if text == "fault" {
                msg = "고장"
            } else if text == "parking" {
                msg = "파킹"
            } else if text == "etc" {
                msg = "기타"
            }
            return Text(msg)
                .font(.custom("SpoqaHanSans-Regular", size: 12))
                .bold()
                .foregroundColor(Color(red: 235.0/255.0,
                                       green: 100.0/255.0,
                                       blue: 100.0/255.0))
        }
    }
    
    func getDescription(_ text: String = "") -> Text {
        switch self {
        case .Login:
            return Text("로그인 해주세요")
                .font(.custom("SpoqaHanSans-Bold", size: 20))
                .bold()
                .foregroundColor(Color(red: 165.0/255.0,
                                       green: 166.0/255.0,
                                       blue: 167.0/255.0))
        case .CanCall:
            return Text("호출 버튼을 누르세요")
                .font(.custom("SpoqaHanSans-Bold", size: 20))
                .bold()
                .foregroundColor(Color(red: 59.0/255.0,
                                       green: 62.0/255.0,
                                       blue: 64.0/255.0))
        case .Calling:
            return Text(text)
                .font(.custom("SpoqaHanSans-Bold", size: 20))
                .bold()
                .foregroundColor(Color(red: 52.0/255.0,
                                       green: 190.0/255.0,
                                       blue: 190.0/255.0))
            + Text("층에서 이동 중")
                .font(.custom("SpoqaHanSans-Bold", size: 20))
                .bold()
                .foregroundColor(Color(red: 59.0/255.0,
                                       green: 62.0/255.0,
                                       blue: 64.0/255.0))
        case .Inspection:
            return Text("호출 불가")
                .font(.custom("SpoqaHanSans-Bold", size: 20))
                .bold()
                .foregroundColor(Color(red: 165.0/255.0,
                                       green: 166.0/255.0,
                                       blue: 167.0/255.0))
        }
    }
    
    func getSmallImage() -> UIImage {
        switch self {
        case .Login:
            return UIImage.init(named: "buttonLoginS")!
        case .CanCall:
            return UIImage.init(named: "buttonIdleS")!
        case .Calling:
            return UIImage.init(named: "buttonSignalS")!
        case .Inspection:
            return UIImage.init(named: "buttonDimS")!
        }
    }
    
    func getMediumImage() -> UIImage {
        switch self {
        case .Login:
            return UIImage.init(named: "buttonLoginM")!
        case .CanCall:
            return UIImage.init(named: "buttonIdleM")!
        case .Calling:
            return UIImage.init(named: "buttonSignalM")!
        case .Inspection:
            return UIImage.init(named: "buttonDimM")!
        }
    }
    
    func getLargeImage() -> UIImage {
        switch self {
        case .Login:
            return UIImage.init(named: "buttonLoginL")!
        case .CanCall:
            return UIImage.init(named: "buttonIdleL")!
        case .Calling:
            return UIImage.init(named: "buttonSignalL")!
        case .Inspection:
            return UIImage.init(named: "buttonDimL")!
        }
    }
}


struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct largeView: View {
    var entry: Provider.Entry
    @State var widgetState: Widget14State = .Login
    
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 16)
                VStack(alignment: .leading) {
                    Spacer().frame(height: 16)
                    HStack(alignment: .top) {
                        Image("imgLogo")
                            .resizable()
                            .frame(width: 52, height: 36, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("엘리베이터")
                                .font(.custom("SpoqaHanSans-Bold", size: 12))
                                .bold()
                            
                            widgetState.getState()
                        }
                        .frame(height: 36)
                        Spacer()
                    }
                    Spacer().frame(height: 14)
                    widgetState.getDescription()
                    if widgetState == .Login {
                        Spacer().frame(height: 8)
                        Text("현대 엘리베이터 인증")
                            .font(.custom("SpoqaHanSans-Regular", size: 12))
                            .bold()
                            .foregroundColor(Color(red: 165.0/255.0,
                                                   green: 166.0/255.0,
                                                   blue: 167.0/255.0))
                    }
                    Spacer()
                    
                }
                .frame(height: 112)
                Spacer()
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            ZStack {
                VStack {
                    Button(action: {
                        
                    }) {
                        Image("buttonLoginL")
                            .resizable()
                            .frame(width: 159, height: 159)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image("refresh")
                            .resizable()
                            .frame(width: 36, height: 36)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
    
}

struct mediumView: View {
    var entry: Provider.Entry
    @State var widgetState: Widget14State = .Login
    @State var isShow: Bool = false
    
    var body: some View {
        HStack() {
            Spacer().frame(width: 16)
            VStack(alignment: .leading) {
                Spacer().frame(height: 16)
                HStack(alignment: .top) {
                    Image("imgLogo")
                        .resizable()
                        .frame(width: 52, height: 36, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("엘리베이터")
                            .font(.custom("SpoqaHanSans-Bold", size: 12))
                            .bold()
                        
                        widgetState.getState()
                    }
                    .frame(height: 36)
                    Spacer()
                }
                Spacer().frame(height: 14)
                widgetState.getDescription()
                Spacer()
            }
            .frame(width: 160)
            
            Spacer()
            
            HStack(spacing: -19) {

                VStack {
                    Button(action: {

                    }) {
                        Image("buttonLoginM")
                            .resizable()
                            .frame(width: 110, height: 110)
                    }
                }

                VStack {
                    Spacer()
                    Button(action: {

                    }) {
                        Image("refresh")
                            .resizable()
                            .frame(width: 36, height: 36)
                    }
                }

            }
        }
    
    }
}

struct smallView: View {
    var entry: Provider.Entry
    @State var widgetState: Widget14State = .Login
    @ScaledMetric var size: CGFloat = 1.5
    var body: some View {
        VStack {
            Spacer().frame(height: 16)
            HStack(alignment: .top) {
                Spacer().frame(width: 16)
                Image("imgLogo")
                    .resizable()
                    .frame(width: 52, height: 36, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("엘리베이터")
                        .font(.custom("SpoqaHanSans-Bold", size: 12))
                        .bold()
                    
                    widgetState.getState()
                }
                .frame(height: 36)
                Spacer()
            }
            
            Spacer()
            ZStack {
                VStack {
                    Button(action: {
                        
                    }) {
                        Image("buttonLoginS")
                            .resizable()
                            .frame(width: 80 * size, height: 80 * size)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image("refresh")
                            .resizable()
                            .frame(width: 36, height: 36)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

extension View {
    func requestCheckElevator() {
//        print("requestCheckElevator")
    }
}

struct newWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        
        switch family {
        case .systemSmall:
//            Text("Small")
            smallView(entry: entry)
        case .systemMedium:
//            Text("Medium")
            mediumView(entry: entry)
        case .systemLarge:
//            Text("Large")
            largeView(entry: entry)
        default:
            Text("Some other WidgetFamily in the future.")
        }
    }
}

@main
struct newWidget: Widget {
    let kind: String = "newWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            newWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct newWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            newWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))

            newWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))

            newWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
        .previewLayout(.device)
        .previewDevice("iPhone 8")
    }
}
