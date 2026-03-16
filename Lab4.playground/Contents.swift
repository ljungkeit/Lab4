import Foundation
// MARK: - Entities

//Bridge Entity, has key for an author and a draft, as publications can have multiple authors, and authors can write multiple books.
struct Publication: Codable {
    let authorID: Int  // Primary & Foreign Key
    let draftID: Int // Primary & Foreign Key
    let publicationDate: Date
}
struct Author: Codable {
    let id: Int //Primary Key
    let firstName: String
    let lastName: String
}
// M:1, many books can have 1 author
struct Draft: Codable {
    let id: Int //Primary Key
    let genre: String
    let title: String
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

let drafts: [Draft] = [
    Draft(id: 1, genre: "fantasy", title: "Percy Jackson"),
    Draft(id: 2, genre: "Horror", title: "The Shining")
]
let publications: [Publication] = [
    Publication(authorID: 1, draftID: 1, publicationDate: formatter.date(from: "2005-06-28")!),
    Publication(authorID: 2, draftID: 2, publicationDate: formatter.date(from: "1997-01-28")!)
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
