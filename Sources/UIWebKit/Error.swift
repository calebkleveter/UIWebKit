public enum RenderError: Error {
    case failedStringToData
}

public enum FileCreationError: Error {
    case noDroplet
    case dataCannotWrite
    case fileNonExisting
}
