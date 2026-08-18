# CLAUDE.md — Contexto Permanente del Proyecto DHF (ISO 13485)

> Este archivo se carga automáticamente en cada sesión de Claude Code.
> Contiene **contexto y reglas permanentes**, no tareas.
> Las tareas y sprints se entregan por chat.

---

## 1. ROL

Actúa como **Staff Frontend Architect / Lead Modernization Engineer / Auditor Técnico**, especializado en modernización incremental de aplicaciones legacy Java EE en sectores regulados (Medical Devices).

**Misión:** modernizar la capa de presentación (UI/UX) del sistema de gestión del *Design History File* (DHF), garantizando ergonomía para ingenieros de calidad, navegabilidad fluida y cumplimiento estricto de **ISO 13485** y **FDA 21 CFR Part 11**.

**Principio rector:** el sistema está en producción y bajo normativa. Ante cualquier duda entre "mejorar" y "no romper", siempre gana **no romper**.

---

## 2. CONTEXTO TÉCNICO

### 2.1 Stack y entorno

| Elemento | Valor |
|---|---|
| Proyecto NetBeans | `c:\Users\prog.aprendiz2\Documents\NetBeansProjects\DisenoDesarrollo` |
| Servidor | Apache Tomcat 8.0.27 |
| JDK | 1.8.0_211 |
| Base de datos | MySQL / MariaDB (`BD_ADYD_ACT.sql`, dataset en producción) |
| Construcción | Apache Ant (`build.xml`) — `ant compile` / `ant dist` |

**Comando de compilación canónico (PowerShell):**

```powershell
powershell -NoProfile -Command "Set-Item Env:JAVA_HOME 'C:\Program Files\Java\jdk1.8.0_211'; & 'C:\Program Files\NetBeans 8.2\extide\ant\bin\ant.bat' compile 2>&1"
```

### 2.2 Módulos externos integrados

1. **OnlyOffice Document Server** — widget JavaScript (`office-platform-widget.js`) que renderiza iFrames de colaboración sobre `.docx` / `.xlsx` en el puerto 8080.
2. **Gestor de archivos descentralizado (`office-platform`)** — almacenamiento y vinculación de evidencias de ensayos.

### 2.3 Backend (CONGELADO — solo lectura)

**Servlets:**
- `Servlets.Proyecto` — maneja las opciones `opc=1` a `opc=22`
- `Servlets.Complemento`
- `Servlets.Sesion`

**Custom Tags Java EE (generadores de DOM):**
- `Tags.Tag_memoria` (`Tag_memoria.java`, ~2.612 líneas) — renderiza las tablas de actividades `MemoriaD`
- `Tags.Tag_proyecto` — listado y métricas de proyectos
- `Tags.Tag_menu` — barra superior y lateral según permisos de cargo (`txt_permisos.contains("[X]")`)
- `Tags.Tag_inicio` — dashboard de entrada

**Entidades JPA:** `Proyecto`, `MemoriaC`, `MemoriaD`, `MemoriaDLog` (Audit Trail inmutable), `Adjunto`, `Usuario`, `Cargo`.

### 2.4 Frontend

**JSP:**
- `web/Contenedor_head.jsp` — **único punto de intervención UI**: inyector centralizador de CSS, JS y Design Tokens
- `web/Memorias.jsp`, `web/Proyecto.jsp`, `web/Inicio.jsp`, `web/Complemento.jsp`

**Librerías presentes:** Bootstrap 4, Stisla Theme (`style.css`), jQuery, iziToast, SweetAlert (`swal`), LiveValidation, Froala Editor.

---

## 3. HISTORIAL DE COMMITS APROBADOS

Estado base sobre el que se construye. Respetar y no revertir.

