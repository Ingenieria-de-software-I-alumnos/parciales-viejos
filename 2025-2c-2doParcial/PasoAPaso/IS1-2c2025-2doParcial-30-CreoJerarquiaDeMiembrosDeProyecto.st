!classDefinition: #EstadoDeHistoriaDeUsuario category: #'IS1-2c2025-2doParcial'!
Object subclass: #EstadoDeHistoriaDeUsuario
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!EstadoDeHistoriaDeUsuario methodsFor: 'mover historia' stamp: 'LL 11/17/2025 21:34:35'!
mover: unaHistoriaDeUsuario a: unNuevoEstado siendo: unMiembroDeProyecto 
	self afirmarQue: unaHistoriaDeUsuario noSePuedeMoverAlMismoEstadoEnElQueEstoySiQuieroMoverA: unNuevoEstado.
	
	self mover: unaHistoriaDeUsuario aUnEstadoDistinto: unNuevoEstado siendo: unMiembroDeProyecto.! !


!EstadoDeHistoriaDeUsuario methodsFor: 'mover historia - private' stamp: 'LL 11/17/2025 21:35:42'!
mover: unaHistoriaDeUsuario aUnEstadoDistinto: unNuevoEstado siendo: unMiembroDeProyecto.

	self subclassResponsibility! !


!EstadoDeHistoriaDeUsuario methodsFor: 'mover historia desde - dd' stamp: 'LL 11/17/2025 20:30:36'!
mover: unaHistoriaDeUsuario desdeFinalizadaSiendo: unMiembroDeProyecto
	self subclassResponsibility! !

!EstadoDeHistoriaDeUsuario methodsFor: 'mover historia desde - dd' stamp: 'LL 11/17/2025 20:32:39'!
mover: unaHistoriaDeUsuario desdePendienteSiendo: unMiembroDeProyecto

	self subclassResponsibility! !


!EstadoDeHistoriaDeUsuario methodsFor: 'assertions' stamp: 'LL 11/17/2025 20:14:56'!
afirmarQue: unaHistoriaDeUsuario noSePuedeMoverAlMismoEstadoEnElQueEstoySiQuieroMoverA: unNuevoEstado

	self = unNuevoEstado ifTrue: [ self error: unaHistoriaDeUsuario noSePuedeMoverAlEstadoQueYaEstabaMensajeDeError ].! !


!EstadoDeHistoriaDeUsuario methodsFor: 'private' stamp: 'LL 11/17/2025 20:04:08'!
= otroEstado

	^self class = otroEstado class! !


!classDefinition: #EstadoEnProgreso category: #'IS1-2c2025-2doParcial'!
EstadoDeHistoriaDeUsuario subclass: #EstadoEnProgreso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!EstadoEnProgreso methodsFor: 'mover historia - private' stamp: 'LL 11/17/2025 21:34:48'!
mover: unaHistoriaDeUsuario aUnEstadoDistinto: unNuevoEstado siendo: unMiembroDeProyecto.

	unMiembroDeProyecto mover: unaHistoriaDeUsuario desdeEnProgresoA: unNuevoEstado.! !


!EstadoEnProgreso methodsFor: 'mover historia desde - dd' stamp: 'LL 11/17/2025 20:48:36'!
mover: unaHistoriaDeUsuario desdeFinalizadaSiendo: unMiembroDeProyecto

	unMiembroDeProyecto mover: unaHistoriaDeUsuario desdeFinalizadaAEnProgreso: self.! !

!EstadoEnProgreso methodsFor: 'mover historia desde - dd' stamp: 'LL 11/17/2025 20:56:08'!
mover: unaHistoriaDeUsuario desdePendienteSiendo: unMiembroDeProyecto

	unMiembroDeProyecto mover: unaHistoriaDeUsuario desdePendienteAEnProgreso: self! !


!classDefinition: #EstadoFinalizada category: #'IS1-2c2025-2doParcial'!
EstadoDeHistoriaDeUsuario subclass: #EstadoFinalizada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!EstadoFinalizada methodsFor: 'mover historia - private' stamp: 'LL 11/17/2025 21:35:07'!
mover: unaHistoriaDeUsuario aUnEstadoDistinto: unNuevoEstado siendo: unMiembroDeProyecto
	
	unNuevoEstado mover: unaHistoriaDeUsuario desdeFinalizadaSiendo: unMiembroDeProyecto! !


!EstadoFinalizada methodsFor: 'mover historia desde - dd' stamp: 'LL 11/17/2025 20:28:47'!
mover: unaHistoriaDeUsuario desdeFinalizadaSiendo: unMiembroDeProyecto! !

!EstadoFinalizada methodsFor: 'mover historia desde - dd' stamp: 'LL 11/17/2025 21:03:35'!
mover: unaHistoriaDeUsuario desdePendienteSiendo: unMiembroDeProyecto

	unMiembroDeProyecto mover: unaHistoriaDeUsuario desdePendienteAFinalizada: self! !


!classDefinition: #EstadoPendiente category: #'IS1-2c2025-2doParcial'!
EstadoDeHistoriaDeUsuario subclass: #EstadoPendiente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!EstadoPendiente methodsFor: 'mover historia - private' stamp: 'LL 11/17/2025 21:35:17'!
mover: unaHistoriaDeUsuario aUnEstadoDistinto: unNuevoEstado siendo: unMiembroDeProyecto
	
	unNuevoEstado mover: unaHistoriaDeUsuario desdePendienteSiendo: unMiembroDeProyecto.! !


