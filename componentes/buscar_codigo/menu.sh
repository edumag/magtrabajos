## @file buscar_codigo/menu.sh
## @brief Buscar en código

cmd="buscar_codigo servidor_vim $proyecto"

if [ "$mt_codificacion_codigo" != "" ] ; then
   cmd="$cmd encoding_entrada $mt_codificacion_codigo"
fi

if [ "$movimientoId" != "" ] ; then

   SQL="$SQL_ARC AND idMovimiento=$movimientoId"

   ARCHIVOS="$(ejecutarSQL "$SQL" "-N")"

elif [ "$tareaId" != "" ] ; then

   SQL="SELECT DISTINCT r.nombre 
        FROM tareas t, movimientos m, rMovimientoArchivos r 
        WHERE m.idTarea=t.id AND m.id=r.idMovimiento AND t.id=$tareaId 
        ORDER BY r.nombre"

   ARCHIVOS="$(ejecutarSQL "$SQL" "-N")"

else
   ARCHIVOS=""
fi

cmd="$cmd menu"

if [ "$ARCHIVOS" != "" ] ; then
   cmd="$cmd $ARCHIVOS"
fi

log $FUNCNAME "comando:  $cmd"

$cmd 
