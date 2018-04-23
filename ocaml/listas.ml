include List

(* 1 *)
let rec last l =
    match l with
    | [] -> None
    | x :: [] -> Some x
    | x :: tl -> last tl

(* 2 *)
let rec last_two l =
    match l with
    | [] | [_] -> None
    | x :: y :: [] -> Some (x,y)
    | x :: tl -> last_two tl

(* 3 *)
let rec fold_left' f a l =
    match l with
    | [] -> a
    | x :: tl -> fold_left' f (f a x) tl

(* 4 *)
let rec mapi' f l =
    let rec aux f n l =
        match l with
        | [] -> []
        | x :: tl -> f n x :: (aux f (n+1) tl)
    in aux f 0 l

(* 5 *)
let rec filter' f l =
    match l with
    | [] -> []
    | x :: tl -> if f x then x :: (filter f tl) else filter f tl

(* 6 *)
let mapi'' f l =
    fold_left' (fun tl x -> append tl [(f (length tl) x)]) [] l

let filter'' f l =
    fold_left' (fun tl x -> if f x then append tl x else tl) [] l

(* 7 *)
let sinceros f l =
    map f (filter (fun x -> x != 0) l)

(* 8 *)
let compress l =
    rev (fold_left (fun l x -> if length l = 0 then [x] else (if (length l > 0) && hd l = x then l else x :: l)) [] l)

let compress' l =
  let rec aux n m =
    match m with
    | [] -> n
    | [x] -> aux (x::n) []
    | x::y::tl ->
      if x = y then
        aux n (y::tl)
      else
        aux (x::n) (y::tl)
  in
  rev (aux [] l)

(* 9 *)
let somes l =
  let rec f t =
    match t with
    | [] -> true
    | Some x :: tl -> f tl
    | None :: tl -> false
  in
  if f l then
    let l = filter (fun x -> x != None) l in
    Some (map (fun x -> match x with Some y -> y) l)
  else
    None

