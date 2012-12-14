## @file
## Buscamos lista de tareas pendientes y bugs dentro de los archivos afectados por el movimiento.
##
## En caso de encontrar alguna, la mostramos y preguntamos que se desea hacer:
##
## - continuar
## - cancelar
## - editar archivo donde se encuentra la tarea
##
## Si se selecciona editar, se vuelve a buscar en código para repetir el proceso.

echo 'Buscando Errores o pendiente en archivos afectados...'
echo

cmd="buscar_codigo servidor_vim $proyecto"

if [ "$mt_codificacion_codigo" != "" ] ; then
   cmd="$cmd encoding_entrada $mt_codificacion_codigo"
fi

SQL="SELECT r.nombre FROM tareas t, movimientos m, rMovimientoArchivos r
WHERE m.idTarea=t.id AND m.id=r.idMovimiento AND t.id=$tareaId
ORDER BY r.nombre"
local ARCHIVOSs=$(ejecutarSQL "$SQL" "-N" )
ARCHIVOS=$(echo "$ARCHIVOSs" | sort | uniq )

if [ "$ARCHIVOS" != "" ] ; then

   lista=$(buscar_codigo $ARCHIVOS)

   if [ "$lista" != "" ] ; then
      
      echo
      echo Tareas pendientes o errores encontrados
      echo ---------------------------------------
      echo
      echo -e "$lista"
      echo 
      echo 'Hay tareas pendientes en los archivos afectados'
      echo
      echo ' [C]ontinuar | C[a]ncelar | [E]ditar archvio'
      echo

      read -s -n 1 -p 'Opción: ' OPCION

      case "$OPCION" in

         a) # cancelar evento
            interrunpir_evento=true
            ;;
         e)
            #cmd="gvim --servername $proyecto --remote-send '<C-\><C-N>:cfile ${DIR_TMP}resultado_buscar_codigo<CR>:copen<CR>'"
            #eval "$cmd"
            lanzar_editor -lista ${DIR_TMP}resultado_buscar_codigo
            interrunpir_evento=true
            ;;

      esac

   else

      echo "Sin tareas pendientes"
      echo

   fi

else

   echo "Sin archivos afectados"
   echo

fi

