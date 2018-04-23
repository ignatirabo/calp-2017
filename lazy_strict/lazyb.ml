type 'a t' = Lazy_pre of (unit -> 'a) | Lazy_post of ('a)
type 'a t = ('a t') ref

let from_fun (f : unit -> 'a) : 'a t = ref (Lazy_pre(f))

let force (l : 'a t) : 'a =
  match !l with
  | Lazy_post(a) -> a
  | Lazy_pre(a) ->
    let a = a() in
    l := Lazy_post(a);
    a

(* tipos de: ref, :=, ! *)
(* val ref : 'a -> 'a ref *)
(* val (:=) : 'a ref -> 'a -> unit *)
(* val (!) : 'a ref -> 'a *)

let expr = fun () -> List.map (fun x -> x + 1) [1; 2; 3; 4; 5]
let lazy_e = from_fun expr
