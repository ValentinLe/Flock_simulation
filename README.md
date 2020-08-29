# Flock_simulation

Simulation d'entitées se déplaçant en nuée (cercles blancs) et fuyant les traqueurs (carrés rouges).

<div align="center">
<img src="https://github.com/ValentinLe/Flock_simulation/blob/master/screenshots/demo.gif" alt="demo" width="720" height="560">
</div>

## Comportements

- **Entitées :** se déplace en nuée, se raproche des autres proche de lui (cohésion). Quand il est trop proche d'eux, il s'en éloigne (séparation) et enfin il fait en sorte de se déplacer dans la même direction qu'eux (alignement). Quant le cercle blanc se trouve proche d'un ou plusieurs carré(s) rouge, il le(s) fuit.

- **Traqueurs :** se dirige vers le cercle blanc le plus proche et quand il se trouve proche d'un de ses aliés, il s'en éloigne (séparation).
