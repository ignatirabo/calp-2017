def sinceros(f: Int => Boolean, l: List[Int]) : List[Boolean] = {
  var m = l.filter(_ != 0)
  return m.map(f)
}

def compress[A](l: List[A]) : List[A] = {
  def aux_compress(n: List[A], m: List[A]) : List[A] = {
    m match {
      case (x::y::ys) => {
           if (x == y)
              aux_compress(n, (y::ys))
           else
              aux_compress((x::n), (y::ys))
      }
      case (x::Nil) => {
           aux_compress(x::n, Nil)
      }
      case (nil) => {
           n
      }
    }
  }
  aux_compress(Nil, l).reverse
}
