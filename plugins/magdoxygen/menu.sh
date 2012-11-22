## @file magdoxygen/menu.sh
## @brief Documentación de proyecto

# Listar archivos para seleccionar

if [ "$movimientoId" != "" ] ; then

SQL="$SQL_ARC AND idMovimiento=$movimientoId"

   magdoxygen conf "$HOME/.magtrabajos/proyectos/$proyecto/doxygen.conf" menu $(ejecutarSQL "$SQL" "-N")

elif [ "$tareaId" != "" ] ; then

local SQL="SELECT DISTINCT r.nombre FROM tareas t, movimientos m, rMovimientoArchivos r WHERE m.idTarea=t.id AND m.id=r.idMovimiento AND t.id=$tareaId ORDER BY r.nombre"

   magdoxygen conf "$HOME/.magtrabajos/proyectos/$proyecto/doxygen.conf" menu $(ejecutarSQL "$SQL" "-N")

else

   magdoxygen conf "$HOME/.magtrabajos/proyectos/$proyecto/doxygen.conf" menu

fi
