abstract class Either [+A, +B]()

case class Left[+A, +B](a: A) extends Either[A, B]
case class Right[+A, +B](b: B) extends Either[A, B]

def testing_either[A, B](x: Either[A, B]) = {
    x match {
          case Right(b) => b
          case Left(a) => a
    }
}
