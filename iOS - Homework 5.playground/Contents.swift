import Cocoa

var greeting = "Hello, playground"


//1

enum DayOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}
func isWeekDay(day: DayOfWeek) -> String {
    switch day {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        return "it's a working day"
    case .saturday, .sunday:
        return "it's a day off"
    }
}
var today = DayOfWeek.monday
let message = isWeekDay(day: today)
print(message)

//2
//*
enum Weather {
    case sunny (celsius: Double)
    case cloudy (celsius: Double)
    case rainy (celsius: Double)
    case snowy (celsius: Double)
}

func dressForWeather(weather: Weather) -> String {
    switch weather {
    case .sunny(let celsius):
        if celsius >= 25.0 {
            return "It's sunny and hot. can dress up t-shirt or dress"
        } else {
            return "It's sunny but cool. Wear a jacket."
        }
    case .cloudy(let celsius):
        if celsius >= 20.0 {
            return "It's cloudy but warm. Wear a jacket."
        } else {
            return "It's cloudy and cool. Wear Sweater."
        }
    case .rainy(let celsius):
        if celsius >= 15.0 {
            return "It's rainy and warm. Don't forget an umbrella."
        } else {
            return "It's rainy and cool. Dress warmly and Don't forget an umbrella."
        }
    case .snowy(let celsius):
        if celsius >= 5.0 {
            return "It's snowing. Dress warmly."
        } else {
            return "It's snowing and cold. dress up very warm clothes."
        }
    }
}
let sunnyWeather = Weather.sunny(celsius: 30.0)
let cloudyWeather = Weather.cloudy(celsius: 18.0)
let rainyWeather = Weather.rainy(celsius: 10.0)
let snowyWeather = Weather.snowy(celsius: -5.0)

print(dressForWeather(weather: sunnyWeather))
print(dressForWeather(weather: cloudyWeather))
print(dressForWeather(weather: rainyWeather))
print(dressForWeather(weather: snowyWeather))

//3

struct Book {
    var title : String
    var author : String
    var publicationYear: Int
    
    init(title: String, author: String, publicationYear: Int) {
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
    }
    
}

func filterBooksAfter2000(books: [Book]) -> [Book] {
    let filteredBooks = books.filter
    { $0.publicationYear>=2000}
    return filteredBooks
}
var book1: Book = Book(title: "theFall", author: "albertCamus", publicationYear: 1956)
var book2: Book = Book(title: "steppenwolf", author: "hermannHesse", publicationYear: 1927)
var book3: Book = Book(title: "99franks", author:"fredericBeigbeder", publicationYear: 2000)
var bookCollection: [Book] = [book1, book2, book3]

let filtered = filterBooksAfter2000(books: bookCollection)
print(filtered)


//4

struct BankAccount {
    var holderName : String
    var accountNumber : Int
    var balance: Double
    
    init(holderName: String, accountNumber: Int, balance: Double) {
        self.holderName = holderName
        self.accountNumber = accountNumber
        self.balance = balance
    }
    mutating func deposit(amount: Double) {
        if amount > 0 {
            balance += amount
            print("Deposited \(amount) dollars. New balance is \(balance) dollars.")
        } else {
            print("Invalid deposit amount.")
        }
    }
    
    mutating func withdraw(amount: Double) {
        if amount > 0 {
            if amount <= balance {
                balance -= amount
                print("Withdrawn \(amount) dollars. New balance is \(balance) dollars.")
            } else {
                print("You can't withdraw more than your balance.")
            }
        }
    }
}

var myAccount = BankAccount(holderName: "johnny depp", accountNumber: 1122334455, balance: 1000.0)
myAccount.deposit(amount: 500.0)
myAccount.withdraw(amount: 1300.0)
print(myAccount)

//5
enum Genre {
    case rock
    case classic
    case pop
    case jazz
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    var description: String {
        return "\(title) by \(artist), \(duration) minutes, Genre: \(genre)"
    }
    
    lazy var publisher: String = {
        return "\(artist) Publishing Company"
    }()
    
    init(title: String, artist: String, duration: Double, genre: Genre, description: String) {
        self.title = title
        self.artist = artist
        self.duration = duration
        self.genre = genre
        // self.description = description
    }
}

func filterSongsByGenre(playlist: [Song], genre: Genre) -> [Song] {
    let filteredSongs = playlist.filter { $0.genre == genre }
    return filteredSongs
}

var playlist: [Song] = [
    Song(title: "Song1", artist: "Artist1", duration: 4.5, genre: .rock, description: ""),
    Song(title: "Song2", artist: "Artist2", duration: 3.2, genre: .classic, description: ""),
    Song(title: "Song3", artist: "Artist3", duration: 5.7, genre: .pop, description: ""),
    Song(title: "Song4", artist: "Artist4", duration: 2.8, genre: .jazz, description: ""),
]

let filteredRockSongs = filterSongsByGenre(playlist: playlist, genre: .rock)
for song in filteredRockSongs {
    print(song.description)
}
