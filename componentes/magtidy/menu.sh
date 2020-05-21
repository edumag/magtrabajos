## @file magtidy/menu.sh
## @brief Ejecutar tidy

archivos_afectados=''                                 ##< Archivos afectados, para poder actuar sobre archivos seleccionados

if [ "$movimientoId" != "" ] ; then
  archivos_afectados=$(magtrabajos -m $movimientoId --archivos)
elif [ "$tareaId" != "" ] ; then
  archivos_afectados=$(magtrabajos -t $tareaId --archivos)
fi

magtidy menu $archivos_afectados
