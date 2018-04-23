module type COUNTER =
sig
  type t
  val zero : t
  val incr : t -> t
  val read : t -> int
end
