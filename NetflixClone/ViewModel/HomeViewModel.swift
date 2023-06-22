//
//  HomeViewModel.swift
//  NetflixClone
//
//  Created by DuongNV4.DLS on 29/05/2023.
//

import SwiftUI
import Combine

protocol UnidirectionalDataFlowType {
    associatedtype InputType

    func apply(_ input: InputType)
}


final class HomeViewModel: ObservableObject, UnidirectionalDataFlowType {

    typealias InputType = Input

    private var cancellables: [AnyCancellable] = []

    // MARK: Input

    enum Input {
        case onAppear
    }

    func apply(_ input: Input) {
        switch input {
        case .onAppear: onAppearSubject.send(())
        }
    }

    private let onAppearSubject = PassthroughSubject<Void, Never>()

    @Published private(set) var popularMovies: [Movie] = []
    @Published var isShowError = false
    @Published var errorMessage = ""

    private let popularMoviesResponseSubject = PassthroughSubject<PopularMovies, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()

    private let apiService: APIService

    init(apiService: APIService = APIService()) {
        self.apiService = apiService

        bindInputs()
        bindOutputs()
    }

    private func bindInputs() {
        let request = PopularMovieRequest()
        let responsePublisher = onAppearSubject
            .flatMap { [apiService] in
                apiService.response(from: request)
                    .catch { [weak self] error -> Empty<PopularMovies, Never> in
                        self?.errorSubject.send(error)
                        return .init()
                    }
            }

        let responseStream = responsePublisher
            .share()
            .subscribe(popularMoviesResponseSubject)

        cancellables += [responseStream]
    }

    private func bindOutputs() {
        let popularMoviesUpstream = popularMoviesResponseSubject
            .map {  $0.results }
            .breakpoint(receiveOutput: { res in
                print(res)
                return false
            })
            .assign(to: \.popularMovies, on: self)

        let errorMessageStream = errorSubject
            .map { error -> String in
                switch error {
                case .responseError: return "network error"
                case .parseError: return "parse error"
                }
            }
            .assign(to: \.errorMessage, on: self)

        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isShowError, on: self)

        cancellables += [popularMoviesUpstream, errorMessageStream, errorStream]
    }
}