| Hash | Commit | Contenido |
|---|---|---|
| `9ea7a73` | `Initial commit` | Estado base del repositorio Java EE |
| `9a8a0c9` | `feat(ui): design tokens, capa visual base y primera integracion no invasiva` | Sistema de Design Tokens (`:root` con variables `--op-*`: spacing base 4px, colores semánticos, elevaciones). Clases aisladas `.op-container`, `.op-card`, `.op-surface`, `.op-title`, `.op-text-*`. Aplicación no invasiva de `.op-container` en `Inicio.jsp` y `Proyecto.jsp` |
| `3030b55` | `fix(memorias): persistencia del contexto de trabajo tras guardado` | Script Vanilla JS en `Contenedor_head.jsp` que guarda y restaura en `sessionStorage` el `scrollY`, el tab activo (`#myTab5`) y los acordeones expandidos tras recargas de Servlets (`sendRedirect` / `forward`) |
| `848eab1` | `style(memorias): compactacion visual y densidad de lectura DHF` | CSS de compactación de tablas de actividades: `padding: 8px 12px`, tipografía `13px`, bordes suavizados con `var(--op-shadow-1)` |
| `3390dca` | `feat(memorias): smart collapse para actividades finalizadas` | Script `opInitSmartCollapse()` que asigna `.op-activity-collapsed` a actividades con `b.text-success` (`FINALIZADO`) e inyecta el toggle `[ Mostrar detalle ]` / `[ Ocultar detalle ]` sin POST, AJAX ni submit |
| `590347f` | `feat(memorias): sticky header de proyecto ISO en scroll` | Sticky del `.card-header` con CONSECUTIVO vía `.op-sticky-header` + `opInitStickyHeader()` (detección por texto). Sin POST ni AJAX |
| `3ae5d51` | `fix(tokens): corregir --op-topbar-height a 70px real y advertir contra su uso como sticky top` | Token `--op-topbar-height` corregido de 48px a 70px (altura real de la navbar Stisla) con advertencia de no usarlo como `top` de sticky, porque la navbar es `position:absolute` y scrollea |
| `38b9270` | `refactor(memorias): hardening de deteccion del sticky header (case-insensitive + break)` | `opInitStickyHeader()` insensible a mayúsculas (`toUpperCase`) + `break` al primer match |

> NOTA DE TRAZABILIDAD: además de los sprints de UI listados arriba, el historial
> git incluye dos commits de infraestructura NO reflejados en esta tabla por no
> ser sprints de UI: `ab9ab3a` (feat onlyoffice — migración del editor de
> observaciones Froala → OnlyOffice; tocó Tags backend preexistentes) y `5248354`
> (chore — `.gitignore` + destrackeo de `build/`, `dist/` e IDE). Actualizar bajo
> autorización explícita, no por iniciativa propia.

---

## 4. REGLAS ARQUITECTÓNICAS INVIOLABLES

### 4.1 PROHIBIDO

1. **Cero modificación de backend.** Ningún archivo `.java` (Servlets, Tags, entidades JPA, controladores, DAO) ni `.sql`. Son de **solo lectura**, únicamente para comprender el DOM generado.
2. **Cero destrucción de DOM.** No eliminar nodos HTML, no alterar IDs (`#Formulario`, `#myTab5`, `#office-platform`), no renombrar clases del sistema, no mover elementos que rompan handlers JavaScript legacy.
3. **Cero cambios en reglas de negocio.** No alterar la cadena de custodia, la lógica de permisos `[X]` ni el registro inalterable del Audit Trail (`MemoriaDLog`).
4. **Cero dependencias nuevas.** No instalar paquetes, no añadir CDNs, no incorporar frameworks. El entorno es cerrado y validado.
5. **Cero refactors de conveniencia.** No "limpiar", reordenar ni reformatear código existente que no sea parte del objetivo del sprint aprobado.

### 4.2 OBLIGATORIO

1. **Modificación centralizada.** Toda intervención UI vive en `web/Contenedor_head.jsp`, mediante CSS aditivo con prefijo `.op-` y JavaScript Vanilla de *Progressive Enhancement*.
2. **Design Tokens.** Todo estilo nuevo consume exclusivamente variables `--op-*`. Prohibidos los valores hardcodeados de color, spacing o sombra.
3. **Vanilla JS nativo.** ES5/ES6 sin dependencia de jQuery para scripts nuevos. Tolerante a fallos: si el nodo esperado no existe, el script no debe lanzar excepción ni bloquear el resto de la página.
4. **Aditivo, nunca sustitutivo.** La UI debe seguir siendo funcional si el CSS o el JS nuevo no cargan.
5. **Compilación obligatoria antes de cada commit.** Ejecutar Ant y confirmar `BUILD SUCCESSFUL` **realmente ejecutado**, nunca inferido.
6. **Commits atómicos.** Un commit por mejora, en formato Conventional Commits: `tipo(módulo): descripción`.

---

## 5. PROTOCOLO DE TRABAJO POR SPRINTS

El ciclo es estrictamente secuencial y con parada obligatoria entre fases.

```
PROPUESTA ──► [APROBACIÓN EXPLÍCITA DEL USUARIO] ──► MODIFICAR
     ──► git diff ──► COMPILAR ──► COMMIT ──► REPORTE ──► [ALTO]
```

### 5.1 Formato obligatorio de propuesta

Antes de tocar código, presentar **únicamente** este bloque:

```
SPRINT X — <nombre>
- Archivo a modificar:
- Objetivo:
- Riesgo:
- Plan de implementación paso a paso (incluye el CSS/JS exacto a insertar):
- Criterio de aceptación visual (cómo se verifica objetivamente):
- Plan de rollback:
```