!EstadoPendiente methodsFor: 'mover historia desde - dd' stamp: 'LL 11/17/2025 20:50:49'!
mover: unaHistoriaDeUsuario desdeFinalizadaSiendo: unMiembroDeProyecto

	unMiembroDeProyecto mover: unaHistoriaDeUsuario desdeFinalizadaAPendiente: self.! !

!EstadoPendiente methodsFor: 'mover historia desde - dd' stamp: 'LL 11/17/2025 20:32:57'!
mover: unaHistoriaDeUsuario desdePendienteSiendo: unMiembroDeProyecto! !


!classDefinition: #HistoriaDeUsuario category: #'IS1-2c2025-2doParcial'!
Object subclass: #HistoriaDeUsuario
	instanceVariableNames: 'nombre prioridad responsables estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!HistoriaDeUsuario methodsFor: 'initialization' stamp: 'LL 11/17/2025 20:01:34'!
initializeConNombre: unNombre conPrioridad: unaPrioridad conResponsables: unConjuntoDeResponsables 
	nombre := unNombre.
	prioridad := unaPrioridad.
	responsables := unConjuntoDeResponsables.
	estado := EstadoPendiente new! !


!HistoriaDeUsuario methodsFor: 'main' stamp: 'LL 11/17/2025 23:41:09'!
agregarResponsables: unConjuntoDeResponsables
	(unConjuntoDeResponsables isKindOf: Set) ifTrue: [ responsables addAll: unConjuntoDeResponsables ].
	(unConjuntoDeResponsables isKindOf: EquipoDeTrabajo) ifTrue: [ responsables := unConjuntoDeResponsables ].
	
	! !

!HistoriaDeUsuario methodsFor: 'main' stamp: 'LL 11/17/2025 20:00:38'!
moverA: unNuevoEstado siendo: unMiembroDeProyecto 
	estado mover: self a: unNuevoEstado siendo: unMiembroDeProyecto! !


!HistoriaDeUsuario methodsFor: 'accessing' stamp: 'LL 11/17/2025 11:40:29'!
nombre
	^nombre! !

!HistoriaDeUsuario methodsFor: 'accessing' stamp: 'LL 11/17/2025 11:40:36'!
prioridad
	^prioridad! !

!HistoriaDeUsuario methodsFor: 'accessing' stamp: 'LL 11/17/2025 11:40:43'!
responsables
	^responsables! !


!HistoriaDeUsuario methodsFor: 'testing' stamp: 'LL 11/17/2025 15:35:58'!
estaEnEstado: unPotencialEstado 
	^estado = unPotencialEstado! !

!HistoriaDeUsuario methodsFor: 'testing' stamp: 'LL 11/17/2025 23:18:49'!
tieneComoResponsableA: unPotencialResponsable
	^responsables includes: unPotencialResponsable! !

!HistoriaDeUsuario methodsFor: 'testing' stamp: 'LL 11/17/2025 10:57:54'!
tieneNombre: unNombrePotencial 
	^nombre = unNombrePotencial! !

!HistoriaDeUsuario methodsFor: 'testing' stamp: 'LL 11/17/2025 11:00:33'!
tienePrioridadAlta
	^prioridad = #PrioridadAlta! !

!HistoriaDeUsuario methodsFor: 'testing' stamp: 'LL 11/17/2025 11:00:20'!
tienePrioridadMedia
	^prioridad = #PrioridadMedia! !

!HistoriaDeUsuario methodsFor: 'testing' stamp: 'LL 11/17/2025 16:03:04'!
tieneResponsables
	^responsables isEmpty not! !

!HistoriaDeUsuario methodsFor: 'testing' stamp: 'LL 11/18/2025 00:27:06'!
tieneUnResponsableLlamado: unNombreDeUnPotencialResponsable 
	^responsables anySatisfy: [ :responsable | responsable seLlamaOTieneUnMiembroLlamado: unNombreDeUnPotencialResponsable ]! !


!HistoriaDeUsuario methodsFor: 'mensajes de error' stamp: 'LL 11/17/2025 16:47:59'!
noSePuedeMoverAlEstadoQueYaEstabaMensajeDeError
	^'No se puede mover al estado que ya estaba'! !

!HistoriaDeUsuario methodsFor: 'mensajes de error' stamp: 'LL 11/17/2025 16:43:56'!
noSePuedeMoverDeFinalizadaAOtroEstadoMensajeDeError
	^'No se puede mover de finalizada a otro estado'! !

!HistoriaDeUsuario methodsFor: 'mensajes de error' stamp: 'LL 11/17/2025 16:03:43'!
noSePuedeMoverDePendienteAEnProgresoSinResponsableAsignadoMensajeDeError
	^'No se puede mover a en progreso sin responsable asignado'! !

!HistoriaDeUsuario methodsFor: 'mensajes de error' stamp: 'LL 11/17/2025 15:42:27'!
noSePuedeMoverDePendienteAFinalizadaMensajeDeError
	^'No se puede mover de pendiente a finalizada'! !


!HistoriaDeUsuario methodsFor: 'private' stamp: 'LL 11/17/2025 20:01:57'!
cambiarEstadoA: unNuevoEstado 
	estado := unNuevoEstado! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HistoriaDeUsuario class' category: #'IS1-2c2025-2doParcial'!
HistoriaDeUsuario class
	instanceVariableNames: ''!

!HistoriaDeUsuario class methodsFor: 'instance creation' stamp: 'LL 11/17/2025 16:57:06'!
conNombre: unNombre
	^self new initializeConNombre: unNombre conPrioridad: #PrioridadMedia conResponsables: Set new.! !

