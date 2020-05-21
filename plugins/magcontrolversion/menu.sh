## @file magcontrolversion/menu.sh
## @brief Control de versiones

echo 'Magsubversion'

if [ "$movimientoId" != "" ] ; then                                         # Control de versiones sobre movimiento
   echo "Control de versiones sobre movimiento"
   SQL="SELECT r.nombre FROM movimientos m, rMovimientoArchivos r
   WHERE m.id=r.idMovimiento AND m.id=$movimientoId
   ORDER BY r.nombre"
   local archivos_afectados=$(ejecutarSQL "$SQL" "-N" )
   archivos_afectados=$(echo "$archivos_afectados" | sort | uniq )
elif [ "$tareaId" != "" ] ; then                                            # Control de versiones sobre tarea
   echo 'Control de versiones sobre tarea'
   SQL="SELECT r.nombre FROM tareas t, movimientos m, rMovimientoArchivos r
   WHERE m.idTarea=t.id AND m.id=r.idMovimiento AND t.id=$tareaId
   ORDER BY r.nombre"
   local archivos_afectados=$(ejecutarSQL "$SQL" "-N" )
   archivos_afectados=$(echo "$archivos_afectados" | sort | uniq )
fi

echo generamos informe prar control de versiones
informe_subversion

echo Archivo de informe: $TMP
texto="$TMP"

source "`dirname "$BASH_SOURCE"`/magcontrolversion"

cmd='_subversion '

if [ "$movimientoId" != "" ] ; then
   cmd="$cmd mov $movimientoId"
fi

if [ "$texto" != "" ] ; then
   cmd="$cmd texto '$texto'"
fi

cmd="$cmd menu"

if [ "$archivos_afectados" != "" ] ; then
   cmd="$cmd $archivos_afectados"
fi

echo $cmd ; eval $cmd
