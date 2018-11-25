import Foundation

public func saveJSONFile(fileName: String) -> (EndpointFixture) -> Async<Result<Void, EndpointFixture.Error>> {
	return { fixture in
		fixture
			.run()
			.map(save(fileName: fileName))
	}
}

private func save(fileName: String) -> (Result<Data, EndpointFixture.Error>) -> Result<Void, EndpointFixture.Error> {
	return { result in
		result.map {
			let url = URL(fileURLWithPath: "/\(fileName).json")
			try! $0.write(to: url)
		}
	}
}
