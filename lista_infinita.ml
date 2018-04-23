type 'a stream = Nil | Cons of ('a * (unit -> 'a stream))

let rec ones = Cons (1, fun () -> ones)

let rec take' n s =
    match (n,s) with
    | 0, _ -> []
    | _, Nil -> []
    | n, Cons (e, f) -> e :: take' (n-1) (f ())

let n_explode n =
        let rec f x =
                if x=n then failwith "Boom!"
                else Cons (x, fun () -> f (x+1))
        in f 0