!HistoriaDeUsuario class methodsFor: 'instance creation' stamp: 'LL 11/17/2025 16:57:14'!
conNombre: unNombre conPrioridad: unaPrioridad 
	^self new initializeConNombre: unNombre conPrioridad: unaPrioridad conResponsables: Set new.! !

!HistoriaDeUsuario class methodsFor: 'instance creation' stamp: 'LL 11/17/2025 11:06:58'!
conNombre: unNombre conPrioridad: unaPrioridad conResponsables: unConjuntoDeResponsables 
	^self new initializeConNombre: unNombre conPrioridad: unaPrioridad conResponsables: unConjuntoDeResponsables! !


!classDefinition: #MiembroDeProyecto category: #'IS1-2c2025-2doParcial'!
Object subclass: #MiembroDeProyecto
	instanceVariableNames: 'nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!MiembroDeProyecto methodsFor: 'testing' stamp: 'LL 11/18/2025 00:32:36'!
seLlamaOTieneUnMiembroLlamado: unPotencialNombre

	self subclassResponsibility! !


!MiembroDeProyecto methodsFor: 'accessing' stamp: 'LL 11/18/2025 00:33:28'!
nombre

	^nombre! !


!MiembroDeProyecto methodsFor: 'private' stamp: 'LL 11/18/2025 00:33:15'!
= otroMiembroDeProyecto

	^nombre = otroMiembroDeProyecto nombre! !

!MiembroDeProyecto methodsFor: 'private' stamp: 'LL 11/18/2025 00:33:19'!
hash

	^nombre hash! !


!classDefinition: #EquipoDeTrabajo category: #'IS1-2c2025-2doParcial'!
MiembroDeProyecto subclass: #EquipoDeTrabajo
	instanceVariableNames: 'miembros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!EquipoDeTrabajo methodsFor: 'initialization' stamp: 'LL 11/18/2025 00:32:10'!
initializeLlamado: unNombreDelEquipo conformadoPor: unConjuntoDeMiembros 
	nombre := unNombreDelEquipo.
	miembros := unConjuntoDeMiembros.! !