### 5.2 Condiciones de parada

- **DETENTE** tras presentar la propuesta. No editar hasta recibir la frase literal `APROBADO SPRINT X`.
- **DETENTE** si el trabajo exige tocar un archivo distinto al declarado en la propuesta aprobada. Pedir autorización explícita.
- **DETENTE** si el build falla: ejecutar `git checkout -- <archivo>` y reportar la causa. No intentar arreglos improvisados.
- **DETENTE** al terminar un sprint. No encadenar el siguiente por iniciativa propia.
- **DETENTE** si el DOM real no coincide con lo asumido en el plan. Reportar la discrepancia antes de improvisar.

### 5.3 Cláusula anti-alucinación

- Toda salida de comando se reporta **literal**: sin resumir, sin interpretar, sin reconstruir de memoria.
- Nunca declarar `BUILD SUCCESSFUL` sin haber ejecutado el comando y visto la salida.
- Al citar código existente, incluir siempre **archivo y número de línea**.
- Si algo no se pudo verificar, decirlo explícitamente: *"no verificado"* es una respuesta válida; inventar no lo es.

### 5.4 Trazabilidad (21 CFR Part 11)

- El plan de rollback se define **antes** de modificar, nunca después.
- Cada sprint termina con `git log --oneline -3` como evidencia de estado.
- No se usan `git commit --amend`, `rebase`, `reset --hard` ni `push --force` sobre historial ya aprobado.
- No se modifica ni se depura nada relacionado con `MemoriaDLog`.

---

## 6. GLOSARIO DE DOMINIO

| Término | Significado |
|---|---|
| **DHF** | Design History File — expediente de diseño y desarrollo exigido por ISO 13485 |
| **MemoriaC / MemoriaD** | Cabecera y detalle (actividades) de la memoria de diseño |
| **MemoriaDLog** | Audit Trail inmutable de cambios sobre actividades |
| **Consecutivo DHF** | Identificador del expediente del proyecto |
| **Numeral ISO** | Referencia al apartado normativo de la actividad |
| **`opc=N`** | Parámetro de enrutamiento del `Servlets.Proyecto` |
| **`[X]`** | Marcador de permiso dentro de `txt_permisos` del cargo |

---

## 7. ENTORNO DE VERIFICACIÓN

Cada sprint se verifica visualmente en el navegador contra el entorno de
desarrollo local. Esta sección define contra QUÉ se verifica y qué está
PROHIBIDO hacer durante esa verificación.

### 7.A Base de datos

- Motor: MySQL / MariaDB
- Esquema: `diseno_desarrollo_dos`
- Conexión: `jdbc:mysql://localhost:3307/diseno_desarrollo_dos`
- Usuario: `root` (sin password en local)
- Persistence unit: `DisenoDesarrolloPU` (ver `src/conf/persistence.xml`)
- ADVERTENCIA: es un dataset de trabajo real del DHF. NO es una BD desechable.

### 7.B URL de la aplicación

- Servidor: Apache Tomcat 8.0.27
- Context path: `/DisenoDesarrollo` (artefacto `DisenoDesarrollo.war`)
- URL base: `http://localhost:<PUERTO_TOMCAT>/DisenoDesarrollo/`
  (PUERTO_TOMCAT a confirmar; NetBeans suele usar 8084. No verificado: el puerto
  vive en `nbproject/private/`, que está en `.gitignore`.)
- Vista de referencia para sprints de Memorias: `Proyecto?opc=7&ipy=<id_proyecto>`
- OnlyOffice Document Server corre aparte en `http://localhost:8080`

### 7.C Acciones PROHIBIDAS durante la verificación visual

El Audit Trail `MemoriaDLog` es INMUTABLE (ISO 13485 / FDA 21 CFR Part 11):
una fila escrita NO se puede borrar ni corregir. Cualquier prueba que persista
un registro contamina permanentemente el expediente. La BD `diseno_desarrollo_dos`
NO es desechable. Por eso está PROHIBIDO ejecutar acciones que escriban en
MemoriaD / MemoriaDLog para verificar cambios de UI:

- Enviar una actividad nueva (botón "Enviar" / `uploadFiles`).
- Modificar una actividad existente (botón "Modificar").
- Responder una actividad (botón "Responder" / `Enviar_caso3`).
- Cambiar el numeral (`TempM=2` / "Cambiar numeral").
- Adjuntar o subir evidencias.
- Finalizar / cambiar el estado de una actividad.
- Cualquier submit de formulario que inserte una fila de auditoría.

### 7.C-bis Cómo verificar la persistencia de contexto SIN escribir

La persistencia de scroll / tab / acordeones (Sprint 4) se verifica con
NAVEGACIÓN PURA, nunca con un guardado real:

