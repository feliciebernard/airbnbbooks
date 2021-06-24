require 'faker'

BOOKS_NUM = 10
USERS_NUM = 5
OWN_BOOKS_NUM = 10
LOANS_NUM = 10

CITIES_NUM = 5



def reset_database(tables_name)
  tables_name.each do |table_name|
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
  end
end

def status_creation(object_created, object_name, idx_object)
  if object_created.valid?
    puts "#{object_name} n°#{idx_object} has been successffuly created."
  else
    puts "something wrong happend with the #{idx_object} #{object_name} created."
    print 'Errors: ' << object_created.errors.full_messages.join(' | ') << '\n'
  end
end

def create_books(nb_books)
  nb_books.times do |idx_book|

    isbn = Faker::Number.between(from: 9780000000, to: 9799999999)
    title = Faker::Book.title
    authors = Faker::Book.author
    publisher = Faker::Book.publisher
    published_date = Faker::Date.between(from: 200.years.ago, to: Date.today)
    language = Faker::Nation.language
    description = Faker::Lorem.paragraph(sentence_count: rand(2..5))
    image_link = "https://res.cloudinary.com/dcmcouvju/image/upload/v1624045770/nocover2_o33zpf.jpg"

    book = Book.create(isbn: isbn, title: title, authors: authors, publisher: publisher, published_date: published_date, language: language, description:description, image_link:image_link)
    puts "--------------- Book n°#{idx_book} ----------------\n\n"

    status_creation(book, 'book', idx_book)
  end
end



def create_users_and_private_addresses(nb_users)
  nb_users.times do |idx_user|

    name = Faker::Name.female_first_name
    email = Faker::Internet.email(domain: 'yopmail.com')
    password = Faker::Internet.password(min_length: 8, max_length: 15)
    biography = Faker::Lorem.paragraph(sentence_count: rand(1..3))
    street_name = Faker::Address.street_address
    other_information = Faker::Address.secondary_address

    city = City.all.sample
    private_address = PrivateAddress.create(street_name: street_name, other_information: other_information, city: city)
    user = User.create(name: name, email: email, password: password, biography: biography, private_address: private_address)
    private_address.update(user: user)
    
    puts "--------------- User & PrivateAddress n°#{idx_user} ----------------\n\n"

    status_creation(user, 'user', idx_user)
    status_creation(private_address, 'private_address', idx_user)
  end
end


def create_own_books(nb_own_books)
  nb_own_books.times do |idx_ownbook|

    review = Faker::Lorem.sentences(number: rand(2..5))
    appreciation = rand(0..5)
    user = User.all.sample
    book = Book.all.sample
    genre = ["Fiction", "Enfant", "Historique", "Bandes-Dessinées", "Philosophie", "Loisirs"].sample

    own_book = OwnBook.create(review: review, appreciation: appreciation, available: true, user: user, book: book, genre: genre)
    puts "--------------- OwnBook n°#{idx_ownbook} ----------------\n\n"
    status_creation(own_book, 'own_book', idx_ownbook)
  end
end

def create_loans(nb_loans)
  nb_loans.times do |idx_loan|

    own_book = OwnBook.all.sample
    lender = User.all.sample
    borrower = User.all.sample
    is_past = false
    is_accepted = false

    loan = Loan.create(own_book: own_book, lender: lender, borrower: borrower, is_past: is_past, is_accepted: is_accepted)
    puts "--------------- Loan n°#{idx_loan} ----------------\n\n"
    status_creation(loan, 'loan', idx_loan)

  end
end


def create_cities(nb_city)
  nb_city.times do |idx_city|

    name = Faker::Address.city
    zip_code = Faker::Address.zip_code

    city = City.create(name: name, zip_code: zip_code)
    puts "--------------- City n°#{idx_city} ----------------\n\n"
    status_creation(city, 'city', idx_city)
  end
end



def create_database
  create_cities(CITIES_NUM)
  create_users_and_private_addresses(USERS_NUM)
  create_books(BOOKS_NUM)
  create_own_books(OWN_BOOKS_NUM)
  create_loans(LOANS_NUM)
end

def perform
  tables = ['cities', 'private_addresses', 'users', 'books', 'own_books', 'loans']
  reset_database(tables)
  create_database
end

perform
