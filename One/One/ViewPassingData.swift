//
//  ViewPassingData.swift
//  One
//
//  Created by cyzone on 2020/8/10.
//

import SwiftUI


//From parent to direct child – use an initializer.
//From parent to distant child – use @Environment.
//From child to direct parent – use @Binding and callbacks.
//From child to distant parent – use PreferenceKey.
//Between children – lift the state up.

/// SwiftUI

//1.父视图到直接子视图  --- 通过子视图的构造方法进行数据传递

//2.父视图到非直接子视图(可能间隔好几层) --- 通过Environment

//3.从子视图到直接父视图  回调 &&  @Binding
//@Binding 允许我们声明一个属性，该属性由父级拥有，但父级和子级均可更改，从而有效地前后传递该更改。

//4.从子视图到非直接父视图 PreferenceKey

//实现custom PreferenceKey，这是视图产生的命名值。
////为首选项提供默认值，并提供reduce()一种将所有子值组合成对其父级可见的单个值的方法
//在子视图中，附加一个键值对。
//在父视图中，附加一个回调，以跟踪对此首选项的更改。


struct ViewPassingData: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ViewPassingData_Previews: PreviewProvider {
    static var previews: some View {
        ViewPassingData()
    }
}



protocol ImageCache {
    subscript(_ key: String) -> UIImage? { get set }
}

struct TemporaryImageCache: ImageCache {
    private let cache = NSCache<NSString, UIImage>()
    
    subscript(_ key: String) -> UIImage? {
        get { cache.object(forKey: key as NSString) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSString) : cache.setObject(newValue!, forKey: key as NSString) }
    }
}

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}


struct AlertPreferenceKey: PreferenceKey {
    static var defaultValue: PresentableAlert?

    static func reduce(value: inout PresentableAlert?, nextValue: () -> PresentableAlert?) {
        value = nextValue()
    }
}

//允许SwiftUI确定差异并仅在首选项发生更改时才调用父级
struct PresentableAlert: Equatable, Identifiable {
    
    let id = UUID()
    let title: String
    let message: String?
    
    static func == (lhs: PresentableAlert, rhs: PresentableAlert) -> Bool {
        lhs.id == rhs.id
    }
}
//preference(key:value:)将警报传递到视图树上：
struct ViewWithAlert: View {
    @State private var alert: PresentableAlert?
    
    var body: some View {
        Button("Show alert", action: { self.alert = PresentableAlert(title: "Title", message: "Message") })
            .preference(key: AlertPreferenceKey.self, value: alert)
    }
}


struct PreferenceKeyTest: View {
    @State private var alert: PresentableAlert?
    
    var body: some View {
        HelloWorldView()
            .onPreferenceChange(AlertPreferenceKey.self) { self.alert = $0 }
            .alert(item: $alert) { alert in
                Alert(title: Text(alert.title), message: alert.message.map(Text.init))
        }
    }
}

struct HelloWorldView: View {
    
    var body: some View {
        ZStack {
            Color.yellow
            VStack {
                Text("Hello, World!")
                ViewWithAlert()
            }
        }
    }
}
