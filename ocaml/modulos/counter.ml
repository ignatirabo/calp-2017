module CounterF : COUNTER =
struct
  type t = int
  let zero = 0
  let incr c = c + 1
  let read c = c
end

module CounterR : COUNTER =
struct
  type t = int ref
  let zero = ref 0
  let incr c = c := !c + 1; c
  let read c = !c
end
