## @file cambio_nombre_rama.sh
## @brief Al cambiarse el nombre de una tarea se debe cambiar el nombre de su rama
##        correspondiente.

rama_saneada="`magcontrolversion sanear "$tarea"`"
nombre_nuevo_saneado="`magcontrolversion sanear "$nTarea"`"

echo Tarea actual: $tarea
echo Nuevo nombre: $nTarea

# Comprobar que existe la rama
if [ "`magcontrolversion rama_actual`" != "$rama_saneada" ] ; then

   echo
   echo La tarea actual no tiene su correspondiente rama, no hacemos nada
   echo

else



   # Cambiar a develop para evitar error al cambiar nombre de rama en uso
   magcontrolversion cambiar_rama develop

   echo SALIDA: $?
   if [ $? -ne 0 ] ; then

      echo
      read -p "Cancelar el cambio de nombre (s/n): " OPCION
      if [ "$OPCION" = "s" ] ; then
         interrunpir_evento=true
         exit
      fi

   fi

   # cambiar nombre

   source "`dirname "$BASH_SOURCE"`/../../motores/maggit"
   func="git_magcontrolversion_renombrar_rama" ; eval "$func '$rama_saneada' '$nombre_nuevo_saneado'"



   # volver a la rama en uso

   magcontrolversion cambiar_rama "$nombre_nuevo_saneado"



fi
