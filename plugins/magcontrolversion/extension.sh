## @file extension.sh 
##
## @brief magtrabajos con magcontrolversion

## Generar informe para control de versiones

function informe_subversion() {

   log $FUNCNAME 'Informe para control de versiones'

   # si hace el informe sobre varias tareas comprobar que no sean demasiadas
   if [ "${#tareasIds[*]}" -gt 10 ] ; then
      log $FUNCNAME "Demasiadas tareas no creamos informe automáticamente"
   else
      ant_pefil_actual=$perfil_actual
      perfil_actual="control_versiones"
      ACCION='informe' ; comenzar
      perfil_actual=$ant_pefil_actual
   fi
   
   }
