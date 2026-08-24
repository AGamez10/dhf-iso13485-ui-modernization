# 🏥 DHF · Modernización de UI en sistema legacy Java EE (ISO 13485)

Modernización incremental de la capa de presentación de un sistema de gestión del **Design History File (DHF)** para dispositivos médicos, en producción y bajo normativa **ISO 13485** y **FDA 21 CFR Part 11**.

El objetivo del proyecto no es reescribir la aplicación, sino **intervenir la UI de forma quirúrgica** sobre un backend Java EE congelado: mejorar la ergonomía de los ingenieros de calidad que registran y auditan actividades de diseño, sin tocar una sola línea de lógica de negocio ni arriesgar la integridad del audit trail.

## 🎯 Rol y enfoque

Trabajo como responsable de la modernización de frontend sobre un sistema regulado en producción, bajo un principio rector no negociable:

> Ante cualquier duda entre "mejorar" y "no romper", siempre gana **no romper**.

## 🛠️ Stack técnico

| Capa | Tecnología |
|---|---|
| Backend | Java EE (Servlets, Custom Tags, JPA) — **congelado, solo lectura** |
| Frontend | JSP, Bootstrap 4, Stisla Theme, jQuery, Vanilla JS (ES5/ES6) |
| Servidor | Apache Tomcat 8.0.27 |
| Build | Apache Ant (`build.xml`) vía NetBeans |
| Base de datos | MySQL / MariaDB |
| Integraciones | OnlyOffice Document Server (edición colaborativa de evidencias .docx/.xlsx) |

## 🧱 Arquitectura de la intervención

Toda la modernización vive en un único punto de inyección centralizado (`Contenedor_head.jsp`), aplicando **CSS aditivo con Design Tokens** (`--op-*`) y **JavaScript vanilla de Progressive Enhancement**, sin dependencias nuevas y sin tocar el DOM legacy generado por los Custom Tags del backend.

Reglas arquitectónicas inviolables:

- **Cero modificación de backend**: ningún `.java` ni `.sql` se toca — son de solo lectura, únicamente para entender el DOM generado.
- **Cero destrucción de DOM**: no se eliminan nodos, IDs ni clases que rompan handlers JS legacy.
- **Cero dependencias nuevas**: entorno cerrado y validado, sin CDNs ni frameworks adicionales.
- **Aditivo, nunca sustitutivo**: la UI debe seguir funcionando si el CSS/JS nuevo no carga.
- **Compilación obligatoria** (`ant compile`) y verificación real de `BUILD SUCCESSFUL` antes de cada commit.

## 🔄 Protocolo de trabajo por sprints

El desarrollo sigue un ciclo estrictamente secuencial, con parada obligatoria entre fases:

```
PROPUESTA ──▶ [APROBACIÓN EXPLÍCITA] ──▶ MODIFICAR
──▶ git diff ──▶ COMPILAR ──▶ COMMIT ──▶ REPORTE ──▶ [ALTO]
```

Cada propuesta de sprint documenta archivo a modificar, objetivo, riesgo, plan de implementación, criterio de aceptación visual y **plan de rollback definido antes de tocar código**.

## ✅ Sprints entregados

| Sprint | Descripción |
|---|---|
| `feat(ui)` | Sistema de Design Tokens y capa visual base, integración no invasiva en vistas principales |
| `fix(memorias)` | Persistencia de contexto de trabajo (scroll, tab activo, acordeones) tras recargas del servidor |
| `style(memorias)` | Compactación visual y mejora de densidad de lectura en tablas de actividades DHF |
| `feat(memorias)` | Smart collapse de actividades finalizadas, sin POST ni AJAX |
| `feat(memorias)` | Sticky header de proyecto ISO en scroll |
| `fix(tokens)` | Corrección de token de altura real de navbar |
| `refactor(memorias)` | Hardening de detección del sticky header |
| `feat(onlyoffice)` | Migración del editor de observaciones de Froala a OnlyOffice embebido |

## 🔒 Cumplimiento normativo

El **Audit Trail** (`MemoriaDLog`) es inmutable por diseño: ningún registro se borra ni se corrige, conforme a ISO 13485 / FDA 21 CFR Part 11. Toda verificación visual de UI se hace mediante **navegación pura de solo lectura** (cambio de tabs, scroll, recarga con F5) — está explícitamente prohibido usar un guardado real como método de prueba, ya que contaminaría permanentemente el expediente de diseño.

## 📋 Hallazgos de auditoría escalados

Como parte del trabajo de modernización también se documentan y escalan riesgos detectados fuera del alcance de la capa de UI (p. ej. rutas de escritura sin patrón Post/Redirect/Get que podrían duplicar el audit trail), reportados al equipo dueño del backend en lugar de parcheados desde el cliente — para no enmascarar un defecto en un sistema regulado.

---

*Repositorio privado de código; este README describe el alcance y la arquitectura del proyecto con fines de portafolio. Nombres de tablas, servlets y detalles de infraestructura interna se omiten o generalizan.*
