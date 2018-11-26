public protocol Fixture {}

public protocol AsyncFixture: Fixture {
	associatedtype Value
	func create() -> Async<Value>
}
