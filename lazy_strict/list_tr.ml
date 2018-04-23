let mapi' f l =
  let rec aux f s n l =
    match l with
    | [] -> s
    | x :: tl -> aux f ((f n x)::s) (n+1) tl
  in
  aux f [] 0 l

let filter' f l =
  let rec aux f s l =
    match l with
    | [] -> s
    | x :: xs ->
      if f x then
        aux f (x::s) xs
      else
        aux f s xs
