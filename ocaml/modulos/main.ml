open Counter

let () =
  let a = CounterF.zero in
  let a = CounterF.incr a in
  Printf.printf "a: %d\n" (elem = (CounterF.read a))
