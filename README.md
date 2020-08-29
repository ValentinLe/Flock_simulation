# Flock_simulation

Simulation d'entités se déplaçant en nuée (points blancs) et fuyant les traqueurs (carrés rouges).

<div align="center">
<img src="https://github.com/ValentinLe/Flock_simulation/blob/master/screenshots/demo.gif" alt="demo" width="720" height="560">
</div>

## Comportements

- **Entité :** se raproche ou s'éloigne des entités proches pour se placer à bonne distance et faisant en sorte d'aller dans la même direction qu'elles (cohésion, séparation et alignement). Quand l'entité se trouve proche d'un ou plusieurs traqueur(s), il le(s) fuit.

- **Traqueur :** se dirige vers l'entité la plus proche et quand il se trouve proche d'un traqueur, il s'en éloigne (séparation).
