require 'faker'

BOOKS_NUM = 10
USERS_NUM = 5
OWN_BOOKS_NUM = 10
LOANS_NUM = 10
PRIVATE_ADDRESSES = 5
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

    isbn = Faker::Number.between(from: 9790000000000, to: 9799999999999)
    title = Faker::Book.title
    authors = Faker::Book.author
    publisher = Faker::Book.publisher
    published_date = Faker::Date.between(from: 200.years.ago, to: Date.today)
    language = Faker::Nation.language
    categories = Faker::Book.genre
    description = Faker::Lorem.sentences(number: rand(2..5))
    image_link = "https://res.cloudinary.com/dcmcouvju/image/upload/v1624045770/nocover2_o33zpf.jpg"

    book = Book.create(isbn: isbn, title: title, authors: authors, publisher: publisher, published_date: published_date, language: language, categories:categories, description:description, image_link:image_link)
    puts "--------------- Book n°#{idx_book} ----------------\n\n"

    status_creation(book, 'book', idx_book)
  end
end



def create_users(nb_users)
  nb_users.times do |idx_user|

    name = Faker::Name.female_first_name
    email = Faker::Internet.email(domain: 'yopmail.com')
    password = Faker::Internet.password(min_length: 8, max_length: 15)
    biography = Faker::Lorem.sentences(number: rand(1..3))
    private_address = PrivateAddress.all.sample

    user = User.create(name: name, email: email, password: password, biography: biography, private_address: private_address)
    puts "--------------- User n°#{idx_user} ----------------\n\n"

    status_creation(user, 'user', idx_user)
  end
end

def create_own_books(nb_own_books)
  nb_own_books.times do |idx_ownbook|

    review = Faker::Lorem.sentences(number: rand(2..5))
    appreciation = rand(0..5)
    user = User.all.sample
    book = Book.all.sample

    own_book = OwnBook.create(review: review, appreciation: appreciation, available: true, user: user, book: book)
    puts "--------------- OwnBook n°#{idx_ownbook} ----------------\n\n"
    status_creation(own_book, 'own_book', idx_ownbook)
  end
end

def create_loans(nb_loans)
  nb_loans.times do |idx_loan|

    own_book = OwnBook.all.sample
    lender = User.all.sample
    borrower = User.all.sample

    loan = Loan.create(own_book: own_book, lender: lender, borrower: borrower)
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

def create_private_addresses(nb_private_address)
  nb_private_address.times do |idx_private_address|

    street_name = Faker::Address.street_address
    other_information = Faker::Address.secondary_address
    user = User.all.sample
    city = City.all.sample

    private_address = PrivateAddress.create(street_name: street_name, other_information: other_information, user: user, city: city)
    puts "--------------- PrivateAdress n°#{idx_private_address} ----------------\n\n"
    status_creation(private_address, 'private_address', idx_private_address)
  end
end

def create_database
  create_books(BOOKS_NUM)
  create_users(USERS_NUM)
  create_own_books(OWN_BOOKS_NUM)
  create_loans(LOANS_NUM)
  create_cities(CITIES_NUM)
  create_private_addresses(PRIVATE_ADDRESSES)
end

def perform
  tables = ['books', 'users', 'own_books', 'loans', 'cities', 'private_addresses']
  reset_database(tables)
  create_database
end

perform
