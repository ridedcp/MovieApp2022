import Foundation

public struct Empty: Equatable {
    fileprivate init() {
    }
}

public enum Resource<T: Equatable>: Equatable {
    case loading(show: Bool = true)
    case success(T)
    case failure(String)
    
    public func data() -> T? {
        switch self {
        case .loading:
            return .none
            
        case .failure:
            return .none
            
        case .success(let value):
            return value
        }
    }
    
    public func error() -> String? {
        switch self {
        case .loading:
            return .none
            
        case .failure(let error):
            return error
            
        case .success:
            return .none
        }
    }
    
    public static func successEmpty() -> Resource<Empty> {
        return Resource<Empty>.success(Empty())
    }
    
    public static func failureErrorNotConnection<T>() -> Resource<T> {
        return Resource<T>.failure("general_no_internet_modal_text")
    }
    
    public static func failureErrorUnknown<T>() -> Resource<T> {
        return Resource<T>.failure("general_server_error_popup_text")
    }
    
    public static func == (lhs: Resource<T>, rhs: Resource<T>) -> Bool {
        switch (lhs, rhs) {
        case (.success(let value1), .success(let value2)):
            return value1 == value2
        case (.failure(let failure1), .failure(let failure2)):
            return failure1 == failure2
        case (.loading(show: let show1), .loading(show: let show2)):
            return show1 == show2
        default:
            return false
        }
    }
}
