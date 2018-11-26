import Foundation

public struct FileEndpointFixture: AsyncFixture {
	
	public let path: String
	public let name: String
	public let `extension`: String
	public let fixture: EndpointFixture

	public init(
		path: String = ".",
		name: String,
		extension: String = "json",
		fixture: EndpointFixture
	) {
		self.path = path
		self.name = name
		self.extension = `extension`
		self.fixture = fixture
	}
	
	public func create() -> Async<Void> {
		return fixture.create().map { result in
				switch result {
				case let .success(data):
					let url = URL(fileURLWithPath: "\(self.path)/\(self.name).\(self.extension)")
					try! data.write(to: url)
				case let .failure(error):
					print(error)
				}
			}
	}
}
