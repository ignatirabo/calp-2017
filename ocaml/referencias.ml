(* 1 *)
let max_list_imp l =
  if l = [] then
    0
  else
    let len = List.length l in
    let m = ref (List.hd l) in
    for i = 0 to len-1 do
      m := max !m (List.nth l i)
    done;
    !m ;;

let max_list_fun l =
  let rec max_aux m l =
    match l with
    | [] -> m
    | x::xs ->
      let m = max x m in
      max_aux m xs
  in
  match l with
  | [] -> 0
  | x::xs -> max_aux x xs ;;

let max_list_foldl l =
  match l with
  | [] -> 0
  | x::xs -> List.fold_left max x xs ;;

let max_list_def (l : 'a list) : 'a option =
  match l with
  | [] -> None
  | x::xs -> Some (List.fold_left max x xs) ;;

(* 2 *)
type materia = {
  nombre : string;
  nota : float;
} ;;

let rec sum_mat l =
  match l with
  | [] -> 0.0
  | x::xs -> x.nota +. (sum_mat xs) ;;

type estudiante = {
  libreta : int;
  nombre : string;
  mutable materias : materia list;
} ;;

let calp = {nombre = "Conceptos Avanzados de Lenguajes de Programación"; nota = 10.0} ;;
let paradig = {nombre = "Paradigmas de la Programación"; nota = 9.0} ;;

let ignacio = {libreta = 1; nombre = "Ignacio Tiraboschi"; materias = [paradig]} ;;

let add_materia (e : estudiante) (m : materia) =
  e.materias <- (m :: e.materias) ;;

(* 3 *)
type estudiante' = {
  libreta : int;
  nombre : string;
  materias : (materia list) ref;
  score : (unit -> float) ref;
} ;;

let add_materia' (e : estudiante') (m : materia) =
  e.materias := (m :: !(e.materias)) ;;

let fscore (m : (materia list) ref) =
  (sum_mat !m) /. float (List.length !m) ;;

let ignacio' =
  let materias = ref [paradig] in
  {libreta = 1; nombre = "Ignacio Tiraboschi"; materias = materias; score = ref (fun () -> fscore materias)}
