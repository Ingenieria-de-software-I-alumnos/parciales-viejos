
# Enunciado - Hazte la fama

  

Después del éxito obtenido en la iteración anterior de la saga sobre diálogos entre personajes (PNJ/PJ), el cliente ha decidido agregar una nueva funcionalidad sobre opiniones de regiones con varios pueblos, con mecanismos de propagación de opiniones sobre los personajes jugadores (PJ).

  

Esta nueva variante de opiniones de regiones está conformada por otras opiniones públicas, tanto por otras opiniones regionales como por opiniones de pueblos. Ya resolvimos cómo la opinión de un pueblo calificaba a un personaje jugador (PJ) como desconocido o prometedor. Estas opiniones sobre un PJ se pueden propagar de “abajo hacia arriba” y de “arriba hacia abajo”.

  

Propagación de “abajo hacia arriba”

  

Si la mayoría de los seguidores de la opinión de esa región califica a dicho PJ como prometedor, entonces esta región también lo va a calificar como prometedor. Por ejemplo:

-   (Figura A) Un primer ejemplo puede ser si la opinión de la región Chata tiene como único seguidor a la opinión de Río Verde y está no lo ve como prometedor a Hamilton, entonces la región Chata tampoco lo va a ver como prometedor.
    
-   (Figura B) Si la opinión de la región Del Bajo tiene como único seguidor a la opinión de Riverwood, donde Hamilton es prometedor, entonces también la región lo va a ver de este modo.
    
-   (Figura C) En cambio si la opinión de la región Valle Chico está conformada por dos opiniones que la siguen, y solo una de ellas lo califica como prometedor, entonces esta calificación no se propaga hacia la opinión Del Valle Chico ya que la mayoría no lo califica como prometedor.
    
-   Otros ejemplo de propagación hacia arriba lo pueden observar en las Figura D y la Figura E
    

![](https://lh5.googleusercontent.com/05jNCsiebCBKKQFCu7spYzfdsREgCEnws3_ZDosVvOC6Sbz1Y0DaXZ_2kjILKCUxe6TedEK5N-lpotPahR8tDYxJyPR7cY1Jt8mukJtVX3yzi773EOmupgWMt8BG7q_tdhCUc7JM-Pb8RBeT4A)

![](https://lh6.googleusercontent.com/DOV2IOxw70-E-hol3ugcZuBZapu_p720FsDQeA09nu-MJsrig9TNEHKXEJKt6m8dr5EVWw7yDfOH1Sjgd1nK9CQ1NIExvCb9OnWsshVZFcipcNjmL76q5U6R8MwWg4IbHYpR_BXeMHLkdWjrjQ)

![](https://lh6.googleusercontent.com/Nh6i66kqyXW1RwwBrIuci0HcQHK4_vqDxoHqW5LIzjh3V_Iur5ofhvOaBOUplBCG3IXh_KkMsd2B-f-vANo8_hwQHMnzet0O7oLnPCvz-MHjRM33glolL5B4TSo3j-KaRA-g4dZBJA1CkiRuBw)

Propagación de “arriba hacia abajo”.

  

Cuando una opinión de una región ve como prometedor a un PJ entonces sus seguidores también lo ven como prometedor. Por ejemplo (Figura F) , si la opinión de la región Cañaverales está conformada por tres opiniones que la siguen, y dos de ellas lo califican como prometedor a Hamilton, es decir se propaga la calificación como prometedor hacia la región Cañaverales, entonces el tercer seguidor, aquel que no lo había calificado como prometedor, lo va a ver como prometedor ya que así lo califica su región referente.

![](https://lh4.googleusercontent.com/iFR7UXRPqbKxI67WL6mnXRRee0N5G-gWGbG45Es7gHyeOdYp0TbFECFBfaIdCjPvFMwBnr0uA-DTG_dP798SpjJPTlJQFbyTq_qA7h57ENMldt9_dem2xBu6RvFWwDs9kXtsw6xbnBs5fPw4jQ)![](https://lh3.googleusercontent.com/ZihfM15Wgft4qLSBenZK_DOWgZ7h3GCNAAfAQZbp3IGo7sBVmAvdu6Jz3_DsFUOCLJNVYew96KvP2E1tSG2Rx-hMPC6wxXWfAFqQpirZMsxEG2Y613CfUPKUMCkezcts24rnpw19veYqtswUPg)

Otros ejemplos de propagación hacia abajo lo pueden observar en las Figuras G.

![](https://lh3.googleusercontent.com/XmEVQAJpIcACvHUATeq4oRSfZgzWOK_LeXwI-dMDjIlM4VnUwXfgeEoq8xa1u8BTZx0IaQ7Hn35IOZ6oobBCczg0WT8cC2tJX9yOJi36S6RgkRf1BMv0zIvCoAw2vGAYtyxdB_rE9YErh7aDdg)

Es importante notar que:

-   La propagación es la única forma que tiene un PJ para ser calificado como prometedor en las opiniones de las regiones.
    

-   Las opiniones de una región deben tener al menos un seguidor, ya sea una opinión de un pueblo o de otra región.
    
-   Las opiniones públicas o no tienen o tienen una  única opinión referente .
    
-   No hace falta agregar otros tipos de restricciones a las ya mencionadas.
    

  

Propagación centralizada

  

El cliente también está pensando en incorporar diversas formas de propagar la fama de un PJ en una región. Hasta el momento tenemos una sola: por mayoría. Si bien tiene pensadas otras formas más, pero por ahora quiere implementar una más de propagación además de por mayoría, la centralizada. En este nuevo tipo de región, hay una opinión pública con más peso o dominante donde alguien es prometedor sólo si la opinión dominante lo ve como prometedor, independientemente de cómo lo ve el resto. Entonces, queremos poder construir regiones donde designamos a una de sus opiniones como dominante y esa es la que va a regir la opinión de la región.

  

Nuestra misión es desarrollar el ejercicio haciendo TDD y usando todas las heurísticas de diseño que vimos durante la cursada. ¡Buena suerte!

  
  

Estrategia sugerida sobre cómo resolver el parcial

  

La parte de propagación “abajo hacia arriba” y “arriba hacia abajo” tienen más peso en la nota, por lo que les recomendamos que resuelvan esta parte de forma completa, aplicando lo visto durante el cuatrimestre, mejorando nombres, quitando código repetido, etc. Y una vez que estén conformes con lo realizado continuar con la propagación centralizada.

  

Siguiendo la estrategia sugerida de separar el trabajo en dos partes, dentro de cada parte les recomendamos que prioricen la calidad del trabajo en este orden:

1.  TDD (tener tests en un orden y granularidad acorde a TDD)
    
2.  Modelo (nombres, no repetir código, claridad, etc)
    
3.  Correctitud de tests (repetición de código, claridad, etc)
    
4.  Nombre de los tests (nombres claros de los tests)
    

  

Deben cargar el código inicial AlgoIII-PNJ-2021-2C-2doParcial.Inicial.st, ahí encontrarán nuestro trabajo sobre PNJs a lo largo del cuatrimestre. En este código, probablemente necesiten modificar la opinión del pueblo. No hace falta que hagan mejoras sobre el resto de este código inicial, el único requisito es que los tests sigan funcionando.