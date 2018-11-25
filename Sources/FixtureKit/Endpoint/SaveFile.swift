import Foundation

public struct SaveFile: AsyncFixture {
	
	public let path: String
	public let name: String
	public let fixture: EndpointFixture
	
	public init(
		path: String,
		name: String,
		fixture: EndpointFixture
	) {
		self.path = path
		self.name = name
		self.fixture = fixture
	}
	
	public func run() -> Async<Void> {
		return fixture.run().map { result in
				switch result {
				case let .success(data):
					let url = URL(fileURLWithPath: "\(self.path)/\(self.name)")
					try! data.write(to: url)
				case let .failure(error):
					print(error)
				}
			}
	}
}
