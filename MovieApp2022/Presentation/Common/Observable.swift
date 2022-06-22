import Foundation

@propertyWrapper
public struct Observable<T> {
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    private final class Store<T> {
        var actions: [(T) -> Void] = []
    }
    
    private let store = Store<T>()
    
    public var projectedValue: Observable<T> { self }
    
    public var wrappedValue: T {
        didSet {
            store.actions.forEach {
                $0(wrappedValue)
            }
        }
    }
    
    public func bind(fire: Bool = false, action: @escaping (T) -> Void) {
        store.actions.append(action)
        if fire {
            action(wrappedValue)
        }
    }
    
    public func dispose() {
        store.actions.removeAll()
    }
    
    static func dispose(_ list: [Observable]) {
        list.forEach { $0.dispose() }
    }
}
