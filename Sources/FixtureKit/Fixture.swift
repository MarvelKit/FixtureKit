public protocol Fixture {}

public protocol AsyncFixture: Fixture {
	associatedtype Value
	func run() -> Async<Value>
}
