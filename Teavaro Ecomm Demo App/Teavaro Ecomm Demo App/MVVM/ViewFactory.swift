//
//  ViewFactory.swift
//  Teavaro Ecomm Demo App
//
//  Created by Ahmad Mahmoud on 23/06/2022.
//

import SwiftUI

struct ViewFactory<VM: BaseViewModel, Content: View>: View {
    
    @StateObject var viewModel: VM = ViewModelFactory.create(1, 2)
    @ViewBuilder var content: ((VM) -> Content)
   //  private let argumentsFactory: ((_ arg0: Any?, _ arg1: Any?) -> Void)!

//    init(argumentsFactory: @escaping ((VM) -> Void), content: @escaping ((VM) -> Content)) {
//        self.argumentsFactory = argumentsFactory
//        self.content = content
//        self.viewModel = ViewModelFactory.
//    }
    
    var body: some View {
        content(self.viewModel)
    }
}


struct ViewFactory2<VM: BaseViewModel, Content: View>: View {
    
    @StateObject var viewModel: VM = ViewModelFactory.create(1, 2)
    @ViewBuilder var content: ((VM) -> Content)
   //  private let argumentsFactory: ((_ arg0: Any?, _ arg1: Any?) -> Void)!

//    init(argumentsFactory: @escaping ((VM) -> Void), content: @escaping ((VM) -> Content)) {
//        self.argumentsFactory = argumentsFactory
//        self.content = content
//        self.viewModel = ViewModelFactory.
//    }
    
    var body: some View {
        content(self.viewModel)
    }
}

//struct FG: ViewModelProvider<CheckoutViewModel>, View {
//
//    var body: some View {
//        Form {
//
//        }
//    }
//}

//struct FG: DD {
//
//}
//
//class DD {
//
//}

//class GGGFG<VM: BaseViewModel, Content: View> {
//
//    @StateObject var viewModel: VM
//    private var args: [Any] = []
//
//
//
//    func create(content: @escaping ((VM) -> Content)) -> some View {
//        // let fff = GGGFG()
//        content(viewModel)
//    }
//}

//struct Test123 {
//
//    func aaa() -> some View {
//        GGGFG().create() { (vm: CheckoutViewModel) in
//            Form {
//
//            }
//        }
//    }
//}

class ViewModelProvider<VM: BaseViewModel> {
    
    let viewModel: VM!
    
    init(_ arg0: Any? = nil, _ arg1: Any? = nil) {
        self.viewModel = ViewModelFactory.create(arg0, arg0)
    }
}

typealias BaseView<VM: BaseViewModel> = ViewModelProvider<VM> & View
