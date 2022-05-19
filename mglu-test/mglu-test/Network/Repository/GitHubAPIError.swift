enum GitHubAPIError: Error {
    case requestFailed(Error)
    case genericError
}
