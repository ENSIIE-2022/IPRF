# IPRF
Cours de OCaml

http://web4.ensiie.fr/~christophe.mouilleron/Teaching/IPRF/

# Les notes de Lucas :

# Appel de fonction :
repeated ("hello", 3)  /* c'est du code C */
repeated "hello" 3  (* c'est du code OCaml *)

# Arguments :
f 5 (g "hello") 3    (* f a 3 arguments, g a un argument *) => A noter que (g "hello") est donc un couple
f (g 3 4)            (* f a un argument, g a 2 arguments *)

# Définition de fonction :
OCAML :
let average a b =
  (a +. b) /. 2.0;;
 
C :
double average (double a, double b)
{
  return (a + b) / 2;
}

# Type :
int     |Entier avec signe 31 bits (environ +/- 1 milliard) avec processeurs 32 bits
        |ou bien 63 bits avec processeurs 64 bits, si besoin de plus : utiliser le module bigint
float   |Nombre à virgule flottante double-précision IEEE, équivalent au type double du C
bool    |Un booléen, noté true (vrai) ou false (faux)
char    |Un caractère à 8 bits
string  |Une chaîne de caractères à 8 bits
unit    |Valeur unique notée ()

# Convertion de types :
float_of_int i +. f;; (* Sachant que i est un int et f est un float *)
int_of_float, char_of_int, int_of_char, string_of_int, etc...

# Fonctions récursives :
let rec range a b =
    if a > b then []
    else a :: range (a+1) b;;

# Compilateur est affichage fonction :
f : arg1 -> arg2 -> ... -> argn -> rettype
=> f(arg1, arg2, ..., argn):rettype
repeated : string -> int -> string
=> repeated(string,int):string
average : float -> float -> float
=> average(float, float): float
int_of_char : char -> int
=> int_of_char(char): int
output_char : out_channel -> char -> unit
=> output_char (out_channel, char): unit
/!\ unit = void
give_me_a_three : 'a -> int
give_me_a_three(nimporte_quel_type): int

# Variables locales :
En OCaml :
let average a b =
    let sum = a +. b in
    sum /. 2.0;;
val average : float -> float -> float = <fun>
En C :
double average (double a, double b) {
  double sum = a + b;
  return sum / 2;
}

# Fonctions imbriquées
let read_whole_channel chan =
    let buf = Buffer.create 4096 in
    let rec loop () =
      let newline = input_line chan in
      Buffer.add_string buf newline;
      Buffer.add_char buf '\n';
      loop ()
    in
    try
      loop ()
    with
      End_of_file -> Buffer.contents buf;;
val read_whole_channel : in_channel -> string = <fun>

# Les trucs chiants :
- Un type et une fonction peuvent avoir le même nom

# TODO
let... in
