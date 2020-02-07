(* 2.1 *)
Printf.printf "Bonjour"
(* 2.2 *)
let pseudo = read_line () ;;
Printf.printf ("Bonjour %s\n") pseudo ;;
(* 2.3 *)
Scanf.scanf "%s\n" (fun s -> Printf.printf "Bonjour %s\n" s) ;;
(* 2.4.1
Le compilateur se sert des fichiers .cmi pour gérer les dépendances. 
Lorsqu’il repère une dépendance vers un module Foo, il va chercher implicitement le fichier foo.cmi. S’il ne le trouve pas il échoue avec une erreur du style Unbound module Foo
Le linker se sert des fichiers .cmo pour générer l´exécutable. Il faut préciser explicitement et dans le bon ordre les fichiers .cmo
*)
