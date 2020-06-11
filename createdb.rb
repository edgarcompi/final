# Set up for the application and database. DO NOT CHANGE. #############################
require "sequel"                                                                      #
connection_string = ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite3"  #
DB = Sequel.connect(connection_string)                                                #
#######################################################################################

# Database schema - this should reflect your domain model
DB.create_table! :events do
  primary_key :id
  String :title
  String :description, text: true
  String :location
  String :contact
end
DB.create_table! :rsvps do
  primary_key :id
  foreign_key :event_id
  Number :going
  String :name
  String :email
  String :comments, text: true
end

DB.create_table! :users do
  primary_key :id
  String :name
  String :email
  String :password
end

# Insert initial (seed) data
events_table = DB.from(:events)

events_table.insert(title: "MO Jakarta", 
                    description: "Conveniently located in the financial and diplomatic district, Mandarin Oriental, Jakarta is the most luxurious hotel in this exciting city. With stunning rooms, fantastic facilities and five-star service, there really is nowhere better to stay.",
                    location: "JALAN M.H. THAMRIN",
                    contact: "MOJKT-RESERVATIONS@MOHG.COM")
                    

events_table.insert(title: "MO Singapore", 
                    description: "Shaped like our iconic fan, Mandarin Oriental, Singapore is a five-star luxury hotel in Marina Bay. Only minutes from the central business district and with a choice of fabulous restaurants and fantastic rooms, we are the ultimate urban retreat.",
                    location: "5 RAFFLES AVENUE, MARINA SQUARE",
                    contact: "MOSIN-RESERVATIONS@MOHG.COM")

events_table.insert(title: "MO Tokyo", 
                    description: "High above the city, Mandarin Oriental, Tokyo is a five-star luxury hotel with views to take your breath away. Exuding crisp, contemporary style, we pride ourselves on our excellent technology, renowned spa, innovative restaurants and impeccable service.",
                    location: "2-1-1 NIHONBASHI MUROMACHI, CHUO-KU",
                    contact: "MOTYO-RESERVATIONS@MOHG.COM")

events_table.insert(title: "MO Barcelona", 
                    description: "Located on Passeig de Gràcia, Mandarin Oriental, Barcelona is one of the city's best loved hotels. Enjoying stunning views over our gardens or the modernist landmark Casa Batlló, we offer a wonderful mix of style and five-star luxury.",
                    location: "PASSEIG DE GRÀCIA, 38-40",
                    contact: "MOBCN-RESERVATIONS@MOHG.COM")