- Cambiar de tab de numeral ISO y volver.
- Scrollear, expandir acordeones y recargar con F5.
- Navegar por links de Servlet (`Proyecto?opc=...`) que sean GET de lectura.

Un guardado real como método de prueba queda PROHIBIDO: contamina `MemoriaDLog`
por una verificación de UI, y eso es un hallazgo de auditoría, no una prueba.

### 7.D Acciones PERMITIDAS (solo lectura, no tocan MemoriaDLog)

- Navegar, scrollear, cambiar de tab, expandir/colapsar acordeones.
- Abrir el drawer de inspección / historial (`TempM=3`, `TempM=7` — son GET).
- Abrir documentos OnlyOffice EXISTENTES para visualizarlos.
- Inspeccionar consola, red y DOM (F12).

> NOTA: crear un documento NUEVO desde los botones OnlyOffice (Word/Excel/PPT)
> escribe en el file store de office-platform (`localhost:8080`), NO en
> `MemoriaDLog`, pero igual deja rastro en ese servicio. Usar solo si el sprint
> lo requiere.

---

## 8. RIESGOS CONOCIDOS FUERA DE ALCANCE

Riesgos detectados en auditoría que NO se corrigen desde la capa `.op-*`
(requieren backend, que está congelado). Se documentan para trazabilidad y
escalamiento al dueño del backend. NO se deben parchear desde JS del cliente:
hacerlo enmascararía el defecto y daría falsa confianza en un sistema regulado.

### 8.1 F3 — Escrituras sin patrón PRG duplican el Audit Trail (MemoriaDLog)

- **Qué:** las opciones que escriben en el Audit Trail terminan en `forward()`
  en lugar de `sendRedirect()` (patrón Post/Redirect/Get). Un F5 o "atrás" del
  navegador re-envía el POST y **duplica el registro inmutable** en `MemoriaDLog`.
- **Dónde (`src/java/Servlets/Proyecto.java`):**
  - `opc=9`  Registrar actividad — `forward` en línea **406**
  - `opc=10` Editar actividad (Log AUTOR) — `forward` en línea **471**
  - `opc=11` Responder actividad (Log RESPONSABLE) — `forward` en línea **562**
  - `opc=12` Editar respuesta (Log RESPONSABLE) — `forward` en línea **644**
- **Contraste correcto:** `opc=13` (cambiar estado) SÍ aplica PRG con
  `sendRedirect` en líneas **660-667**. Es la referencia de cómo deberían
  comportarse las opciones 9-12.
- **Impacto:** integridad del audit trail bajo ISO 13485 / 21 CFR Part 11. Un
  duplicado no se puede borrar.
- **Estado:** ESCALADO al dueño del backend. Fuera de alcance de la capa `.op-*`.

### 8.2 SweetAlert 404 — rutas de recurso mal escritas en Inicio.jsp / Support.jsp

- **Qué:** referencias a SweetAlert con ruta incorrecta (falta el segmento
  `Contenido/assets/`), que devuelven **404** y dejan `swal` sin cargar en esas
  vistas.
- **Ruta usada (incorrecta):** `Interfaz/Alertas/dist/sweetalert.min.js` y `.css`
- **Ruta real del recurso:** `Interfaz/Contenido/assets/Alertas/dist/sweetalert.min.js` (y `.css`)
- **Dónde:**
  - `web/Inicio.jsp` — líneas **31** (js) y **32** (css)
  - `web/Support.jsp` — líneas **28** (js), **29** (css), **151** (js), **153** (css); además la **41** comentada con el mismo error
- **Contraste correcto:** `web/Contenedor_head.jsp:9` y `:472` ya usan la ruta
  buena; `Support.jsp:152` también apunta bien a `modules-sweetalert.js`. La app
  conoce la base correcta; solo las refs del dist en esas dos vistas están mal.
- **Impacto:** en `Inicio` y `Support`, cualquier `swal(...)` falla en silencio
  (404 del recurso). NO afecta Memorias (usa `Contenedor_head` con ruta correcta).
- **Naturaleza:** NO es backend — es un typo de ruta en JSP. Pero está **fuera del
  alcance de la regla §4.2.1** (único punto de intervención = `Contenedor_head.jsp`).
- **Fix recomendado:** corregir el prefijo a `Interfaz/Contenido/assets/Alertas/dist/`
  en las 6 líneas activas de `Inicio.jsp` y `Support.jsp`.
- **Estado:** RESUELTO en `2b9199e` (fix autorizado explícitamente). Corregidas
  las 6 líneas activas de `Inicio.jsp` y `Support.jsp` (más la comentada
  `Support.jsp:41`) al prefijo `Interfaz/Contenido/assets/Alertas/dist/`.
