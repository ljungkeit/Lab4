import Foundation
// MARK: - Entities

//Bridge Entity, has key for an author and a book, as books can have multiple authors, and authors can write multiple books.
struct Writes: Codable {
    let writesID: Int  //Primary Key
    let authorID: Int  // Foreign Key
    let bookID: Int // Foreign Key
    let date: Date
}
struct Author: Codable {
    let authorID: Int //Primary Key
    let firstName: String
    let lastName: String
}
// M:1, many books can have 1 author
struct Book: Codable {
    let bookID: Int //Primary Key
    let genre: String
    let title: String
    let publicationDate: Date
}
// 1:M. one member has many loans
struct Member: Codable {
    let memberID: Int //Primary Key
    let firstName: String
    let lastName: String
    let email: String
    let isActive: Bool
}

//Bridge Entity, has a key for the book and the member involved to handle two 1:M relationships.
struct Loan: Codable {
    let loanID: Int // Primary Key
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
    Author(authorID: 1, firstName: "Rick", lastName: "Riordan"),
    Author(authorID: 2, firstName: "Stephen", lastName: "King")
]

let books: [Book] = [
    Book(bookID: 1, genre: "fantasy", title: "Percy Jackson", publicationDate: formatter.date(from: "2005-06-28")!),
    Book(bookID: 2, genre: "Horror", title: "The Shining", publicationDate: formatter.date(from: "1997-01-28")!)
]
let writings: [Writes] = [
    Writes(writesID: 1, authorID: 1, bookID: 1, date: formatter.date(from: "2005-01-02")!),
    Writes(writesID: 2, authorID: 2, bookID: 2, date: formatter.date(from: "1996-04-13")!)
]
let members: [Member] = [
    Member(memberID: 1, firstName: "Luca", lastName: "Jungkeit", email: "ljungkeit@vt.edu", isActive: true),
    Member(memberID: 2, firstName: "Rayan", lastName: "Charah", email: "rayancharah@vt.edu", isActive: true)
]
let loans: [Loan] = [
    Loan(loanID: 1, bookID: 1, memberID: 1,
         loanDate: formatter.date(from: "2026-04-01")!,
         dueDate: formatter.date(from: "2026-04-15")!,
         returnDate: formatter.date(from: "2026-04-10")!),
    Loan(loanID: 2, bookID: 2, memberID: 1,
         loanDate: formatter.date(from: "2026-04-20")!,
         dueDate: formatter.date(from: "2026-05-04")!,
         returnDate: nil),
    Loan(loanID: 3, bookID: 1, memberID: 2,
         loanDate: formatter.date(from: "2026-05-01")!,
         dueDate: formatter.date(from: "2026-05-15")!,
         returnDate: formatter.date(from: "2026-05-14")!),
    Loan(loanID: 4, bookID: 2, memberID: 2,
         loanDate: formatter.date(from: "2026-06-01")!,
         dueDate: formatter.date(from: "2026-06-15")!,
         returnDate: nil)
]
