//
//  ViewModelFactory.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 23/06/2022.
//

class ViewModelFactory {
    
    static func create<VM: BaseViewModel>(_ arg0: Any? = nil, _ arg1: Any? = nil) -> VM {
        return Resolver.resolve()
    }
}

//import SwiftUI
//
//protocol ViewModelFactory2 {
//
//    associatedtype VM: BaseViewModel
//    //  @StateObject var viewModel: VM { get set }
//
//    static func create() -> Self
//}
//
//extension ViewModelFactory2 {
//
//    static func create(_ arg0: Any? = nil, _ arg1: Any? = nil) -> Self {
//        return Resolver.resolve()
//    }
//}

//final class FFFF<VM: BaseViewModel>: View {
//   
//    @StateObject var viewModel: VM = ViewModelFactory.create()
//        
//    
//    init(arg0: Any? = nil, _ arg1: Any? = nil) {
//        self.viewModel = ViewModelFactory.create(arg0, arg1)
//    }
//    
//    var body: some View {
//        NavigationView {
//            
//        }
//    }
//}

// typealias GF = FFFF<String>


//protocol IView {
//    associatedtype VM: BaseViewModel
//    var viewModel: VM { get set }
//    init()
//    init(viewModel: VM)
//}
//
//extension IView {
//    // var viewModel: VM { BaseViewModel() }
//    init(viewModel: VM) {
//        self.viewModel = viewModel
//        self.init()
//    }
//    
//    static func create(arg0: Any? = nil, _ arg1: Any? = nil) {
//        let view = Self.init()
//        //       // self.viewModel = ViewModelFactory.create(arg0, arg1)
//    }
//}


//struct GH: IView {
//    var viewModel: CheckoutViewModel
//    typealias VM = CheckoutViewModel
//    
//    
//    var body: some View {
//        NavigationView {
//            
//        }
//    }
//}
