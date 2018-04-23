(* Definición de lista infiníta *)
type 'a stream = Nil | Cons of ('a * (unit -> 'a stream))

let rec ones = Cons(1, fun () -> ones)
let rec twos = Cons(2, fun () -> twos)

(* 1 *)
(* i *)
let rec take_inf (n : int) (l : 'a stream) : 'a list =
  match (n, l) with
  | (_, Nil) | (0, _) -> []
  | (1, Cons(x, xs)) -> x :: []
  | (n, Cons(x, xs)) -> x :: (take_inf (n-1) (xs()))

(* ii *)
let rec map_inf (f : 'a -> 'b) (l : 'a stream) : 'b stream =
  match l with
  | Nil -> Nil
  | Cons(x, xs) -> Cons(f x, fun () -> (map_inf f (xs())))

(* iii *)
let rec filter_inf (f : 'a -> bool) (l : 'a stream) : 'a stream =
  match l with
  | Nil -> Nil
  | Cons(x, xs) ->
    match f x with
    | false -> filter_inf f (xs())
    | true -> Cons(x, fun () -> (filter_inf f (xs())))

(* iv *)
let rec zip_inf (l : 'a stream) (m : 'b stream) : ('a * 'b) stream =
  match (l, m) with
  | (Nil, _) | (_, Nil) -> Nil
  | (Cons(x, xs), Cons(y, ys)) -> Cons((x, y), fun () -> (zip_inf (xs()) (ys())))

let rec unzip_fst_inf (l : ('a * 'b) stream) : 'a stream =
  match l with
  | Nil -> Nil
  | Cons(p, tl) -> Cons(fst p, fun () -> unzip_fst_inf (tl()))

let rec unzip_snd_inf (l : ('a * 'b) stream) : 'b stream =
  match l with
  | Nil -> Nil
  | Cons(p, tl) -> Cons(snd p, fun () -> unzip_snd_inf (tl()))

let rec unzip_inf (l : ('a * 'b) stream) : ('a stream) * ('b stream) =
  match l with
  | Nil -> (Nil, Nil)
  | Cons(p, tl) -> (Cons(fst p, fun () -> unzip_fst_inf (tl())), Cons(snd p, fun () -> unzip_snd_inf (tl())))

(* extra *)
(* una función que transforme una lista a un stream *)
let rec to_stream (l : 'a list) : 'a stream =
  match l with
  | [] -> Nil
  | x::xs -> Cons(x, fun () -> to_stream xs)

(* 2 *)
let is_prime (n : int) =
  let rec range acc f t =
    if f > t then
      acc
    else
      range (f::acc) (f+1) t
  in
  let rec aux n l =
    match l with
    | [] -> true
    | x::xs -> if n mod x = 0 then false else aux n xs
  in
  if n > 1 then
    aux n (range [] (int_of_float (ceil (sqrt (float n)))) ((n+1)/2))
  else
    false

let rec dos_i = Cons(1, fun () -> map_inf (fun x -> x + 1) dos_i)
let dos_ii = filter_inf (fun x -> is_prime x) dos_i
let rec dos_iii = Cons(1, fun() -> (Cons(1, fun() -> map_inf (fun x -> x+1) dos_iii)))
let dos_iv = map_inf string_of_int dos_i
