/* 
 * COVARIANCE AND INVARIANCE
 */

// LEVEL 0
class Drink()

// LEVEL 1
class ColdDrink() extends Drink
class Juice() extends Drink

// LEVEL 2.1
class Frappie() extends ColdDrink
class IcedTea() extends ColdDrink

// LEVEL 2.2
class OrangeJuice() extends Juice
class AppleJuice() extends Juice

// FUNCTIONS
// With [+A] we indicate that the type argument A is covariant
class VendingMachine[+A](status: Int, style: A) {
    // ... don't worry about implementation yet
}

def install(coldDrinkVM: VendingMachine[ColdDrink]): Unit = {
    // Installs the cold drink vending machine
}
// The method install takes VendingMachines of type ColdDrink or subtypes of ColdDrink. The class VendingMachine is covariant in the type parameter A.

// covariant subtyping:
install(new VendingMachine[Frappie])
install(new VendingMachine[IcedTea])
// invariant:
install(new VendingMachine[ColdDrink])

// To sum up:
               A  <:                B
VendingMachine[A] <: VendingMachine[B]