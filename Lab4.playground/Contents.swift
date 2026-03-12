import Foundation

struct Author: Codable {
    let id: Int //Primary Key
    let firstName: String
    let lastName: String
}

struct Book: Codable {
    let id: Int //Primary Key
    let genre: String
    let title: String
    let publicationDate: Date
    let authorID: Int //Foreign Key
}

struct Member: Codable {
    let id: Int //Primary Key
    let firstName: String
    let lastName: String
    let email: String
    let isActive: Bool
}

//M:M Connector, has a key for the book and the member involved.
struct Loan: Codable {
    let id: Int // Primary Key
    let bookID: Int  //Foreign Key
    let memberID: Int  //Foreign Key
    let loanDate: Date
    let dueDate: Date
    let returnDate: Date?
}