!EquipoDeTrabajo methodsFor: 'testing' stamp: 'LL 11/18/2025 00:32:10'!
seLlamaOTieneUnMiembroLlamado: unPotencialNombre

	^(miembros anySatisfy: [ :miembro | miembro seLlamaOTieneUnMiembroLlamado: unPotencialNombre ]) or: [ nombre = unPotencialNombre ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EquipoDeTrabajo class' category: #'IS1-2c2025-2doParcial'!
EquipoDeTrabajo class
	instanceVariableNames: ''!

!EquipoDeTrabajo class methodsFor: 'instance creation' stamp: 'LL 11/17/2025 23:38:09'!
llamado: unNombreDelEquipo conformadoPor: unConjuntoDeMiembros 
	^self new initializeLlamado: unNombreDelEquipo conformadoPor: unConjuntoDeMiembros! !


!classDefinition: #MiembroIndividual category: #'IS1-2c2025-2doParcial'!
MiembroDeProyecto subclass: #MiembroIndividual
	instanceVariableNames: 'rol'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!MiembroIndividual methodsFor: 'initialization' stamp: 'LL 11/17/2025 19:16:03'!
initializeConNombre: unNombre conRol: unRol 
	nombre := unNombre.
	rol := unRol.! !


!MiembroIndividual methodsFor: 'mover historias - dd' stamp: 'LL 11/17/2025 21:00:39'!
mover: unaHistoriaDeUsuario desdeEnProgresoA: unNuevoEstado

	unaHistoriaDeUsuario cambiarEstadoA: unNuevoEstado! !

!MiembroIndividual methodsFor: 'mover historias - dd' stamp: 'LL 11/17/2025 21:11:04'!
mover: unaHistoriaDeUsuario desdeFinalizadaAEnProgreso: estadoEnProgreso

	rol mover: unaHistoriaDeUsuario desdeFinalizadaAEnProgreso: estadoEnProgreso! !

!MiembroIndividual methodsFor: 'mover historias - dd' stamp: 'LL 11/17/2025 21:13:29'!
mover: unaHistoriaDeUsuario desdeFinalizadaAPendiente: estadoPendiente

	rol mover: unaHistoriaDeUsuario desdeFinalizadaAPendiente: estadoPendiente! !

!MiembroIndividual methodsFor: 'mover historias - dd' stamp: 'LL 11/17/2025 20:55:39'!
mover: unaHistoriaDeUsuario desdePendienteAEnProgreso: estadoEnProgreso

	unaHistoriaDeUsuario tieneResponsables not ifTrue: [ self error: unaHistoriaDeUsuario noSePuedeMoverDePendienteAEnProgresoSinResponsableAsignadoMensajeDeError ].
	
	unaHistoriaDeUsuario cambiarEstadoA: estadoEnProgreso! !

!MiembroIndividual methodsFor: 'mover historias - dd' stamp: 'LL 11/17/2025 21:03:17'!
mover: unaHistoriaDeUsuario desdePendienteAFinalizada: estadoFinalizada

	self error: unaHistoriaDeUsuario noSePuedeMoverDePendienteAFinalizadaMensajeDeError! !


!MiembroIndividual methodsFor: 'testing' stamp: 'LL 11/18/2025 00:26:55'!
seLlamaOTieneUnMiembroLlamado: unPotencialNombre

	^nombre = unPotencialNombre! !

!MiembroIndividual methodsFor: 'testing' stamp: 'LL 11/17/2025 19:30:23'!
tieneRol: unPotencialRol 
	^rol = unPotencialRol! !



"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MiembroIndividual class' category: #'IS1-2c2025-2doParcial'!
MiembroIndividual class
	instanceVariableNames: ''!

!MiembroIndividual class methodsFor: 'instance creation' stamp: 'LL 11/17/2025 19:15:53'!
conNombre: unNombre conRol: unRol 
	^self new initializeConNombre: unNombre conRol: unRol! !


!classDefinition: #RolDeMiembro category: #'IS1-2c2025-2doParcial'!
Object subclass: #RolDeMiembro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!RolDeMiembro methodsFor: 'mover historia - dd' stamp: 'LL 11/17/2025 21:30:14'!
mover: unaHistoriaDeUsuario desdeFinalizadaAEnProgreso: estadoEnProgreso

	self subclassResponsibility! !

!RolDeMiembro methodsFor: 'mover historia - dd' stamp: 'LL 11/17/2025 21:30:19'!
mover: unaHistoriaDeUsuario desdeFinalizadaAPendiente: estadoPendiente

	self subclassResponsibility! !


!RolDeMiembro methodsFor: 'private' stamp: 'LL 11/17/2025 20:41:41'!
= otroRol

	^self class = otroRol class! !


!classDefinition: #RolDesarrollador category: #'IS1-2c2025-2doParcial'!
RolDeMiembro subclass: #RolDesarrollador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!RolDesarrollador methodsFor: 'mover historia - dd' stamp: 'LL 11/17/2025 21:30:05'!
mover: unaHistoriaDeUsuario desdeFinalizadaAEnProgreso: estadoEnProgreso

	self error: unaHistoriaDeUsuario noSePuedeMoverDeFinalizadaAOtroEstadoMensajeDeError! !

!RolDesarrollador methodsFor: 'mover historia - dd' stamp: 'LL 11/17/2025 21:28:36'!
mover: unaHistoriaDeUsuario desdeFinalizadaAPendiente: estadoPendiente

	self error: unaHistoriaDeUsuario noSePuedeMoverDeFinalizadaAOtroEstadoMensajeDeError! !


!classDefinition: #RolProductOwner category: #'IS1-2c2025-2doParcial'!
RolDeMiembro subclass: #RolProductOwner
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!RolProductOwner methodsFor: 'mover historia - dd' stamp: 'LL 11/17/2025 21:10:32'!
mover: unaHistoriaDeUsuario desdeFinalizadaAEnProgreso: estadoEnProgreso

	unaHistoriaDeUsuario cambiarEstadoA: estadoEnProgreso.! !

!RolProductOwner methodsFor: 'mover historia - dd' stamp: 'LL 11/17/2025 21:13:05'!
mover: unaHistoriaDeUsuario desdeFinalizadaAPendiente: estadoPendiente

	unaHistoriaDeUsuario cambiarEstadoA: estadoPendiente! !


!classDefinition: #RolQA category: #'IS1-2c2025-2doParcial'!
RolDeMiembro subclass: #RolQA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!RolQA methodsFor: 'mover historia - dd' stamp: 'LL 11/17/2025 21:10:44'!
mover: unaHistoriaDeUsuario desdeFinalizadaAEnProgreso: estadoEnProgreso

	unaHistoriaDeUsuario cambiarEstadoA: estadoEnProgreso.! !

!RolQA methodsFor: 'mover historia - dd' stamp: 'LL 11/17/2025 21:29:49'!
mover: unaHistoriaDeUsuario desdeFinalizadaAPendiente: estadoPendiente

	self error: unaHistoriaDeUsuario noSePuedeMoverDeFinalizadaAOtroEstadoMensajeDeError! !


!classDefinition: #TestKanban category: #'IS1-2c2025-2doParcial'!
TestCase subclass: #TestKanban
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2c2025-2doParcial'!

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 15:37:00'!
test01PrioridadMediaPorDefecto

	| unaHistoria |
	unaHistoria := HistoriaDeUsuario conNombre: 'Implementar login'.
	
	self assert: (unaHistoria tieneNombre: 'Implementar login').
	self assert: (unaHistoria tienePrioridadMedia).! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 15:37:16'!
test02DefinePrioridad

	| unaHistoria |
	unaHistoria := HistoriaDeUsuario conNombre: 'Implementar login' conPrioridad: #PrioridadAlta.
	
	self deny: (unaHistoria tienePrioridadMedia).
	self assert: (unaHistoria tienePrioridadAlta).! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:08:19'!
test03DefineResponsables

	| unaHistoria |
	unaHistoria := HistoriaDeUsuario conNombre: 'Implementar login' conPrioridad: #PrioridadAlta conResponsables: (Set with: self unDesarrollador).
	
	self assert: (unaHistoria tieneComoResponsableA: self unDesarrollador).! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:08:28'!
test04AgregarResponsables

	| unaHistoria |
	unaHistoria := self unaHistoriaSinResponsables.
	
	unaHistoria agregarResponsables: (Set with: self unDesarrollador).
	
	self assert: (unaHistoria tieneComoResponsableA: self unDesarrollador).! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:09:57'!
test05AgregarMasResponsables

	| unaHistoria |
	unaHistoria := self unaHistoriaSinResponsables.
	
	unaHistoria agregarResponsables: (Set with: self unDesarrollador).
	unaHistoria agregarResponsables: (Set with: self otroDesarrollador).
	
	self assert: (unaHistoria tieneComoResponsableA: self unDesarrollador).
	self assert: (unaHistoria tieneComoResponsableA: self otroDesarrollador).! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:08:46'!
test06ConsultarNombrePrioridadYResponsables

	| unaHistoria |
	unaHistoria := HistoriaDeUsuario conNombre: 'Implementar login' conPrioridad: #PrioridadBaja conResponsables: (Set with: self unDesarrollador).
	
	self assert: (unaHistoria nombre) equals: 'Implementar login'.
	self assert: (unaHistoria prioridad) equals: #PrioridadBaja.
	self assert: (unaHistoria responsables) equals: (Set with: self unDesarrollador).! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:39:39'!
test07MoverDePendienteAEnProgreso

	| unaHistoria |
	unaHistoria := self unaHistoria.
	
	unaHistoria moverA: self estadoEnProgreso siendo: self unDesarrollador.
	
	self assert: (unaHistoria estaEnEstado: self estadoEnProgreso).! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:39:52'!
test08NoPuedoMoverDePendienteAFinalizada

	| unaHistoria |
	unaHistoria := self unaHistoria.
	
	self should: [ unaHistoria moverA: self estadoFinalizada siendo: self unDesarrollador ] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unaHistoria noSePuedeMoverDePendienteAFinalizadaMensajeDeError.
			self assert: (unaHistoria estaEnEstado: self estadoPendiente).
		]
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:39:56'!
test09NoPuedoMoverDePendienteAEnProgresoSinResponsableAsignado

	| unaHistoria |
	unaHistoria := self unaHistoriaSinResponsables.
	
	self should: [ unaHistoria moverA: self estadoEnProgreso siendo: self unDesarrollador ] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unaHistoria noSePuedeMoverDePendienteAEnProgresoSinResponsableAsignadoMensajeDeError.
			self assert: (unaHistoria estaEnEstado: self estadoPendiente).
		]
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:40:21'!
test10NoPuedoMoverDeFinalizadaAOtroEstado

	| unaHistoria |
	unaHistoria := self unaHistoria.
	
	unaHistoria moverA: self estadoEnProgreso siendo: self unDesarrollador.
	unaHistoria moverA: self estadoFinalizada siendo: self unDesarrollador.
	
	self should: [ unaHistoria moverA: self estadoEnProgreso siendo: self unDesarrollador ] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unaHistoria noSePuedeMoverDeFinalizadaAOtroEstadoMensajeDeError.
			self assert: (unaHistoria estaEnEstado: self estadoFinalizada).
		]
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:40:25'!
test11NoPuedoMoverDeUnEstadoAEseMismoEstado

	| unaHistoria |
	unaHistoria := self unaHistoria.
	
	self should: [ unaHistoria moverA: self estadoPendiente siendo: self unDesarrollador ]
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unaHistoria noSePuedeMoverAlEstadoQueYaEstabaMensajeDeError.
		]
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:40:11'!
test12UnProductOwnerPuedeMoverHistoriasDeFinalizadaAEnProgreso

	| unaHistoria |
	unaHistoria := self unaHistoria.
	unaHistoria moverA: self estadoEnProgreso siendo: self unDesarrollador.
	unaHistoria moverA: self estadoFinalizada siendo: self unDesarrollador.
	
	unaHistoria moverA: self estadoEnProgreso siendo: self unProductOwner.
	
	self assert: (unaHistoria estaEnEstado: self estadoEnProgreso)
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:43:14'!
test13UnProductOwnerPuedeMoverHistoriasDeFinalizadaAPendiente

	| unaHistoria |
	unaHistoria := self unaHistoria.
	unaHistoria moverA: self estadoEnProgreso siendo: self unDesarrollador.
	unaHistoria moverA: self estadoFinalizada siendo: self unDesarrollador.
	
	unaHistoria moverA: self estadoPendiente siendo: self unProductOwner.
	
	self assert: (unaHistoria estaEnEstado: self estadoPendiente)
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/17/2025 19:49:12'!
test14UnQAPuedeMoverHistoriasDeFinalizadaAEnProgreso

	| unaHistoria |
	unaHistoria := self unaHistoria.
	unaHistoria moverA: self estadoEnProgreso siendo: self unDesarrollador.
	unaHistoria moverA: self estadoFinalizada siendo: self unDesarrollador.
	
	unaHistoria moverA: self estadoEnProgreso siendo: self unQA.
	
	self assert: (unaHistoria estaEnEstado: self estadoEnProgreso)
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/18/2025 00:18:47'!
test15BuscarResponsablePorNombre

	| unaHistoria |
	unaHistoria := self unaHistoriaSinResponsables.
	
	unaHistoria agregarResponsables: (Set with: self unDesarrollador).
	
	self assert: (unaHistoria tieneUnResponsableLlamado: 'Juan Perez').
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/18/2025 00:19:05'!
test16BuscarResponsablePorNombreCasoEquipoDeTrabajo

	| unaHistoria |
	unaHistoria := self unaHistoriaSinResponsables.
	
	unaHistoria agregarResponsables: (Set with: (EquipoDeTrabajo llamado: 'Juan-Maria' conformadoPor: (Set with: self unDesarrollador with: self otroDesarrollador))).
	
	self assert: (unaHistoria tieneUnResponsableLlamado: 'Juan Perez').
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/18/2025 00:20:03'!
test17BuscarResponsablePorNombreCasoRecursivo

	| unaHistoria equipoDeDevs |
	unaHistoria := self unaHistoriaSinResponsables.
	equipoDeDevs := EquipoDeTrabajo llamado: 'Juan-Maria' conformadoPor: (Set with: self unDesarrollador with: self otroDesarrollador).
	
	unaHistoria agregarResponsables: (Set with: (EquipoDeTrabajo llamado: 'Juan-Maria+QA' conformadoPor: (Set with: equipoDeDevs with: self unQA))).
	
	self assert: (unaHistoria tieneUnResponsableLlamado: 'Juan Perez').
	! !

