import Foundation
// MARK: - Entities
// 1:M, one author can have many books
struct Author: Codable {
    let id: Int //Primary Key
    let firstName: String
    let lastName: String
}
// M:1, many books can have 1 author
struct Book: Codable {
    let id: Int //Primary Key
    let genre: String
    let title: String
    let publicationDate: Date
    let authorID: Int //Foreign Key
}
// 1:M. one member has many loans
struct Member: Codable {
    let id: Int //Primary Key
    let firstName: String
    let lastName: String
    let email: String
    let isActive: Bool
}

//Bridge Entity, has a key for the book and the member involved to handle two 1:M relationships.
struct Loan: Codable {
    let id: Int // Primary Key
    let bookID: Int  //Foreign Key
    let memberID: Int  //Foreign Key
    let loanDate: Date
    let dueDate: Date
    let returnDate: Date?
}
// MARK: - Sample Data
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd"

let authors: [Author] = [
    Author(id: 1, firstName: "Rick", lastName: "Riordan"),
    Author(id: 2, firstName: "Stephen", lastName: "King")
]

let books: [Book] = [
    Book(id: 1, genre: "fantasy", title: "Percy Jackson", publicationDate: formatter.date(from: "2005-07-28")!, authorID: 1),
    Book(id: 2, genre: "Horror", title: "The Shining", publicationDate: formatter.date(from: "1997-01-28")!, authorID: 2)
]

let members: [Member] = [
    Member(id: 1, firstName: "Luca", lastName: "Jungkeit", email: "ljungkeit@vt.edu", isActive: true),
    Member(id: 2, firstName: "Rayan", lastName: "Charah", email: "rayancharah@vt.edu", isActive: true)
]

let loans: [Loan] = [
    Loan(id: 1, bookID: 1, memberID: 1,
         loanDate: formatter.date(from: "2026-04-01")!,
         dueDate: formatter.date(from: "2026-04-15")!,
         returnDate: formatter.date(from: "2026-04-10")!),
    Loan(id: 2, bookID: 2, memberID: 1,
         loanDate: formatter.date(from: "2026-04-20")!,
         dueDate: formatter.date(from: "2026-05-04")!,
         returnDate: nil),
    Loan(id: 3, bookID: 1, memberID: 2,
         loanDate: formatter.date(from: "2026-05-01")!,
         dueDate: formatter.date(from: "2026-05-15")!,
         returnDate: formatter.date(from: "2026-05-14")!),
    Loan(id: 4, bookID: 2, memberID: 2,
         loanDate: formatter.date(from: "2026-06-01")!,
         dueDate: formatter.date(from: "2026-06-15")!,
         returnDate: nil)
]
