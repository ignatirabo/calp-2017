type CustomerID = Int
type Address = [String]

data Customer = Customer {
  customerID      :: CustomerID,
  customerName    :: String,
  customerAddress :: Address
                         } deriving (Show)

cust = Customer 234553 "Ignacio" ["Gral. Bolivar 12"]