!TestKanban methodsFor: 'tests' stamp: 'LL 11/18/2025 00:25:31'!
test18BuscarResponsablePorNombreDeEquipo

	| unaHistoria |
	unaHistoria := self unaHistoriaSinResponsables.
	
	unaHistoria agregarResponsables: (Set with: (EquipoDeTrabajo llamado: 'Juan-Maria' conformadoPor: (Set with: self unDesarrollador with: self otroDesarrollador))).
	
	self assert: (unaHistoria tieneUnResponsableLlamado: 'Juan-Maria').
	! !


!TestKanban methodsFor: 'test objects' stamp: 'LL 11/17/2025 20:00:55'!
estadoEnProgreso

	^EstadoEnProgreso new! !

!TestKanban methodsFor: 'test objects' stamp: 'LL 11/17/2025 20:00:59'!
estadoFinalizada

	^EstadoFinalizada new! !

!TestKanban methodsFor: 'test objects' stamp: 'LL 11/17/2025 20:01:05'!
estadoPendiente

	^EstadoPendiente new! !

!TestKanban methodsFor: 'test objects' stamp: 'LL 11/18/2025 00:31:28'!
otroDesarrollador

	^MiembroIndividual conNombre: 'Maria Gomez' conRol: RolDesarrollador new! !

