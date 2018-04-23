include List

(* 1 *)
type roman_el = I | V | X | L | C | D | M ;;
type roman_num = List of roman_el ;;

(* 2 *)
type 'a b_tree = Leaf | Node of ('a b_tree * 'a * 'a b_tree) ;;

let rec map_t f tr =
  match tr with
    Leaf -> Leaf
  | Node(l, a, r) -> Node(map_t f l, f a, map_t f r) ;;

let rec fold_t f c tr =
  match tr with
    Leaf -> c
  | Node(l, a, r) -> f (f (fold_t f c l) (fold_t f c r)) a ;;

(* 3 *)
type tipo =
  | Gato
  | Perro
  | Pajaro ;;

type animal = {
  tipo  : tipo;
  vuela : bool;
  patas : int;
} ;;

let macri : animal = {tipo=Gato; vuela=false; patas=4};;
let may : animal = {tipo=Perro; vuela=false; patas=4};;
let temer : animal = {tipo=Pajaro; vuela=true; patas=2};;

let amputar_pata (a : animal) : animal = {a with patas = a.patas - 1} ;;