!TestKanban methodsFor: 'test objects' stamp: 'LL 11/18/2025 00:31:28'!
unDesarrollador

	^MiembroIndividual conNombre: 'Juan Perez' conRol: RolDesarrollador new! !

!TestKanban methodsFor: 'test objects' stamp: 'LL 11/18/2025 00:31:28'!
unProductOwner

	^MiembroIndividual conNombre: 'Pedro Gutierrez' conRol: RolProductOwner new! !

!TestKanban methodsFor: 'test objects' stamp: 'LL 11/18/2025 00:31:28'!
unQA
	^MiembroIndividual conNombre: 'Juana Rodriguez' conRol: RolQA new! !

!TestKanban methodsFor: 'test objects' stamp: 'LL 11/17/2025 19:09:28'!
unaHistoria

	^HistoriaDeUsuario conNombre: 'Implementar login' conPrioridad: #PrioridadBaja conResponsables: (Set with: self unDesarrollador).! !

!TestKanban methodsFor: 'test objects' stamp: 'LL 11/17/2025 16:53:15'!
unaHistoriaSinResponsables

	^HistoriaDeUsuario conNombre: 'Implementar login'.! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 61 53 56 62 53 62 52 57 55 55 53 109 106 59 57 53 127 63 61 102 61 59 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 86 106 123 39 39 62 39 57 55 57 60 39 56 59 65 55 63 65 57 62 39 74 118 116 119 112 115 108 121 65 39 60 53 59 53 55 39 57 55 56 61 55 61 55 64 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 8 31 17 56 64 57 53 56 61 63 53 56 53 57 59 17 109 108 107 118 121 104 17 109 108 107 118 121 104 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 55 65 56 63 65 55 56 53 64 61 57 64 60 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 55 55 63 62 53 122 123 17 59 63 62 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 56 65 57 57 65 58 62 53 55 58 61 59 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 62 60 62 53 122 123 17 59 60 55 55 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 56 65 59 60 65 60 59 53 63 55 63 62 55 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 59 62 63 53 122 123 17 62 57 59 59 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 56 61 65 56 59 53 62 59 63 58 64 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 56 63 59 53 122 123 17 60 58 63 61 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 57 57 65 59 61 53 57 64 60 60 57 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 60 56 64 55 53 122 123 17 58 64 63 56 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 57 62 65 60 58 53 59 59 57 61 57 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 61 57 64 53 122 123 17 58 63 59 62 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 57 63 65 59 59 53 61 55 60 63 59 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 60 56 64 55 53 122 123 17 58 64 63 56 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 57 64 65 55 63 53 56 59 55 63 62 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 61 57 64 53 122 123 17 58 63 59 62 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 62 91 56 64 65 59 61 65 55 64 53 58 61 60 64 55 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 104 115 110 118 58 54 121 108 119 118 122 54 108 113 108 121 106 112 106 112 118 122 52 108 117 52 106 115 104 122 108 52 57 55 57 56 52 56 106 54 87 104 123 121 118 117 108 122 54 87 104 123 121 118 117 108 122 52 90 123 104 123 108 53 122 123 17 59 60 64 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 62 91 56 64 65 60 55 65 57 61 53 55 55 58 64 62 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 104 115 110 118 58 54 121 108 119 118 122 54 108 113 108 121 106 112 106 112 118 122 52 108 117 52 106 115 104 122 108 52 57 55 57 56 52 56 106 54 87 104 123 121 118 117 108 122 54 87 104 123 121 118 117 108 122 52 75 108 106 118 121 104 123 118 121 53 122 123 17 58 56 55 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 62 91 56 64 65 60 55 65 59 58 53 61 55 61 56 63 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 104 115 110 118 58 54 121 108 119 118 122 54 108 113 108 121 106 112 106 112 118 122 52 108 117 52 106 115 104 122 108 52 57 55 57 56 52 56 106 54 87 104 123 121 118 117 108 122 54 87 104 123 121 118 117 108 122 52 90 123 104 123 108 53 122 123 17 59 60 64 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 62 91 56 64 65 60 58 65 60 59 53 56 56 58 57 58 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 104 115 110 118 58 54 121 108 119 118 122 54 108 113 108 121 106 112 106 112 118 122 52 108 117 52 106 115 104 122 108 52 57 55 57 56 52 56 106 54 87 104 123 121 118 117 108 122 54 87 104 123 121 118 117 108 122 52 72 107 104 119 123 108 121 53 122 123 17 59 64 57 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 56 65 55 60 65 56 61 53 55 62 59 61 63 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 60 57 62 53 122 123 17 59 55 63 62 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 56 65 57 55 65 58 64 53 61 61 61 58 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 63 55 60 53 122 123 17 59 55 56 62 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 56 65 58 59 65 58 59 53 55 56 63 59 59 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 64 61 55 53 122 123 17 60 55 57 61 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 57 65 57 59 65 59 59 53 64 58 59 62 59 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 57 62 55 53 122 123 17 59 58 64 64 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 57 65 58 62 65 59 56 53 56 62 60 57 59 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 63 58 59 53 122 123 17 59 63 56 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 55 65 58 56 65 56 62 53 61 64 58 63 58 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 62 60 62 53 122 123 17 59 60 55 55 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 55 65 58 61 65 58 62 53 57 58 60 63 62 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 63 62 58 60 53 122 123 17 59 59 58 57 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 55 65 59 62 65 60 60 53 60 61 57 64 59 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 118 121 121 108 106 106 112 118 117 52 119 104 121 106 112 104 115 108 122 54 57 106 57 55 57 60 54 56 56 55 55 59 58 53 122 123 17 58 61 59 62 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 55 65 59 63 65 59 59 53 58 59 58 59 64 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 55 55 63 62 53 122 123 17 59 63 62 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 58 65 55 57 65 57 58 53 60 60 58 57 61 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 56 63 59 53 122 123 17 60 58 63 61 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 58 65 55 58 65 55 63 53 56 57 60 59 61 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 60 56 64 55 53 122 123 17 58 64 63 56 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 59 91 57 55 65 55 55 65 59 63 53 56 63 60 63 60 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 63 55 60 53 122 123 17 59 55 56 62 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 59 91 57 56 65 59 64 65 60 63 53 56 55 55 56 55 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 56 60 63 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 106 57 55 57 60 52 56 108 121 87 104 121 106 112 104 115 52 56 60 52 77 104 125 118 121 108 129 106 118 74 118 116 119 118 122 112 106 112 118 117 88 124 112 123 104 117 107 118 81 108 121 104 121 120 124 112 104 81 124 110 104 107 118 121 72 122 123 121 118 117 104 124 123 104 53 122 123 17 59 55 64 55 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 55 62 91 56 62 65 60 57 65 60 58 53 63 55 62 60 64 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 121 108 119 118 122 54 91 124 122 83 112 105 121 118 122 94 108 105 54 105 104 106 114 108 117 107 102 106 124 112 122 54 91 124 122 83 112 105 121 118 122 52 80 123 108 121 104 106 112 118 117 55 56 52 90 123 118 121 128 55 57 52 56 90 118 115 118 75 118 116 112 117 112 118 53 122 123 17 58 57 61 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 55 62 91 56 63 65 55 57 65 58 62 53 60 60 57 60 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 121 108 119 118 122 54 91 124 122 83 112 105 121 118 122 94 108 105 54 105 104 106 114 108 117 107 102 106 124 112 122 54 91 124 122 83 112 105 121 118 122 52 80 123 108 121 104 106 112 118 117 55 56 52 90 123 118 121 128 55 57 52 57 53 122 123 17 56 64 56 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 56 65 55 61 65 60 59 53 58 56 63 60 63 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 89 118 115 75 108 84 112 108 116 105 121 118 53 122 123 17 59 55 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 56 57 65 55 60 53 64 55 55 64 59 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 91 108 122 123 82 104 117 105 104 117 52 123 108 122 123 56 62 53 122 123 17 60 63 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 58 55 65 58 64 53 56 56 57 61 61 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 64 52 123 108 122 123 56 63 53 122 123 17 60 62 59 59 57 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 60 91 56 64 65 57 63 65 55 57 53 58 59 58 60 64 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 53 122 123 17 57 58 56 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 55 65 57 60 65 57 64 53 58 62 63 63 60 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 108 121 104 80 123 108 121 104 106 112 118 117 53 122 123 17 57 59 58 63 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 55 65 60 63 65 56 62 53 64 60 61 59 63 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 55 56 53 122 123 17 56 59 62 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 56 65 55 57 65 58 55 53 55 63 63 58 63 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 55 57 53 122 123 17 57 58 62 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 56 65 58 59 65 58 57 53 61 58 57 63 61 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 55 58 53 122 123 17 58 59 60 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 56 65 58 63 65 60 61 53 55 56 57 57 55 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 55 60 53 122 123 17 59 58 64 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 56 65 59 55 65 60 63 53 58 59 60 55 62 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 55 61 53 122 123 17 60 56 63 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 60 65 58 61 65 57 58 53 59 59 61 60 55 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 55 62 53 122 123 17 60 63 57 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 60 65 60 58 65 58 55 53 62 61 63 57 62 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 55 63 53 122 123 17 61 64 61 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 61 65 55 59 65 59 61 53 57 64 59 56 62 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 55 64 53 122 123 17 63 56 57 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 61 65 59 59 65 60 62 53 59 56 63 57 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 56 55 53 122 123 17 64 56 56 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 61 65 59 63 65 57 57 53 57 62 59 62 62 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 123 108 122 123 56 56 53 122 123 17 64 64 58 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 61 65 60 64 65 55 58 53 57 61 59 60 57 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 53 122 123 17 64 60 61 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 62 65 58 57 65 57 61 53 57 57 57 59 60 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 89 108 118 121 110 104 117 112 129 104 121 80 109 122 53 122 123 17 64 60 62 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 64 65 56 56 65 58 57 53 58 58 58 63 59 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 56 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 96 89 108 118 121 110 104 117 112 129 118 80 109 122 53 122 123 17 64 63 64 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 64 65 58 56 65 59 56 53 60 59 61 62 57 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 56 57 55 63 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 64 65 59 57 65 57 57 53 61 61 60 56 57 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 58 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 76 117 123 121 108 84 118 125 108 121 72 96 84 118 125 108 121 72 90 112 108 117 107 118 53 122 123 17 56 57 57 61 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 64 65 59 63 65 58 55 53 58 59 64 60 56 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 59 52 123 108 122 123 56 58 53 122 123 17 56 57 64 59 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 64 65 60 56 65 55 61 53 61 60 58 63 56 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 60 52 123 108 122 123 56 59 53 122 123 17 56 58 61 59 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 56 64 65 60 60 65 57 62 53 56 56 57 55 57 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 61 52 89 108 118 121 110 104 117 112 129 118 80 109 122 75 108 76 122 123 104 107 118 122 53 122 123 17 56 58 62 60 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 55 65 55 60 65 59 58 53 59 56 60 64 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 62 52 89 108 109 104 106 123 118 121 75 108 115 108 110 104 121 84 118 125 108 121 72 90 112 108 117 107 118 72 115 76 122 123 104 107 118 53 122 123 17 56 60 60 55 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 55 65 55 63 65 56 55 53 58 56 55 62 59 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 63 52 89 108 109 104 106 123 118 121 88 124 112 123 118 87 121 112 116 108 121 118 122 80 109 122 75 108 76 122 123 104 107 118 53 122 123 17 56 61 56 58 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 55 65 56 61 65 60 62 53 56 63 63 60 55 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 64 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 75 108 74 118 117 107 112 106 112 118 117 75 108 84 118 125 108 121 72 84 112 122 116 118 76 122 123 104 107 118 53 122 123 17 56 61 59 58 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 55 65 58 56 65 59 58 53 55 61 56 62 59 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 55 52 88 124 112 123 118 80 109 122 75 108 76 122 123 104 107 118 77 112 117 104 115 112 129 104 107 104 53 122 123 17 56 62 55 59 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 55 65 58 61 65 58 63 53 62 56 55 63 55 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 56 52 88 124 112 123 118 80 109 122 75 108 76 122 123 104 107 118 87 108 117 107 112 108 117 123 108 53 122 123 17 56 62 61 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 56 65 55 61 65 57 62 53 60 60 57 58 57 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 57 52 84 124 108 125 118 89 108 122 119 118 117 122 104 105 112 115 104 107 75 108 84 118 125 108 121 79 112 122 123 118 121 112 104 122 72 115 84 112 108 116 105 121 118 75 108 87 121 118 128 108 106 123 118 53 122 123 17 56 63 63 59 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 56 65 57 56 65 58 58 53 58 64 57 62 60 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 58 52 88 124 112 123 118 80 109 122 87 118 121 89 118 115 75 108 84 112 108 116 105 121 118 53 122 123 17 57 55 61 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 56 65 58 55 65 60 63 53 56 63 61 63 63 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 58 52 88 124 112 123 118 80 109 122 87 118 121 89 118 115 75 108 84 112 108 116 105 121 118 53 122 123 17 57 56 57 58 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 56 65 59 56 65 58 57 53 63 60 57 62 64 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 59 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 76 117 81 108 121 104 121 120 124 112 104 75 108 76 122 123 104 107 118 122 53 122 123 17 57 56 58 63 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 58 65 58 60 65 55 59 53 62 64 62 62 64 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 60 52 123 108 122 123 56 60 53 122 123 17 57 56 63 63 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 56 56 65 60 62 53 60 63 55 56 59 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 61 52 123 108 122 123 56 61 53 122 123 17 57 58 62 61 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 56 64 65 58 61 53 60 60 55 61 61 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 62 52 123 108 122 123 56 62 53 122 123 17 57 59 60 61 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 57 55 65 57 59 53 59 62 64 58 58 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 62 52 123 108 122 123 56 62 53 122 123 17 57 59 60 61 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 57 63 65 59 58 53 62 63 63 64 64 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 63 52 123 108 122 123 56 63 53 122 123 17 57 59 63 60 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 58 55 65 56 59 53 64 63 62 62 57 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 63 52 88 124 112 123 118 80 109 122 75 108 79 112 122 123 118 121 112 104 75 108 92 122 124 104 121 112 118 53 122 123 17 57 59 58 63 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 58 63 65 58 64 53 57 64 56 55 64 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 58 55 52 74 121 108 118 81 108 121 104 121 120 124 112 104 75 108 84 112 108 116 105 121 118 122 75 108 87 121 118 128 108 106 123 118 53 122 123 17 57 60 57 56 56 17 52 52 52 52 52 52 52 52 52 52 17 17))!