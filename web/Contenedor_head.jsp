<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/izitoast/css/iziToast.min.css">
        <link href="Interfaz/Contenido/assets/Alertas/dist/sweetalert.css" rel="stylesheet" type="text/css" />
        <link href="Interfaz/Contenido/assets/Validacion/StyleSheetLiveValidation.css" rel="stylesheet"
            type="text/css" />
        <style>
            /* ═══════════════════════════════════════════════════════════════
               ENTERPRISE DESIGN SYSTEM (FASE 7) — 3-COLUMN WORKSPACE CSS
               ═══════════════════════════════════════════════════════════════ */
            :root {
                /* Spacing Grid Base 4px */
                --op-space-2: 2px;
                --op-space-4: 4px;
                --op-space-8: 8px;
                --op-space-12: 12px;
                --op-space-16: 16px;
                --op-space-20: 20px;
                --op-space-24: 24px;
                --op-space-32: 32px;

                /* Dimensiones de Layout */
                --col1-width: 260px;
                --col3-width: 380px;
                /* Alto real de la navbar Stisla (ver style.css:1612).
                   ADVERTENCIA: la navbar es position:absolute y SCROLLEA con la
                   pagina, NO es fixed. Por eso este valor NO debe usarse como
                   'top' de un position:sticky — no hay barra fija que evitar.
                   Es solo una referencia de alto, no un offset de anclaje. */
                --op-topbar-height: 70px;

                /* Surfaces & Borders */
                --op-surface-base: #F8F9FA;
                --op-surface-card: #FFFFFF;
                --op-surface-overlay: #FFFFFF;
                --op-surface-muted: #f1f5f9;
                --op-surface-muted-hover: #e2e8f0;
                --op-border-subtle: #E9ECEF;
                --op-border-strong: #CED4DA;
                --op-border-active: #0284C7;
                --op-border-muted: #cbd5e1;
                --op-border-panel: #e4e6fc;

                /* Typography Colors */
                --op-text-primary: #212529;
                --op-text-secondary: #6C757D;
                --op-text-muted: #ADB5BD;
                --op-text-link: #0284C7;

                /* Status Semantics */
                --op-status-proceso-bg: #E0F2FE;
                --op-status-proceso-text: #0369A1;
                --op-status-proceso-dot: #0284C7;

                --op-status-revision-bg: #FEF3C7;
                --op-status-revision-text: #B45309;
                --op-status-revision-dot: #D97706;

                --op-status-finalizado-bg: #DCFCE7;
                --op-status-finalizado-text: #15803D;
                --op-status-finalizado-dot: #16A34A;

                /* Shadows & Radius */
                --op-shadow-0: none;
                --op-shadow-1: 0 1px 3px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.04);
                --op-shadow-2: 0 4px 12px rgba(0, 0, 0, 0.08);
                --op-shadow-3: 0 12px 32px rgba(0, 0, 0, 0.16);

                --op-radius-sm: 3px;
                --op-radius-md: 6px;
                --op-radius-lg: 8px;
                --op-radius-full: 9999px;
            }

            /* ═══════════════════════════════════════════════════════════════
               CAPA BASE DE COMPONENTES VISUALES ISOLADOS (DESIGN TOKENS)
               ═══════════════════════════════════════════════════════════════ */
            .op-container {
                width: 100%;
                margin-right: auto;
                margin-left: auto;
                padding-right: var(--op-space-16);
                padding-left: var(--op-space-16);
            }

            .op-surface {
                background-color: var(--op-surface-base);
                color: var(--op-text-primary);
            }

            .op-card {
                background-color: var(--op-surface-card);
                border: 1px solid var(--op-border-strong);
                border-radius: var(--op-radius-md);
                box-shadow: var(--op-shadow-1);
                padding: var(--op-space-16);
                transition: border-color 0.15s ease, box-shadow 0.15s ease;
            }

            .op-card-hover:hover {
                border-color: var(--op-border-active);
                box-shadow: var(--op-shadow-2);
            }

            .op-title {
                font-size: 16px;
                font-weight: 600;
                color: var(--op-text-primary);
                margin: 0 0 var(--op-space-8) 0;
            }

            .op-text-primary {
                color: var(--op-text-primary);
            }

            .op-text-secondary {
                color: var(--op-text-secondary);
            }

            .op-text-muted {
                color: var(--op-text-muted);
            }

            .op-divider {
                height: 1px;
                background-color: var(--op-border-subtle);
                margin: var(--op-space-16) 0;
                border: none;
            }

            .op-flex {
                display: flex;
                align-items: center;
            }

            .op-stack {
                display: flex;
                flex-direction: column;
                gap: var(--op-space-8);
            }

            /* ═══════════════════════════════════════════════════════════════
               SPRINT 3: COMPACTACIÓN VISUAL (DENSIDAD DE LECTURA DHF)
               ═══════════════════════════════════════════════════════════════ */
            .main-content table.table-bordered {
                margin: var(--op-space-8) auto !important;
                border-collapse: separate !important;
                border-spacing: 0 !important;
                border-radius: var(--op-radius-md) !important;
                overflow: hidden !important;
                box-shadow: var(--op-shadow-1) !important;
            }

            .main-content table.table-bordered th,
            .main-content table.table-bordered td {
                padding: var(--op-space-8) var(--op-space-12) !important;
                font-size: 13px !important;
                line-height: 1.45 !important;
                vertical-align: middle !important;
            }

            .main-content table.table-bordered th {
                font-weight: 600 !important;
                letter-spacing: 0.01em !important;
            }

            /* ═══════════════════════════════════════════════════════════════
               SPRINT 5: ELIMINADO — el colapso automático se suprimió.
               Las actividades terminadas se muestran completas igual que
               las activas. No se ocultan filas con CSS.
               ═══════════════════════════════════════════════════════════════ */
            /* Indicador visual sutil para actividades terminadas (solo borde) */
            .main-content table.table-bordered.op-activity-done {
                border-left: 3px solid var(--op-status-finalizado-dot) !important;
            }

            /* ═══════════════════════════════════════════════════════════════
               SPRINT 6: STICKY HEADER DE PROYECTO ISO (CABECERA DHF)
               La cabecera con el CONSECUTIVO se fija al hacer scroll dentro
               del .card de actividades. La navbar Stisla es position:absolute
               (scrollea con la pagina), por eso el header se ancla con un
               offset pequeno. z-index por debajo de la navbar (890) y de
               dropdowns/modales (1000+) para no taparlos.
               ═══════════════════════════════════════════════════════════════ */
            .card-header.op-sticky-header {
                position: -webkit-sticky !important;
                position: sticky !important;
                top: var(--op-space-8) !important;
                z-index: 800 !important;
                background: var(--op-surface-card) !important;
                box-shadow: var(--op-shadow-2) !important;
                border-radius: var(--op-radius-md) !important;
                transition: box-shadow 0.2s ease !important;
            }

            /* ═══════════════════════════════════════════════════════════════
               ISOLACIÓN DE MODALES Y VENTANAS FLOTANTES (VENTANA1..VENTANA8)
               Evita que la cabecera sticky o los paneles laterales se superpongan
               o floten encima del formulario/modal de registro de actividad.
               ═══════════════════════════════════════════════════════════════ */
            [id^="Ventana"],
            .sweet-local,
            .sweet-alert,
            .swal-overlay,
            .modal-backdrop,
            .modal {
                z-index: 100000 !important;
            }

            /* Estilizado de la ventana emergente de Historial de Cambios, OnlyOffice y Registro de Avances */
            .sweet-local[id^="Ventana"] .cont_reg,
            .sweet-local[id^="Ventana"] .cont_role,
            .modal-dialog {
                position: fixed !important;
                top: 50% !important;
                left: 50% !important;
                transform: translate(-50%, -50%) !important;
                width: 95vw !important;
                max-width: 1400px !important;
                max-height: 92vh !important;
                overflow-y: auto !important;
                background: #ffffff !important;
                border-radius: 12px !important;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.45) !important;
                border: 1px solid var(--op-border-strong) !important;
                padding: 20px !important;
                margin: 0 !important;
                /* Reset dynamic NetBeans styles */
            }

            .sweet-local[id^="Ventana"] {
                position: fixed !important;
                top: 0 !important;
                left: 0 !important;
                right: 0 !important;
                bottom: 0 !important;
                width: 100vw !important;
                height: 100vh !important;
                background-color: rgba(0, 0, 0, 0.55) !important;
                z-index: 100000 !important;
                transform: none !important;
                border: none !important;
                box-shadow: none !important;
                padding: 0 !important;
            }

            /* Editor OnlyOffice en pantalla completa amplia (1400px x 600px) sin barras de corte */
            iframe[id*="OnlyOffice"],
            iframe[id*="onlyoffice"],
            iframe[src*="OfficePlatform"],
            iframe[src*="onlyoffice"],
            #iframeOnlyOffice,
            .oo-editor-container,
            .modal-body iframe {
                width: 100% !important;
                min-width: 100% !important;
                height: 78vh !important;
                min-height: 600px !important;
                border: none !important;
                border-radius: 8px !important;
                display: block !important;
            }

            /* Tabla de Historial de Cambios limpia y legible */
            [id^="Ventana"] table,
            .sweet-local table {
                width: 100% !important;
                border-collapse: collapse !important;
                margin-top: 12px !important;
            }

            [id^="Ventana"] th,
            .sweet-local th {
                background: #1e293b !important;
                color: #ffffff !important;
                padding: 10px 14px !important;
                font-size: 12px !important;
                font-weight: 700 !important;
                text-align: left !important;
            }

            [id^="Ventana"] td,
            .sweet-local td {
                padding: 10px 14px !important;
                font-size: 12px !important;
                border-bottom: 1px solid #e2e8f0 !important;
                color: #334155 !important;
            }

            [id^="Ventana"] tr:nth-child(even),
            .sweet-local tr:nth-child(even) {
                background: #f8fafc !important;
            }

            /* Desactivar posicionamiento sticky cuando hay un modal abierto */
            body.modal-open .card-header.op-sticky-header,
            body.op-modal-open .card-header.op-sticky-header,
            body.modal-open .op-master-panel,
            body.op-modal-open .op-master-panel,
            body.modal-open .op-detail-panel,
            body.op-modal-open .op-detail-panel,
            body.modal-open .op-col-nav,
            body.op-modal-open .op-col-nav,
            body.modal-open .op-col-inspector,
            body.op-modal-open .op-col-inspector {
                position: static !important;
                z-index: 1 !important;
                box-shadow: none !important;
            }

            /* ═══════════════════════════════════════════════════════════════
               CORRECCIÓN DEFINITIVA DE NAVBAR OVERLAY & LAYOUT INTEGRIDAD
               ═══════════════════════════════════════════════════════════════ */
            .navbar-bg {
                height: 70px !important;
                z-index: 500 !important;
            }

            nav.navbar,
            .main-header nav.navbar {
                position: absolute !important;
                top: 0 !important;
                left: 250px !important;
                right: 0 !important;
                height: 70px !important;
                z-index: 505 !important;
            }

            .main-sidebar {
                z-index: 890 !important;
            }

            /* Container 3-Column Grid Layout */
            .main-content {
                padding-top: 85px !important;
                padding-left: 265px !important;
                padding-right: 20px !important;
                position: relative !important;
                z-index: 10 !important;
                transition: all 0.3s ease;
            }

            /* Layout de 3 columnas para Memorias.jsp */
            .op-workspace-3col {
                display: flex !important;
                gap: var(--space-16) !important;
                align-items: flex-start !important;
                position: relative !important;
                width: 100% !important;
            }

            .op-col-nav {
                width: var(--col1-width) !important;
                flex-shrink: 0 !important;
                position: sticky !important;
                top: 80px !important;
                max-height: calc(100vh - 100px) !important;
                overflow-y: auto !important;
                background: var(--op-surface-card) !important;
                border-radius: 8px !important;
                border: 1px solid var(--op-border-panel) !important;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.04) !important;
                padding: var(--space-12) !important;
            }

            .op-col-main {
                flex-grow: 1 !important;
                min-width: 500px !important;
            }

            .op-col-inspector {
                width: var(--col3-width) !important;
                flex-shrink: 0 !important;
                position: sticky !important;
                top: 80px !important;
                max-height: calc(100vh - 100px) !important;
                overflow-y: auto !important;
                background: var(--op-surface-card) !important;
                border-radius: 8px !important;
                border: 1px solid var(--op-border-panel) !important;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08) !important;
                padding: var(--space-16) !important;
                display: none;
                /* Se activa dinámicamente */
            }

            .op-col-inspector.active {
                display: block !important;
                animation: slideInRight 0.2s cubic-bezier(0.4, 0, 0.2, 1) !important;
            }

            @keyframes slideInRight {
                from {
                    transform: translateX(20px);
                    opacity: 0;
                }

                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }

            /* Tarjetas de actividades mejoradas */
            .op-col-main table.table-bordered {
                border-radius: 8px !important;
                overflow: hidden !important;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04) !important;
                border: 1px solid var(--op-border-panel) !important;
                transition: transform 0.15s ease, box-shadow 0.15s ease !important;
                margin-bottom: var(--space-20) !important;
                background: var(--op-surface-card) !important;
            }

            .op-col-main table.table-bordered:hover {
                box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08) !important;
            }

            /* Badges de estado mejorados */
            .badge-status-proceso {
                background-color: #3abaf4 !important;
                color: #fff !important;
                font-weight: 600;
                padding: 4px 10px;
                border-radius: 12px;
            }

            .badge-status-revision {
                background-color: #ffa426 !important;
                color: #fff !important;
                font-weight: 600;
                padding: 4px 10px;
                border-radius: 12px;
            }

            .badge-status-finalizado {
                background-color: #47c363 !important;
                color: #fff !important;
                font-weight: 600;
                padding: 4px 10px;
                border-radius: 12px;
            }

            /* Asegurar que la ventana emergente de OnlyOffice quede en pantalla completa por encima de todo */
            body.op-editor-open .modal {
                z-index: 1040 !important;
            }

            body.op-editor-open .modal-backdrop {
                z-index: 1030 !important;
            }

            .op-editor-overlay {
                z-index: 2147483647 !important;
                position: fixed !important;
                inset: 0 !important;
                top: 0 !important;
                left: 0 !important;
                right: 0 !important;
                bottom: 0 !important;
                width: 100vw !important;
                height: 100vh !important;
                background: rgba(0, 0, 0, 0.85) !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                padding: 2vh 2vw !important;
                box-sizing: border-box !important;
            }

            .op-editor-modal {
                z-index: 2147483647 !important;
                position: relative !important;
                width: 95vw !important;
                height: 92vh !important;
                max-width: none !important;
                max-height: none !important;
                margin: auto !important;
                background: #1a1d27 !important;
                border-radius: 12px !important;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8) !important;
                display: flex !important;
                flex-direction: column !important;
                overflow: hidden !important;
            }

            .op-editor-header {
                display: flex !important;
                align-items: center !important;
                justify-content: space-between !important;
                gap: 12px !important;
                padding: 8px 16px !important;
                background: #1e222d !important;
                color: #ffffff !important;
                border-bottom: 1px solid #2d3243 !important;
                height: 48px !important;
                box-sizing: border-box !important;
                flex-shrink: 0 !important;
            }

            .op-editor-title {
                font-size: 14px !important;
                font-weight: 600 !important;
                color: #ffffff !important;
                max-width: 350px !important;
                overflow: hidden !important;
                text-overflow: ellipsis !important;
                white-space: nowrap !important;
            }

            .op-editor-status,
            .op-editor-collab {
                font-size: 11px !important;
                padding: 3px 10px !important;
                border-radius: 12px !important;
                white-space: nowrap !important;
            }

            /* Ocultar botones sobrantes e iconos desproporcionados */
            .op-editor-filemanager-btn,
            .op-fm-drawer {
                display: none !important;
            }

            .op-editor-header svg,
            .op-editor-close svg {
                width: 18px !important;
                height: 18px !important;
                max-width: 18px !important;
                max-height: 18px !important;
            }

            .op-editor-close {
                background: transparent !important;
                border: none !important;
                color: #aaa !important;
                cursor: pointer !important;
                font-size: 18px !important;
                padding: 4px 8px !important;
            }

            .op-editor-close:hover {
                color: #fff !important;
            }

            .op-editor-body {
                flex: 1 !important;
                position: relative !important;
                width: 100% !important;
                height: calc(100% - 48px) !important;
                background: #ffffff !important;
                overflow: hidden !important;
            }

            #op-editor-container,
            #op-editor-container iframe {
                width: 100% !important;
                height: 100% !important;
                border: none !important;
            }

            .op-modal-backdrop,
            .op-context-menu,
            .op-toast-stack {
                z-index: 2147483647 !important;
            }

            /* ═══════════════════════════════════════════════════════════════
               SPRINT 8: SPLIT-SCREEN WORKSPACE (MASTER-DETAIL)
               Layout de dos paneles para lectura rápida de memorias.
               Master (izquierda): lista compacta de actividades.
               Detail (derecha): contenido completo de la actividad seleccionada.
               Solo se activa en Memorias.jsp (detectado por #Formulario).
               ═══════════════════════════════════════════════════════════════ */
            .op-split-workspace {
                display: none !important;
                gap: var(--op-space-16) !important;
                align-items: flex-start !important;
                width: 100% !important;
                min-height: 60vh !important;
            }

            /* Master List Panel */
            .op-master-panel {
                width: 340px !important;
                min-width: 280px !important;
                max-width: 400px !important;
                flex-shrink: 0 !important;
                position: sticky !important;
                top: 85px !important;
                max-height: calc(100vh - 100px) !important;
                overflow-y: auto !important;
                overflow-x: hidden !important;
                background: var(--op-surface-card) !important;
                border-radius: var(--op-radius-lg) !important;
                border: 1px solid var(--op-border-panel) !important;
                box-shadow: var(--op-shadow-1) !important;
                padding: var(--op-space-12) !important;
                scrollbar-width: thin !important;
                scrollbar-color: var(--op-border-subtle) transparent !important;
            }

            /* ═══ P3 (layout profesional por modo): NO estirar el contenido al monitor.
               Previsualizador = hoja ejecutiva centrada (1100px). Modo Gestion = paneles
               equilibrados (master 340px fijo + detail con ancho de lectura acotado). ═══ */

            /* IMPORTANTE: NO se toca .main-content. Su offset natural (~250px) despeja el
               sidebar azul fijo de Stisla. Overridearlo metia el toolbar debajo del menu.
               Solo liberamos la columna wrapper interna (col Bootstrap sin clase) que
               constrenia el contenido a ~1096px, dentro del area ya despejada del sidebar. */
            body.op-split-mode #Formulario,
            body.op-fullview-mode #Formulario {
                width: 100% !important;
                box-sizing: border-box !important;
                overflow-x: hidden !important;
            }
            body.op-split-mode #Formulario > .row,
            body.op-fullview-mode #Formulario > .row {
                width: 100% !important;
                max-width: 100% !important;
            }
            body.op-split-mode #Formulario > .row > div,
            body.op-fullview-mode #Formulario > .row > div {
                max-width: 100% !important;
                flex: 0 0 100% !important;
            }
            body.op-split-mode .card,
            body.op-fullview-mode .card,
            body.op-split-mode .card-body,
            body.op-fullview-mode .card-body {
                width: 100% !important;
                max-width: 100% !important;
                box-sizing: border-box !important;
            }
            /* Toolbar de vistas: siempre completo a la derecha del sidebar, sin desbordar */
            #op-view-toolbar {
                width: 100% !important;
                box-sizing: border-box !important;
                display: flex !important;
                align-items: center !important;
                justify-content: space-between !important;
                position: relative !important;
                z-index: 10 !important;
            }

            /* --- MODO GESTION (split): workspace equilibrado --- */
            body.op-split-mode .op-split-workspace {
                display: flex !important;
                gap: 16px !important;
                height: calc(100vh - 160px) !important;
                min-height: 650px !important;
                padding: 0 4px 16px !important;
                width: 100% !important;
                box-sizing: border-box !important;
                align-items: stretch !important;
            }
            body.op-split-mode .op-master-panel {
                flex: 0 0 340px !important;
                width: 340px !important;
                min-width: 300px !important;
                max-width: 360px !important;
                position: static !important;
                max-height: none !important;
                background: #ffffff !important;
                border: 1px solid #e2e8f0 !important;
                border-radius: 8px !important;
                overflow-y: auto !important;
                padding: 16px 12px !important;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04) !important;
            }
            body.op-split-mode .op-detail-panel {
                flex: 1 !important;
                min-width: 0 !important;
                position: static !important;
                max-height: none !important;
                overflow-y: auto !important;
                background: #f8fafc !important;
                border: 1px solid #e2e8f0 !important;
                border-radius: 8px !important;
                padding: 24px 32px !important;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04) !important;
            }
            /* Contenido interior del detail: ancho de lectura/edicion comodo, no un lienzo infinito */
            body.op-split-mode .op-detail-panel > * {
                max-width: 1150px !important;
                margin-left: auto !important;
                margin-right: auto !important;
            }

            /* --- PREVISUALIZADOR (fullview): hoja ejecutiva centrada, NO estirada --- */
            body.op-fullview-mode .card-body {
                background: #f1f5f9 !important;   /* escritorio gris detras de la hoja */
                padding: 8px 8px 32px !important;
            }
            /* P6: ocultar el header legacy (.card-header sticky) para no duplicar la cabecera */
            body.op-fullview-mode .card-header {
                display: none !important;
            }
            body.op-fullview-mode .op-continuous-preview-container {
                max-width: 1100px !important;
                width: 100% !important;
                box-sizing: border-box !important;
                margin: 20px auto !important;
                background: #ffffff !important;
                padding: 40px 48px !important;
                border-radius: 8px !important;
                box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08) !important;
                border: 1px solid #e2e8f0 !important;
            }

            .op-master-panel::-webkit-scrollbar {
                width: 5px;
            }

            .op-master-panel::-webkit-scrollbar-thumb {
                background: var(--op-border-subtle);
                border-radius: 4px;
            }

            .op-master-header {
                display: flex !important;
                align-items: center !important;
                justify-content: space-between !important;
                padding: var(--op-space-8) var(--op-space-4) !important;
                margin-bottom: var(--op-space-8) !important;
                border-bottom: 1px solid var(--op-border-subtle) !important;
            }

            .op-master-header h6 {
                margin: 0 !important;
                font-size: 13px !important;
                font-weight: 700 !important;
                color: var(--op-text-primary) !important;
                letter-spacing: 0.02em !important;
            }

            .op-master-count {
                font-size: 11px !important;
                font-weight: 600 !important;
                color: var(--op-text-muted) !important;
                background: var(--op-surface-muted) !important;
                padding: 2px 8px !important;
                border-radius: var(--op-radius-full) !important;
            }

            /* Activity Card in Master List */
            .op-activity-card {
                display: flex !important;
                flex-direction: column !important;
                padding: var(--op-space-8) var(--op-space-12) !important;
                margin-bottom: var(--op-space-4) !important;
                border-radius: var(--op-radius-md) !important;
                border: 1px solid transparent !important;
                cursor: pointer !important;
                transition: all 0.15s ease !important;
                position: relative !important;
                background: transparent !important;
            }

            .op-activity-card:hover {
                background: var(--op-surface-muted) !important;
                border-color: var(--op-border-subtle) !important;
            }

            .op-activity-card.op-active {
                background: var(--op-status-proceso-bg) !important;
                border-color: var(--op-border-active) !important;
                border-left: 3px solid var(--op-border-active) !important;
            }

            .op-activity-card-title {
                font-size: 12px !important;
                font-weight: 600 !important;
                color: var(--op-text-primary) !important;
                line-height: 1.35 !important;
                margin-bottom: 2px !important;
                display: -webkit-box !important;
                -webkit-line-clamp: 2 !important;
                -webkit-box-orient: vertical !important;
                overflow: hidden !important;
            }

            .op-activity-card-meta {
                display: flex !important;
                align-items: center !important;
                gap: var(--op-space-8) !important;
                font-size: 11px !important;
                color: var(--op-text-secondary) !important;
                margin-top: 2px !important;
            }

            .op-activity-card-meta .op-dot {
                width: 6px !important;
                height: 6px !important;
                border-radius: 50% !important;
                flex-shrink: 0 !important;
            }

            .op-dot-proceso {
                background: var(--op-status-proceso-dot) !important;
            }

            .op-dot-revision {
                background: var(--op-status-revision-dot) !important;
            }

            .op-dot-finalizado {
                background: var(--op-status-finalizado-dot) !important;
            }

            .op-activity-card-phase {
                font-size: 10px !important;
                color: var(--op-text-muted) !important;
                text-transform: uppercase !important;
                letter-spacing: 0.03em !important;
                margin-top: 1px !important;
                white-space: nowrap !important;
                overflow: hidden !important;
                text-overflow: ellipsis !important;
            }

            /* Detail Panel */
            .op-detail-panel {
                flex: 1 !important;
                min-width: 0 !important;
                position: sticky !important;
                top: 85px !important;
                max-height: calc(100vh - 100px) !important;
                overflow-y: auto !important;
                overflow-x: auto !important;
                background: var(--op-surface-card) !important;
                border-radius: var(--op-radius-lg) !important;
                border: 1px solid var(--op-border-panel) !important;
                box-shadow: var(--op-shadow-2) !important;
                padding: var(--op-space-16) var(--op-space-20) !important;
                scrollbar-width: thin !important;
                scrollbar-color: var(--op-border-subtle) transparent !important;
            }

            /* Prevenir corte de botones de accion y desplegables */
            .op-detail-panel table.table-bordered,
            .op-full-doc-container table.table-bordered {
                width: 100% !important;
                max-width: 100% !important;
                table-layout: auto !important;
            }

            .op-detail-panel .dropdown-menu,
            .op-full-doc-container .dropdown-menu,
            table.table-bordered .dropdown-menu {
                right: 0 !important;
                left: auto !important;
                z-index: 1050 !important;
                box-shadow: var(--op-shadow-3) !important;
            }

            /* Vista Documento Completo DHF */
            .op-full-doc-container {
                width: 100% !important;
                background: #ffffff !important;
                border-radius: var(--op-radius-lg) !important;
                border: 1px solid var(--op-border-panel) !important;
                padding: 24px !important;
                box-shadow: var(--op-shadow-1) !important;
                margin-top: 16px !important;
            }

            .op-full-doc-container table.table-bordered {
                margin-bottom: 24px !important;
                display: table !important;
                border-collapse: collapse !important;
            }

            .op-detail-panel::-webkit-scrollbar {
                width: 5px;
            }

            .op-detail-panel::-webkit-scrollbar-thumb {
                background: var(--op-border-subtle);
                border-radius: 4px;
            }

            .op-detail-header {
                display: flex !important;
                align-items: center !important;
                justify-content: space-between !important;
                padding-bottom: var(--op-space-8) !important;
                margin-bottom: var(--op-space-12) !important;
                border-bottom: 2px solid var(--op-border-active) !important;
            }

            .op-detail-header h6 {
                margin: 0 !important;
                font-size: 14px !important;
                font-weight: 700 !important;
                color: var(--op-text-primary) !important;
            }

            .op-detail-empty {
                display: flex !important;
                flex-direction: column !important;
                align-items: center !important;
                justify-content: center !important;
                min-height: 300px !important;
                color: var(--op-text-muted) !important;
                text-align: center !important;
            }

            .op-detail-empty i {
                font-size: 48px !important;
                margin-bottom: var(--op-space-12) !important;
                opacity: 0.4 !important;
            }

            .op-detail-empty p {
                font-size: 14px !important;
                margin: 0 !important;
            }

            /* Detail content — the original table is moved here */
            .op-detail-content table.table-bordered {
                margin: 0 auto !important;
                width: 100% !important;
                animation: opFadeIn 0.2s ease !important;
            }

            @keyframes opFadeIn {
                from {
                    opacity: 0;
                    transform: translateY(6px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Toggle button for split-screen mode */
            .op-split-toggle {
                display: inline-flex !important;
                align-items: center !important;
                gap: 4px !important;
                padding: 4px 10px !important;
                font-size: 11px !important;
                font-weight: 600 !important;
                color: var(--op-text-secondary) !important;
                background: var(--op-surface-muted) !important;
                border: 1px solid var(--op-border-subtle) !important;
                border-radius: var(--op-radius-sm) !important;
                cursor: pointer !important;
                transition: all 0.15s ease !important;
                margin-left: var(--op-space-8) !important;
            }

            .op-split-toggle:hover {
                background: var(--op-surface-muted-hover) !important;
                color: var(--op-border-active) !important;
            }

            .op-split-toggle.op-active {
                background: var(--op-status-proceso-bg) !important;
                border-color: var(--op-border-active) !important;
                color: var(--op-status-proceso-text) !important;
            }

            /* Hide all other elements of card-body / Formulario in split mode to avoid visual mix-up, keeping modals visible */
            body.op-split-mode .card-body>*:not(#op-view-toolbar):not(#op-split-workspace):not([id^="Ventana"]):not(.sweet-local),
            body.op-split-mode #Formulario>*:not(#op-view-toolbar):not(#op-split-workspace):not([id^="Ventana"]):not(.sweet-local) {
                display: none !important;
            }

            /* When split mode is active, display the split workspace */
            body.op-split-mode .op-split-workspace {
                display: flex !important;
            }

            /* MUTUALIDAD ESTRICTA: el índice/workspace de Vista Dividida SOLO es visible
               con la clase op-split-mode en el body. En Documento Continuo (o cualquier
               estado sin op-split-mode) queda oculto por completo. El selector con id da
               mayor especificidad que la regla base .op-split-workspace. */
            body:not(.op-split-mode) #op-split-workspace {
                display: none !important;
            }

            /* En Vista Dividida, ocultar TODO el contenedor de secciones/tabs legacy
               (#myTab2Content) para que no se filtre detrás del índice. La actividad
               seleccionada se mueve al panel de detalle, no se pierde. */
            body.op-split-mode #myTab2Content {
                display: none !important;
            }

            /* ═══════════════════════════════════════════════════════════════
               EJE G: VISTA DE GESTIÓN — toolbar segmentado + índice con estado
               ═══════════════════════════════════════════════════════════════ */
            .op-seg-control {
                display: inline-flex;
                border: 1px solid var(--op-border-strong);
                border-radius: var(--op-radius-md);
                overflow: hidden;
                background: var(--op-surface-base);
            }

            .op-seg-btn {
                border: none;
                background: transparent;
                padding: 6px 14px;
                font-size: 13px;
                font-weight: 600;
                color: var(--op-text-secondary);
                cursor: pointer;
                transition: background 0.15s ease, color 0.15s ease;
            }

            .op-seg-btn+.op-seg-btn {
                border-left: 1px solid var(--op-border-strong);
            }

            .op-seg-btn.op-active {
                background: var(--op-surface-card);
                color: var(--op-text-primary);
                box-shadow: inset 0 -2px 0 var(--op-border-active);
            }

            .op-toolbar-actions {
                display: inline-flex;
                align-items: center;
                gap: 10px;
            }

            .op-action-primary {
                border: none;
                background: var(--op-status-finalizado-dot);
                color: #fff;
                padding: 7px 16px;
                border-radius: var(--op-radius-md);
                font-size: 13px;
                font-weight: 600;
                cursor: pointer;
            }

            .op-action-primary:hover {
                filter: brightness(0.95);
            }

            .op-action-tertiary {
                border: none;
                background: transparent;
                color: var(--op-text-secondary);
                padding: 7px 10px;
                font-size: 13px;
                font-weight: 600;
                cursor: pointer;
            }

            .op-action-tertiary:hover {
                color: var(--op-text-primary);
            }

            .op-activity-card {
                display: flex !important;
                align-items: flex-start;
            }

            .op-status-dot {
                display: inline-block;
                width: 5px;
                height: 5px;
                border-radius: 50%;
                margin: 5px 8px 0 0;
                flex-shrink: 0;
            }

            .op-activity-card-title {
                display: -webkit-box;
                -webkit-line-clamp: 2;
                line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                line-height: 1.3;
            }

            .op-progress-wrap {
                height: 6px;
                background: var(--op-border-subtle);
                border-radius: var(--op-radius-full);
                overflow: hidden;
                margin-top: 8px;
            }

            .op-progress-bar {
                height: 100%;
                background: var(--op-status-finalizado-dot);
                border-radius: var(--op-radius-full);
                transition: width 0.3s ease;
            }

            .op-progress-label {
                font-size: 11px;
                color: var(--op-text-muted);
                margin-top: 4px;
            }

            /* G-c: tarjeta de actividad en el panel de detalle (tabla emitida por Tag → SOLO CSS) */
            .op-detail-content-wrapper table.table-bordered:not(.op-adapted-card) {
                border: none !important;
                box-shadow: none !important;
                background: transparent !important;
            }

            .op-detail-content-wrapper table.table-bordered:not(.op-adapted-card) td,
            .op-detail-content-wrapper table.table-bordered:not(.op-adapted-card) th {
                border: none !important;
                border-bottom: 1px solid var(--op-border-subtle) !important;
                padding: 12px 14px !important;
                font-size: 13px !important;
                line-height: 1.65 !important;
                vertical-align: top !important;
                background: transparent !important;
            }

            .op-detail-content-wrapper table.table-bordered b {
                color: var(--op-text-secondary);
                font-weight: 600;
                font-size: 11px;
                letter-spacing: 0.3px;
            }

            .op-icon-label {
                font-size: 12px;
                font-weight: 600;
                margin-left: 5px;
                vertical-align: middle;
                color: var(--op-text-secondary);
            }

            /* ═══════════════════════════════════════════════════════════════
               EJE H: DOCUMENTO CONTINUO — reporte legible + impresión
               ═══════════════════════════════════════════════════════════════ */
            /* H: cero controles interactivos en la vista de lectura (pantalla).
               Se ocultan links de accion (TempM=historial/adjuntos/numeral, opc=22
               compartir, opc=13 estado), submits y toggles. Se conserva el texto y
               las referencias a documentos (evidencia). */
            body.op-fullview-mode #myTab2Content .card-header-action,
            body.op-fullview-mode #myTab2Content a[href*="TempM="],
            body.op-fullview-mode #myTab2Content a[href*="opc=22"],
            body.op-fullview-mode #myTab2Content a[href*="opc=13"],
            body.op-fullview-mode #myTab2Content input[type="submit"],
            body.op-fullview-mode #myTab2Content .op-collapse-toggle-btn {
                display: none !important;
            }

            /* H-c: ritmo de lectura */
            body.op-fullview-mode #myTab2Content td,
            body.op-fullview-mode #myTab2Content th {
                line-height: 1.75 !important;
            }

            /* Ocultar botones flotantes legados de registrar actividad y filtros */
            .floating-button,
            .objeto,
            #Formulario > .objeto,
            #Formulario > .floating-button,
            button[title="Registrar actividad"],
            div.floating-button,
            a[onclick*="mostrarConvencion"] {
                display: none !important;
            }

            /* Documento Continuo - Modo Previsualizador Ejecutivo Limpio */
            body.op-fullview-mode #Formulario table button,
            body.op-fullview-mode #Formulario table input[type="button"],
            body.op-fullview-mode #Formulario table input[type="submit"],
            body.op-fullview-mode #Formulario table .btn-danger,
            body.op-fullview-mode #Formulario table .fa-trash,
            body.op-fullview-mode #Formulario table .fa-trash-alt,
            body.op-fullview-mode #Formulario table a[href*="eliminar"],
            body.op-fullview-mode #Formulario table a[href*="opc=2"],
            body.op-fullview-mode #Formulario table a[href*="ver_adj"],
            body.op-fullview-mode #Formulario table a[onclick*="eliminar"],
            body.op-fullview-mode #Formulario table a[onclick*="Eliminar"],
            body.op-fullview-mode #Formulario table a:has(.fa-trash),
            body.op-fullview-mode #Formulario table a:has(.fa-trash-alt),
            body.op-fullview-mode #Formulario table .op-card-actions,
            body.op-fullview-mode #Formulario table .btn-group,
            body.op-fullview-mode .floating-button,
            body.op-fullview-mode .objeto {
                display: none !important;
            }

            body.op-fullview-mode #Formulario {
                background: #f8fafc !important;
                padding: 15px 25px !important;
                border-radius: 12px !important;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04) !important;
            }

            body.op-fullview-mode .op-action-primary,
            body.op-fullview-mode .op-action-tertiary {
                display: none !important;
            }

            /* H-b: lista de adjuntos inyectada por AJAX en el documento continuo */
            .op-attach-list {
                margin: 6px 0 18px 0;
                padding: 10px 14px;
                border-left: 3px solid var(--op-border-active);
                background: var(--op-surface-base);
                border-radius: 0 var(--op-radius-sm) var(--op-radius-sm) 0;
            }

            .op-attach-title {
                font-size: 11px;
                font-weight: 700;
                letter-spacing: 0.4px;
                color: var(--op-text-muted);
                margin-bottom: 6px;
            }

            .op-attach-ol {
                margin: 0;
                padding-left: 20px;
                font-size: 13px;
                line-height: 1.9;
            }

            .op-attach-loading {
                font-size: 12px;
                color: var(--op-text-muted);
            }

            /* H-d: impresión — lo que se ve es lo que sale */
            @media print {
                @page {
                    size: letter portrait;
                    margin: 12mm 15mm 15mm 15mm;
                }

                body {
                    background: #ffffff !important;
                }

                .navbar,
                .navbar-bg,
                .main-sidebar,
                #sidebar-wrapper,
                #op-view-toolbar,
                #myTab,
                #op-split-workspace,
                #myTab2Content .card-header-action,
                #myTab2Content a[href*="TempM="],
                #myTab2Content a[href*="opc=22"],
                #myTab2Content a[href*="opc=13"],
                #myTab2Content input[type="submit"],
                .op-collapse-toggle-btn,
                .op-editor-overlay,
                .iziToast,
                .sweet-overlay {
                    display: none !important;
                }

                /* siempre imprimir el documento continuo, sin importar el modo en pantalla */
                #myTab2Content {
                    display: block !important;
                }

                .main-content {
                    padding: 0 !important;
                }

                .card,
                .card-body {
                    box-shadow: none !important;
                    border: none !important;
                    margin: 0 !important;
                }

                /* expandir actividades colapsadas por smart collapse: el auditor necesita el registro completo */
                .main-content table.table-bordered.op-activity-collapsed tbody tr {
                    display: table-row !important;
                }

                /* que una actividad no se parta entre paginas */
                #myTab2Content table.table-bordered {
                    page-break-inside: avoid !important;
                    box-shadow: none !important;
                }

                thead {
                    display: table-header-group !important;
                }

                /* conservar color de estados en papel (con print-color-adjust) */
                * {
                    -webkit-print-color-adjust: exact !important;
                    print-color-adjust: exact !important;
                }

                /* ── Punto 4: Previsualizador Ejecutivo como documento corporativo Carta ── */
                html, body {
                    height: auto !important;
                    overflow: visible !important;
                    background: #ffffff !important;
                }
                /* hoja a ancho completo, sin escritorio/sombra/borde en papel */
                body.op-fullview-mode .card-body {
                    background: #ffffff !important;
                    padding: 0 !important;
                }
                #op-continuous-preview-container,
                .op-continuous-preview-container {
                    width: 100% !important;
                    max-width: 100% !important;
                    margin: 0 !important;
                    padding: 0 !important;
                    box-shadow: none !important;
                    border: none !important;
                }
                /* no partir etapas / tarjetas / tablas entre páginas (evita cortes y huérfanas) */
                .op-preview-stage-block,
                .op-preview-activity-card,
                .op-preview-distribution,
                .table-bordered {
                    page-break-inside: avoid !important;
                    break-inside: avoid !important;
                }
                /* cabecera de actividad: flex sin position:absolute/float -> evita solapamiento de textos */
                .op-preview-activity-card > div:first-child {
                    display: flex !important;
                    justify-content: space-between !important;
                    align-items: center !important;
                    position: static !important;
                    float: none !important;
                }
                /* controles que no deben imprimirse */
                .no-print, .btn, .nav, .op-seg-control, .op-seg-static,
                #op-submit-toast, #op-ac-overlay, #op-batch-modal, #op-fm-modal {
                    display: none !important;
                }
            }

            /* Keyboard navigation hint */
            .op-kbd-hint {
                font-size: 10px !important;
                color: var(--op-text-muted) !important;
                padding: var(--op-space-8) var(--op-space-4) !important;
                text-align: center !important;
                border-top: 1px solid var(--op-border-subtle) !important;
                margin-top: var(--op-space-8) !important;
            }

            .op-kbd-hint kbd {
                display: inline-block !important;
                padding: 1px 5px !important;
                font-size: 10px !important;
                font-family: monospace !important;
                background: var(--op-surface-muted) !important;
                border: 1px solid var(--op-border-subtle) !important;
                border-radius: 3px !important;
                box-shadow: 0 1px 0 var(--op-border-subtle) !important;
            }

            /* Responsive — disable split on narrow viewports */
            /* ═══════════════════════════════════════════════════════════════
               SPRINT 9: CROSS-SECTION SPLIT VIEW, FULL DOCUMENT & BATCH WIZARD
               ═══════════════════════════════════════════════════════════════ */
            /* Full document 0-click continuous view mode */
            /* SPRINT 9 FIX #1: ocultar las pestañas ISO legacy (#myTab) en ambos
               modos expandidos. Si ninguna clase de modo está presente (p.ej. el
               JS no cargó), #myTab queda visible → degradación segura. */
            body.op-fullview-mode #myTab,
            body.op-split-mode #myTab {
                display: none !important;
            }

            .op-fullview-mode .tab-pane {
                display: block !important;
                opacity: 1 !important;
                margin-bottom: 24px !important;
            }

            .op-section-divider {
                background: linear-gradient(90deg, #f1f5f9, #ffffff);
                border-left: 4px solid var(--op-border-active);
                padding: 10px 16px;
                border-radius: var(--op-radius-md);
                margin: 24px 0 16px 0;
                font-weight: 700;
                color: #0369a1;
                font-size: 14px;
                display: flex;
                align-items: center;
                gap: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02);
            }

            /* Hierarchical Tree Navigation in Master Panel */
            .op-tree-section {
                margin-bottom: 8px;
                border: 1px solid var(--op-border-subtle);
                border-radius: var(--op-radius-md);
                overflow: hidden;
                background: #ffffff;
            }

            .op-tree-section-header {
                background: #f8fafc;
                padding: 8px 12px;
                font-size: 12px;
                font-weight: 700;
                color: #1e293b;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: space-between;
                user-select: none;
                transition: background 0.15s ease;
            }

            .op-tree-section-header:hover {
                background: #e2e8f0;
            }

            .op-tree-section-body {
                padding: 4px;
                display: block;
            }

            .op-tree-section.collapsed .op-tree-section-body {
                display: none;
            }

            .op-tree-section.collapsed .op-tree-icon {
                transform: rotate(-90deg);
            }

            .op-tree-icon {
                transition: transform 0.2s ease;
                font-size: 10px;
                color: #64748b;
            }

            /* Detail Breadcrumb & Navigation */
            .op-detail-breadcrumb {
                font-size: 12px;
                color: var(--op-text-secondary);
                background: #f8fafc;
                padding: 6px 12px;
                border-radius: var(--op-radius-sm);
                border: 1px solid var(--op-border-subtle);
                display: inline-flex;
                align-items: center;
                gap: 6px;
                margin-bottom: 12px;
            }

            .op-detail-nav-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 24px;
                padding-top: 16px;
                border-top: 1px solid var(--op-border-subtle);
            }

            /* Multi-Stage Batch Wizard */
            .op-wizard-stepper {
                display: flex;
                justify-content: space-around;
                align-items: center;
                margin-bottom: 20px;
                position: relative;
            }

            .op-wizard-stepper::before {
                content: '';
                position: absolute;
                top: 18px;
                left: 15%;
                right: 15%;
                height: 2px;
                background: #cbd5e1;
                z-index: 1;
            }

            .op-wizard-step-node {
                position: relative;
                z-index: 2;
                background: #ffffff;
                border: 2px solid #94a3b8;
                border-radius: 50%;
                width: 36px;
                height: 36px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 700;
                font-size: 13px;
                color: #475569;
                transition: all 0.2s ease;
            }

            .op-wizard-step-node.active {
                border-color: #0284c7;
                background: #e0f2fe;
                color: #0369a1;
                box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.2);
            }

            .op-wizard-step-node.completed {
                border-color: #16a34a;
                background: #dcfce7;
                color: #15803d;
            }

            /* Paso 2 Cargue Masivo: lista compacta (sin "tarjeta dentro de tarjeta") */
            .op-wiz-clause2 { border: 1px solid #e2e8f0; border-radius: 8px; margin-bottom: 10px; overflow: hidden; background: #ffffff; }
            .op-wiz-clause2-head { display: flex; align-items: center; gap: 8px; padding: 7px 12px; background: #eef2f7; border-bottom: 1px solid #e2e8f0; }
            .op-wiz-clause2-head .num { font-family: 'JetBrains Mono', ui-monospace, monospace; font-size: 12px; color: #0f6fb5; font-weight: 700; }
            .op-wiz-clause2-head .t { font-size: 12.5px; font-weight: 700; color: #1e293b; }
            .op-wiz-clause2-head .cnt { margin-left: auto; font-size: 10px; font-weight: 700; background: #dbe4ee; color: #385166; padding: 1px 8px; border-radius: 10px; }
            .op-wiz-sub-row { display: flex; flex-direction: column; gap: 5px; padding: 6px 12px; border-bottom: 1px solid #f1f5f9; background: transparent; transition: background-color 0.12s ease; }
            .op-wiz-sub-row:last-child { border-bottom: none; }
            .op-wiz-sub-row:hover { background-color: #f8fafc; }
            .op-wiz-sub-row .op-wiz-sub-top { display: flex; align-items: center; gap: 8px; }
            .op-wiz-sub-row .op-wiz-sub-top label { font-size: 12px; font-weight: 700; color: #1e293b; cursor: pointer; margin: 0; line-height: 1.3; }
            .op-wiz-sub-row .op-wiz-sub-ctl { display: flex; gap: 8px; align-items: flex-start; padding-left: 24px; }
            .op-wiz-sub-row .op-wiz-sub-ctl textarea.op-batch-desc { flex: 1 1 auto; min-width: 0; height: 30px; min-height: 30px; font-size: 12px; border: 1px solid #e2e8f0; border-radius: 6px; padding: 5px 8px; resize: vertical; transition: height 0.15s ease; background: #ffffff; }
            .op-wiz-sub-row .op-wiz-sub-ctl textarea.op-batch-desc:focus { height: 58px; border-color: #0284c7; outline: none; }
            .op-wiz-sub-row .op-wiz-sub-ctl select.op-batch-doc { flex: 0 0 160px; width: 160px; font-size: 11px; border: 1px solid #e2e8f0; border-radius: 6px; padding: 5px 6px; background: #ffffff; align-self: flex-start; }
            .op-wiz-sub-row.op-wiz-sub-off { opacity: 0.5; }

            .op-wizard-stage-card {
                background: #ffffff;
                border: 1px solid var(--op-border-subtle);
                border-radius: var(--op-radius-md);
                padding: 14px;
                margin-bottom: 14px;
            }

            /* ═══════════════════════════════════════════════════════════════
               SPRINT 10: MODERN ACTIVITY CARD TABLE — Pure CSS Layout
               Maintains display: table to ensure 100% compatibility with print/PDF,
               rowspan/colspan, and complete legibility without overlaps.
               ═══════════════════════════════════════════════════════════════ */
            table.table-bordered.op-activity-card-table,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table {
                display: table !important;
                width: 100% !important;
                border-collapse: separate !important;
                border-spacing: 0 !important;
                border: 1px solid var(--op-border-subtle) !important;
                border-radius: var(--op-radius-md) !important;
                box-shadow: var(--op-shadow-1) !important;
                margin: var(--op-space-16) auto !important;
                background: #ffffff !important;
                overflow: hidden !important;
                table-layout: auto !important;
            }

            /* Remove vertical borders inside the card, keep only horizontal separators */
            table.table-bordered.op-activity-card-table th,
            table.table-bordered.op-activity-card-table td,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table th,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td {
                border-top: none !important;
                border-left: none !important;
                border-right: none !important;
                border-bottom: 1px solid var(--op-border-subtle) !important;
                padding: 14px 18px !important;
                font-size: 13px !important;
                line-height: 1.6 !important;
                vertical-align: middle !important;
                background: #ffffff !important;
                color: var(--op-text-primary, #0f172a) !important;
            }

            /* First row: Numeral stage title (e.g. 1.2.3 Prueba) */
            table.table-bordered.op-activity-card-table tr:first-child th,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr:first-child th {
                background: var(--op-surface-elevated, #f1f5f9) !important;
                color: var(--op-text-primary, #0f172a) !important;
                font-weight: 700 !important;
                font-size: 13px !important;
                text-transform: uppercase !important;
                letter-spacing: 0.5px !important;
                text-align: center !important;
                border-bottom: 1px solid var(--op-border-subtle) !important;
            }

            /* Second row: Activity title (e.g. A- Prueba) */
            table.table-bordered.op-activity-card-table tr:nth-child(2) th,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr:nth-child(2) th {
                background: var(--op-surface-elevated, #f8fafc) !important;
                color: var(--op-text-secondary, #475569) !important;
                font-weight: 600 !important;
                font-size: 13px !important;
                border-bottom: 1px solid var(--op-border-subtle) !important;
            }

            /* Share button inside the second row */
            table.table-bordered.op-activity-card-table tr:nth-child(2) th.text-center,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr:nth-child(2) th.text-center {
                border-left: 1px solid var(--op-border-subtle) !important;
                width: 70px !important;
                background: var(--op-surface-elevated, #f8fafc) !important;
            }

            /* Bold metadata labels styling */
            table.table-bordered.op-activity-card-table td b,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td b {
                color: var(--op-text-muted, #64748b) !important;
                font-size: 10px !important;
                text-transform: uppercase !important;
                letter-spacing: 0.5px !important;
                display: block !important;
                margin-bottom: 4px !important;
            }

            /* Action column on the right (rowspan="2") */
            table.table-bordered.op-activity-card-table td[rowspan="2"],
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td[rowspan="2"] {
                background: var(--op-surface-elevated, #f8fafc) !important;
                border-left: 1px solid var(--op-border-subtle) !important;
                text-align: center !important;
                vertical-align: middle !important;
                width: 70px !important;
                padding: 10px !important;
            }

            /* Style action buttons inside the card */
            table.table-bordered.op-activity-card-table td[rowspan="2"] a,
            table.table-bordered.op-activity-card-table td[rowspan="2"] button,
            table.table-bordered.op-activity-card-table td a.btn,
            table.table-bordered.op-activity-card-table td button.btn,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td[rowspan="2"] a,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td[rowspan="2"] button,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td a.btn,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td button.btn {
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                width: 34px !important;
                height: 34px !important;
                min-width: 34px !important;
                border-radius: 50% !important;
                background: #ffffff !important;
                border: 1px solid var(--op-border-subtle) !important;
                color: var(--op-text-secondary, #475569) !important;
                margin: 4px !important;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05) !important;
                transition: all 0.2s ease !important;
                text-decoration: none !important;
                padding: 0 !important;
            }

            /* Keep original icons inside modern action pills centered */
            table.table-bordered.op-activity-card-table td a i,
            table.table-bordered.op-activity-card-table td button i {
                font-size: 14px !important;
                margin: 0 !important;
            }

            table.table-bordered.op-activity-card-table td[rowspan="2"] a:hover,
            table.table-bordered.op-activity-card-table td[rowspan="2"] button:hover,
            table.table-bordered.op-activity-card-table td a.btn:hover,
            table.table-bordered.op-activity-card-table td button.btn:hover {
                background: var(--op-surface-elevated, #f1f5f9) !important;
                color: var(--op-text-primary, #0f172a) !important;
                border-color: var(--op-border-strong, #94a3b8) !important;
                transform: translateY(-1px) !important;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1) !important;
            }

            /* Remove duplicate horizontal borders */
            table.table-bordered.op-activity-card-table tr:last-child td,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr:last-child td {
                border-bottom: none !important;
            }

            /* Responsive card layout overrides inside the split view detail panel */
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table {
                display: flex !important;
                flex-direction: column !important;
                width: 100% !important;
                border: 1px solid var(--op-border-strong, #cbd5e1) !important;
                border-radius: 12px !important;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05) !important;
                margin: 15px 0 !important;
                background: #ffffff !important;
                overflow: hidden !important;
                box-sizing: border-box !important;
            }

            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tbody,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr {
                display: flex !important;
                flex-direction: column !important;
                width: 100% !important;
                box-sizing: border-box !important;
            }

            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr {
                border-bottom: 1px solid var(--op-border-subtle, #e2e8f0) !important;
                padding: 12px 16px !important;
                background: #ffffff !important;
            }

            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr:last-child {
                border-bottom: none !important;
            }

            .op-detail-content-wrapper table.table-bordered.op-activity-card-table th,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td {
                display: block !important;
                width: 100% !important;
                padding: 4px 0 !important;
                border: none !important;
                background: transparent !important;
                box-sizing: border-box !important;
                word-wrap: break-word !important;
                word-break: break-word !important;
                white-space: normal !important;
            }

            /* Estilo del título de la etapa (numeral) */
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr:first-child th {
                font-size: 13px !important;
                font-weight: 700 !important;
                color: var(--op-text-primary, #0f172a) !important;
                text-align: left !important;
                background: var(--op-surface-elevated, #f1f5f9) !important;
                padding: 8px 12px !important;
                margin: -12px -16px 4px -16px !important;
                border-bottom: 1px solid var(--op-border-subtle, #e2e8f0) !important;
            }

            /* Estilo de la fila de metadatos */
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr:nth-child(2) {
                background: #f8fafc !important;
                border-bottom: 1px solid var(--op-border-subtle, #e2e8f0) !important;
            }

            /* Alineación de botones de acción en una barra horizontal moderna */
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td[rowspan="2"] {
                display: flex !important;
                flex-direction: row !important;
                align-items: center !important;
                justify-content: flex-start !important;
                gap: 12px !important;
                width: 100% !important;
                background: #f1f5f9 !important;
                padding: 8px 12px !important;
                margin: 8px -16px -12px -16px !important;
                border-top: 1px solid var(--op-border-subtle, #e2e8f0) !important;
                box-sizing: border-box !important;
            }

            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td[rowspan="2"] a,
            .op-detail-content-wrapper table.table-bordered.op-activity-card-table td[rowspan="2"] button {
                margin: 0 !important;
            }

            /* Muted orange pill for SIN ATENDER ACTIVIDAD state */
            .op-status-no-atendida {
                display: inline-flex !important;
                align-items: center !important;
                gap: 6px !important;
                background: #fff7ed !important;
                border: 1px solid #ffedd5 !important;
                color: #c2410c !important;
                font-size: 11px !important;
                font-weight: 700 !important;
                padding: 4px 10px !important;
                border-radius: 12px !important;
                text-transform: uppercase !important;
                letter-spacing: 0.5px !important;
            }

            /* Soft green pill for responded/atendida activities */
            .op-status-atendida {
                display: inline-flex !important;
                align-items: center !important;
                gap: 6px !important;
                background: #f0fdf4 !important;
                border: 1px solid #dcfce7 !important;
                color: #15803d !important;
                font-size: 11px !important;
                font-weight: 700 !important;
                padding: 4px 10px !important;
                border-radius: 12px !important;
                text-transform: uppercase !important;
                letter-spacing: 0.5px !important;
            }

            .op-status-atendida-box {
                padding: 10px 0 !important;
            }

            /* PDF and Print styling to ensure identical high-quality layout */
            @media print {

                table.table-bordered.op-activity-card-table,
                .op-detail-content-wrapper table.table-bordered.op-activity-card-table {
                    display: table !important;
                    page-break-inside: avoid !important;
                    box-shadow: none !important;
                    background: #ffffff !important;
                    border: 1px solid #cbd5e1 !important;
                    border-radius: 6px !important;
                }

                table.table-bordered.op-activity-card-table th,
                table.table-bordered.op-activity-card-table td,
                .op-detail-content-wrapper table.table-bordered.op-activity-card-table th,
                .op-detail-content-wrapper table.table-bordered.op-activity-card-table td {
                    background: #ffffff !important;
                    color: #000000 !important;
                    border-bottom: 1px solid #cbd5e1 !important;
                }

                table.table-bordered.op-activity-card-table tr:first-child th,
                .op-detail-content-wrapper table.table-bordered.op-activity-card-table tr:first-child th {
                    background: #f1f5f9 !important;
                    color: #000000 !important;
                }

                /* Hide print-unnecessary action columns and buttons */
                table.table-bordered.op-activity-card-table td[rowspan="2"],
                .op-detail-content-wrapper table.table-bordered.op-activity-card-table td[rowspan="2"] {
                    display: none !important;
                }
            }

            /* ═══ Sprint 10 ANNOTATED OBSOLETE (do NOT remove yet) ═══
               The following !important rules from Sprint 3 / Sprint 9 become
               redundant once .op-adapted-card governs layout via CSS Grid.
               They remain active as fallback for tables that don't match the
               adapter's detection criteria (degradation path).
               - .main-content table.table-bordered { margin, border-collapse, etc. }
               - .main-content table.table-bordered th/td { padding, font-size, etc. }
               - .op-detail-content-wrapper table.table-bordered td/th { border, padding }
               - .op-col-main table.table-bordered { margin, border-radius, etc. }
               Cleanup in a dedicated sprint after full verification.
               ═══════════════════════════════════════════════════════════════ */
        </style>
    </head>

    <body>

        <script src="Interfaz/Contenido/assets/modules/jquery.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/izitoast/js/iziToast.min.js"></script>
        <script src="Interfaz/Contenido/assets/js/page/modules-toastr.js"></script>
        <script src="Interfaz/Contenido/assets/modules/jquery.min.js"></script>
        <script type="text/javascript" src="Interfaz/Contenido/assets/Alertas/dist/sweetalert.min.js"></script>
        <script type="text/javascript" src="Interfaz/Contenido/assets/Validacion/LiveValidation.js"></script>
        <!-- ═══════════════════════════════════════════════════════════════
             PATCH DE RESILIENCIA JS: LIVEVALIDATION FALLBACK
             Evita la destruccion del hilo de ejecucion JS cuando los Tags
             Java legacy (Tag_proyecto, Tag_alertas) intentan validar IDs
             que no existen en la vista actual (e.g. 'datepicker').
             ═══════════════════════════════════════════════════════════════ -->
        <script>
            // ──────────────────────────────────────────────────────────────
            //  OnlyOffice Global Inline Editor Helpers
            // ──────────────────────────────────────────────────────────────
            window._ooInlineEditor = null;
            window._ooCurrentFileId = null;
            window._ooApiScriptLoaded = false;
            window._ooToken = '';

            window.ooLoadApiScript = function (documentServerUrl, callback) {
                if (window._ooApiScriptLoaded && window.DocsAPI) { callback(); return; }
                var src = documentServerUrl.replace(/\/$/, '') + '/web-apps/apps/api/documents/api.js';
                var existing = document.getElementById('oo-api-script');
                if (existing && window.DocsAPI) { window._ooApiScriptLoaded = true; callback(); return; }
                var s = document.createElement('script');
                s.id = 'oo-api-script';
                s.src = src;
                s.onload = function () { window._ooApiScriptLoaded = true; callback(); };
                s.onerror = function () { console.error('[OO] Failed to load api.js', src); };
                document.head.appendChild(s);
            };

            window.ooDestroyInline = function () {
                if (window._ooInlineEditor) {
                    try { window._ooInlineEditor.destroyEditor(); } catch (e) { }
                    window._ooInlineEditor = null;
                }
                var c = document.getElementById('oo-editor-container');
                if (c) {
                    c.innerHTML = '<div id="oo-editor-loading" style="display:flex;align-items:center;justify-content:center;height:100%;color:#aaa;font-size:14px;gap:10px;">' +
                        '<i class="fas fa-spinner fa-spin"></i> Cargando editor...</div>';
                }
            };

            window.ooCreateDoc = function (type) {
                window.ooDestroyInline();
                var loading = document.getElementById('oo-editor-loading');
                if (loading) loading.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Creando documento...';

                var API_KEY = 'opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0';
                var SERVER = 'http://localhost:8080';

                var url = SERVER + '/api/files/new';
                if (type === 'spreadsheet') url = SERVER + '/api/files/new/spreadsheet';
                if (type === 'presentation') url = SERVER + '/api/files/new/presentation';

                var headers = { 'Content-Type': 'application/json' };
                var s = document.querySelector('script[data-token]');
                var token = s ? s.getAttribute('data-token') || '' : '';
                if (token) {
                    headers['Authorization'] = 'Bearer ' + token;
                } else {
                    headers['X-Api-Key'] = API_KEY;
                }

                fetch(url, { method: 'POST', headers: headers })
                    .then(function (r) { return r.json(); })
                    .then(function (resp) {
                        console.log('[OO] Create response:', JSON.stringify(resp));
                        if (!resp || !resp.data) {
                            throw new Error('Respuesta inesperada del servidor: ' + JSON.stringify(resp));
                        }
                        var file = resp.data;
                        window._ooCurrentFileId = file.fileId || file.id;
                        var textInput = document.getElementById('textInput');
                        if (textInput) {
                            textInput.value = 'oo:' + window._ooCurrentFileId + ':' + (file.originalFileName || '');
                        }
                        window.ooRenderInline(window._ooCurrentFileId);

                        // Auto-guardar la referencia del documento OnlyOffice al proyecto
                        // después de un breve retraso para que el textInput esté listo
                        setTimeout(function () {
                            if (typeof window.opAutoSaveResponse === 'function'
                                && window._ooActiveIndex !== undefined
                                && window._ooActiveSubIndex !== undefined) {
                                // Asegurar que el textarea inline tenga algo para enviar
                                var inlineTa = document.getElementById('op-detail-response-text-' + window._ooActiveIndex + '-' + window._ooActiveSubIndex);
                                if (inlineTa && !inlineTa.value.trim()) {
                                    inlineTa.value = 'Documento OnlyOffice adjunto';
                                }
                                window.opAutoSaveResponse(window._ooActiveIndex, window._ooActiveSubIndex);
                                console.log('[OO] Auto-saved OnlyOffice reference for activity', window._ooActiveIndex, window._ooActiveSubIndex);
                            }
                        }, 500);
                    })
                    .catch(function (err) {
                        console.error('[OO] Error creating file:', err);
                        var loading = document.getElementById('oo-editor-loading');
                        if (loading) loading.innerHTML = '<i class="fas fa-exclamation-circle" style="color:#e74c3c"></i> Error al crear documento: ' + err.message;
                    });
            };

            window.ooRenderInline = function (fileId) {
                var API_KEY = 'opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0';
                var SERVER = 'http://localhost:8080';
                var loading = document.getElementById('oo-editor-loading');

                var headers = { 'Content-Type': 'application/json' };
                var s = document.querySelector('script[data-token]');
                var token = s ? s.getAttribute('data-token') || '' : '';
                if (token) {
                    headers['Authorization'] = 'Bearer ' + token;
                } else {
                    headers['X-Api-Key'] = API_KEY;
                }

                fetch(SERVER + '/api/editor/' + fileId, { headers: headers })
                    .then(function (r) { return r.json(); })
                    .then(function (resp) {
                        console.log('[OO] Editor config response:', JSON.stringify(resp));
                        if (!resp || !resp.data) {
                            throw new Error('Config incompleta: ' + JSON.stringify(resp));
                        }
                        var cfg = resp.data;
                        window.ooLoadApiScript(cfg.documentServer, function () {
                            if (loading) loading.remove();
                            var c = document.getElementById('oo-editor-container');
                            if (c) {
                                c.innerHTML = '';
                                var inner = document.createElement('div');
                                inner.id = 'oo-editor-inner-' + fileId;
                                inner.style.width = '100%';
                                inner.style.height = '100%';
                                c.appendChild(inner);

                                window._ooInlineEditor = new window.DocsAPI.DocEditor(inner.id, {
                                    document: cfg.document,
                                    documentType: cfg.document && cfg.document.fileType ? window.ooResolveDocType(cfg.document.fileType) : 'word',
                                    token: cfg.token,
                                    editorConfig: Object.assign({}, cfg.editorConfig, {
                                        customization: Object.assign({}, cfg.editorConfig && cfg.editorConfig.customization, {
                                            compactHeader: true,
                                            toolbarNoTabs: false,
                                            statusBar: true
                                        })
                                    }),
                                    height: '100%',
                                    width: '100%',
                                    events: {
                                        onDocumentReady: function () {
                                            var fi = document.getElementById('textInput');
                                            if (fi) fi.value = 'oo:' + fileId + ':' + (cfg.document && cfg.document.title ? cfg.document.title : '');
                                        }
                                    }
                                });
                            }
                        });
                    })
                    .catch(function (err) {
                        console.error('[OO] Editor config error:', err);
                        if (loading) loading.innerHTML = '<i class="fas fa-exclamation-circle" style="color:#e74c3c"></i> Error al cargar el editor.';
                    });
            };

            window.ooResolveDocType = function (ext) {
                var docs = ['doc', 'docx', 'odt', 'rtf', 'txt'];
                var sheets = ['xls', 'xlsx', 'ods', 'csv'];
                var slides = ['ppt', 'pptx', 'odp'];
                if (docs.indexOf(ext) >= 0) return 'word';
                if (sheets.indexOf(ext) >= 0) return 'cell';
                if (slides.indexOf(ext) >= 0) return 'slide';
                return 'word';
            };

            window.ooOpenFullscreen = function () {
                if (window._ooCurrentFileId && typeof OfficePlatform !== 'undefined' && typeof OfficePlatform.openEditor === 'function') {
                    OfficePlatform.openEditor({ fileId: window._ooCurrentFileId });
                } else if (!window._ooCurrentFileId) {
                    alert('Primero crea un documento usando los botones de arriba.');
                } else {
                    alert('El servicio de OnlyOffice no está disponible en este momento.');
                }
            };
        </script>
        <script type="text/javascript">
            (function () {
                if (typeof LiveValidation !== 'undefined' && LiveValidation.prototype && LiveValidation.prototype.initialize) {
                    var _origInit = LiveValidation.prototype.initialize;
                    LiveValidation.prototype.initialize = function (element, options) {
                        var targetEl = (typeof element === 'string') ? document.getElementById(element) : element;
                        if (!targetEl) {
                            console.warn('[LiveValidation Resilience Patch] Elemento no encontrado en el DOM:', element, '— Evitando excepcion fatal.');
                            var dummy = document.createElement('input');
                            dummy.type = 'hidden';
                            dummy.id = 'op-dummy-' + Math.random().toString(36).substring(7);
                            this.element = dummy;
                            this.valid = true;
                            this.form = null;
                            this.options = options || {};
                            return true;
                        }
                        return _origInit.call(this, element, options);
                    };
                }
            })();
        </script>

        <% Object documentObj=session.getAttribute("Documento"); Object usuarioObj=session.getAttribute("Usuario");
            Object idUsuarioObj=session.getAttribute("Id_usuario"); String cedulaStr="12345678" ; if (documentObj !=null
            && !documentObj.toString().trim().isEmpty()) { cedulaStr=documentObj.toString().trim(); } else if
            (idUsuarioObj !=null && !idUsuarioObj.toString().trim().isEmpty()) {
            cedulaStr=idUsuarioObj.toString().trim(); } String nombreStr=(usuarioObj !=null &&
            !usuarioObj.toString().trim().isEmpty()) ? usuarioObj.toString().trim() : "FABIAN GAONA" ; String token="" ;
            boolean isAjaxOrPost="POST" .equalsIgnoreCase(request.getMethod()) || "XMLHttpRequest"
            .equalsIgnoreCase(request.getHeader("X-Requested-With")); if (!isAjaxOrPost) {
            token=Methods.OfficePlatformResolver.resolveToken(cedulaStr, nombreStr); } %>
            <%-- Contenedor oculto para el widget OnlyOffice en paginas que no tienen el suyo propio
                (evita "Container not found" ). Se omite en OfficePlatform.jsp, que ya tiene su propio #office-platform
                visible. --%>
                <% if (request.getRequestURI()==null ||
                    !request.getRequestURI().toLowerCase().contains("officeplatform")) { %>
                    <div id="office-platform" style="display: none;"></div>
                    <% } %>
                        <%-- defer: NUNCA bloquear el render (login/index). El widget se carga de :8080; si ese
                             servicio esta caido/lento, un <script> sincronico congela la pagina (pantalla azul en el
                             login). Con defer descarga en paralelo y ejecuta tras el parse -> el DOM se pinta siempre.
                             El widget igual auto-monta en DOMContentLoaded (defer corre antes de DCL). --%>
                        <script defer
                            src="http://localhost:8080/office-platform-widget.js?v=<%= System.currentTimeMillis() %>"
                            data-api-key="opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0"
                            data-container="office-platform" data-server="http://localhost:8080"
                            data-token="<%= token %>" data-user-id="<%= cedulaStr %>" data-user-name="<%= nombreStr %>">
                            </script>
                        <script>
                            // ===================================================================
                            //  OO EDITOR GLOBAL HELPER  —  window.ooInitEditor(cfg)
                            //  Convierte cualquier div en un editor OnlyOffice embebido con:
                            //    - Barra superior: botones Word / Excel / PowerPoint + Pantalla completa
                            //    - Editor DocsAPI renderizado inline (480px alto)
                            // ===================================================================
                            (function () {
                                var OO_API_KEY = 'opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0';
                                var OO_SERVER = 'http://localhost:8080';
                                var _apiScriptLoaded = false;
                                var _ooToken = '';

                                function getToken() {
                                    if (_ooToken) return _ooToken;
                                    var s = document.querySelector('script[data-token]');
                                    if (s) _ooToken = s.getAttribute('data-token') || '';
                                    return _ooToken;
                                }

                                function getHeaders() {
                                    var t = getToken();
                                    var h = { 'Content-Type': 'application/json' };
                                    if (t) h['Authorization'] = 'Bearer ' + t;
                                    else h['X-Api-Key'] = OO_API_KEY;
                                    return h;
                                }

                                function resolveDocType(ext) {
                                    if (['doc', 'docx', 'odt', 'rtf', 'txt'].indexOf(ext) >= 0) return 'word';
                                    if (['xls', 'xlsx', 'ods', 'csv'].indexOf(ext) >= 0) return 'cell';
                                    if (['ppt', 'pptx', 'odp'].indexOf(ext) >= 0) return 'slide';
                                    return 'word';
                                }

                                function loadApiScript(serverUrl, cb) {
                                    if (_apiScriptLoaded && window.DocsAPI) { cb(); return; }
                                    var existing = document.getElementById('oo-api-script');
                                    if (existing && window.DocsAPI) { _apiScriptLoaded = true; cb(); return; }
                                    var s = document.createElement('script');
                                    s.id = 'oo-api-script';
                                    s.src = serverUrl.replace(/\/$/, '') + '/web-apps/apps/api/documents/api.js';
                                    s.onload = function () { _apiScriptLoaded = true; cb(); };
                                    s.onerror = function () { console.error('[OO] Failed to load api.js', s.src); };
                                    document.head.appendChild(s);
                                }

                                function buildContainer(wrapperId) {
                                    var w = document.getElementById(wrapperId);
                                    if (!w) { console.warn('[OO] container not found:', wrapperId); return; }
                                    w.style.cssText = 'border:1px solid #d1d7e0;border-radius:10px;overflow:hidden;background:#1d1d1d;';
                                    w.innerHTML =
                                        '<div class="oo-toolbar" style="display:flex;align-items:center;gap:6px;padding:8px 10px;background:#222;border-bottom:1px solid #3a3a3a;">' +
                                        '<span style="color:#aaa;font-size:12px;margin-right:4px;">Nuevo:</span>' +
                                        '<button type="button" data-oo-type="document"     class="oo-type-btn btn btn-sm" style="background:#1565c0;color:#fff;border:none;border-radius:6px;font-size:12px;padding:3px 10px;"><i class="far fa-file-word"></i> Word</button>' +
                                        '<button type="button" data-oo-type="spreadsheet"  class="oo-type-btn btn btn-sm" style="background:#2e7d32;color:#fff;border:none;border-radius:6px;font-size:12px;padding:3px 10px;"><i class="far fa-file-excel"></i> Excel</button>' +
                                        '<button type="button" data-oo-type="presentation" class="oo-type-btn btn btn-sm" style="background:#e65100;color:#fff;border:none;border-radius:6px;font-size:12px;padding:3px 10px;"><i class="far fa-file-powerpoint"></i> PowerPoint</button>' +
                                        '<div style="flex:1"></div>' +
                                        '<button type="button" class="oo-fullscreen-btn btn btn-sm" style="background:#333;color:#ccc;border:1px solid #555;border-radius:6px;font-size:12px;padding:3px 10px;" title="Pantalla completa"><i class="fas fa-expand"></i> Pantalla completa</button>' +
                                        '</div>' +
                                        '<div class="oo-inner" style="width:100%;height:480px;background:#1d1d1d;">' +
                                        '<div class="oo-loading" style="display:flex;align-items:center;justify-content:center;height:100%;color:#aaa;font-size:14px;gap:10px;"><i class="fas fa-spinner fa-spin"></i> Iniciando editor...</div>' +
                                        '</div>';
                                }

                                function showLoading(wrapperId, msg) {
                                    var inner = document.querySelector('#' + wrapperId + ' .oo-inner');
                                    if (!inner) return;
                                    inner.innerHTML = '<div class="oo-loading" style="display:flex;align-items:center;justify-content:center;height:100%;color:#aaa;font-size:14px;gap:10px;">' + (msg || '<i class="fas fa-spinner fa-spin"></i> Cargando...') + '</div>';
                                }

                                function destroyEditor(wrapperId) {
                                    if (!window._ooInstances) window._ooInstances = {};
                                    var inst = window._ooInstances[wrapperId];
                                    if (inst && inst.editor) { try { inst.editor.destroyEditor(); } catch (e) { } }
                                    window._ooInstances[wrapperId] = null;
                                }

                                function renderEditor(wrapperId, inputId, fileId) {
                                    showLoading(wrapperId, '<i class="fas fa-spinner fa-spin"></i> Cargando editor...');
                                    var inner = document.querySelector('#' + wrapperId + ' .oo-inner');
                                    if (!inner) return;

                                    fetch(OO_SERVER + '/api/editor/' + fileId, { headers: getHeaders() })
                                        .then(function (r) { return r.json(); })
                                        .then(function (resp) {
                                            if (!resp || !resp.data) throw new Error('Config inválida: ' + JSON.stringify(resp));
                                            var cfg = resp.data;
                                            loadApiScript(cfg.documentServer, function () {
                                                var loadDiv = inner.querySelector('.oo-loading');
                                                if (loadDiv) loadDiv.remove();

                                                var innerId = wrapperId + '-doc';
                                                var div = document.createElement('div');
                                                div.id = innerId;
                                                inner.appendChild(div);

                                                destroyEditor(wrapperId);
                                                var docEditor = new window.DocsAPI.DocEditor(innerId, {
                                                    document: cfg.document,
                                                    documentType: resolveDocType(cfg.document && cfg.document.fileType),
                                                    token: cfg.token,
                                                    editorConfig: Object.assign({}, cfg.editorConfig, {
                                                        customization: Object.assign({}, (cfg.editorConfig || {}).customization, {
                                                            compactHeader: true,
                                                            toolbarNoTabs: false,
                                                            statusBar: true
                                                        })
                                                    }),
                                                    height: '100%',
                                                    width: '100%',
                                                    events: {
                                                        onDocumentReady: function () {
                                                            var inp = document.getElementById(inputId);
                                                            if (inp) inp.value = 'oo:' + fileId + ':' + ((cfg.document && cfg.document.title) || '');
                                                        }
                                                    }
                                                });
                                                if (!window._ooInstances) window._ooInstances = {};
                                                window._ooInstances[wrapperId] = { editor: docEditor, fileId: fileId };
                                            });
                                        })
                                        .catch(function (err) {
                                            console.error('[OO] renderEditor error:', err);
                                            showLoading(wrapperId, '<i class="fas fa-exclamation-circle" style="color:#e74c3c"></i> Error: ' + err.message);
                                        });
                                }

                                function createAndRender(wrapperId, inputId, type) {
                                    destroyEditor(wrapperId);
                                    showLoading(wrapperId, '<i class="fas fa-spinner fa-spin"></i> Creando documento...');
                                    var urlMap = {
                                        document: OO_SERVER + '/api/files/new',
                                        spreadsheet: OO_SERVER + '/api/files/new/spreadsheet',
                                        presentation: OO_SERVER + '/api/files/new/presentation'
                                    };
                                    fetch(urlMap[type] || urlMap.document, { method: 'POST', headers: getHeaders() })
                                        .then(function (r) { return r.json(); })
                                        .then(function (resp) {
                                            if (!resp || !resp.data) throw new Error('Error al crear: ' + JSON.stringify(resp));
                                            var fileId = resp.data.fileId || resp.data.id;
                                            renderEditor(wrapperId, inputId, fileId);
                                        })
                                        .catch(function (err) {
                                            console.error('[OO] createAndRender error:', err);
                                            showLoading(wrapperId, '<i class="fas fa-exclamation-circle" style="color:#e74c3c"></i> ' + err.message);
                                        });
                                }

                                function wireButtons(wrapperId, inputId) {
                                    var w = document.getElementById(wrapperId);
                                    if (!w) return;
                                    w.querySelectorAll('.oo-type-btn').forEach(function (btn) {
                                        btn.addEventListener('click', function () {
                                            createAndRender(wrapperId, inputId, btn.getAttribute('data-oo-type'));
                                        });
                                    });
                                    var fsBtn = w.querySelector('.oo-fullscreen-btn');
                                    if (fsBtn) {
                                        fsBtn.addEventListener('click', function () {
                                            var inst = window._ooInstances && window._ooInstances[wrapperId];
                                            var fid = inst && inst.fileId;
                                            if (fid && typeof OfficePlatform !== 'undefined' && OfficePlatform.openEditor) {
                                                OfficePlatform.openEditor({ fileId: fid });
                                            } else if (!fid) {
                                                alert('Crea un documento primero usando los botones de arriba.');
                                            } else {
                                                alert('OnlyOffice no disponible.');
                                            }
                                        });
                                    }
                                }

                                // PUBLIC — llamado desde cada JSP
                                window.ooInitEditor = function (cfg) {
                                    var wrapperId = cfg.containerId;
                                    var inputId = cfg.inputId;
                                    var existingId = cfg.existingFileId || null;
                                    var autoLoad = (cfg.autoLoad !== false);

                                    buildContainer(wrapperId);
                                    wireButtons(wrapperId, inputId);

                                    if (existingId) {
                                        renderEditor(wrapperId, inputId, existingId);
                                    } else if (autoLoad) {
                                        createAndRender(wrapperId, inputId, 'document');
                                    }
                                };

                                // Helper global para abrir o descargar archivos de OnlyOffice con autorización
                                // ── P5: visor nativo para no-Office ────────────────────────────────────────────
                                window._opEsc = function (s) { return ('' + (s == null ? '' : s)).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;'); };
                                window._opDecodeQP = function (s) { return ('' + s).replace(/=\r?\n/g, '').replace(/=([0-9A-Fa-f]{2})/g, function (_, h) { return String.fromCharCode(parseInt(h, 16)); }); };
                                // Parser RFC822 pragmatico: cabeceras + mejor parte de cuerpo (text/plain|html), con fallbacks.
                                window.opParseEml = function (raw) {
                                    var out = { from: '', to: '', cc: '', subject: '', date: '', body: '', isHtml: false };
                                    try {
                                        var crlf = raw.indexOf('\r\n\r\n'), lf = raw.indexOf('\n\n');
                                        var sep = (crlf >= 0) ? crlf : lf;
                                        var head = sep >= 0 ? raw.substring(0, sep) : raw;
                                        var body = sep >= 0 ? raw.substring(sep + (crlf >= 0 ? 4 : 2)) : '';
                                        head = head.replace(/\r?\n[ \t]+/g, ' ');
                                        function h(n) { var m = head.match(new RegExp('^' + n + ':\\s*(.*)$', 'im')); return m ? m[1].trim() : ''; }
                                        out.from = h('From'); out.to = h('To'); out.cc = h('Cc'); out.subject = h('Subject'); out.date = h('Date');
                                        var ctype = (h('Content-Type') || '').toLowerCase();
                                        var cte = (h('Content-Transfer-Encoding') || '').toLowerCase();
                                        var mb = ctype.match(/boundary="?([^";]+)"?/);
                                        if (mb) {
                                            var parts = body.split('--' + mb[1]), chosen = null, chosenHtml = false;
                                            for (var i = 0; i < parts.length; i++) {
                                                var pl = parts[i].toLowerCase();
                                                if (pl.indexOf('content-type: text/plain') !== -1 && !chosen) { chosen = parts[i]; chosenHtml = false; }
                                                if (pl.indexOf('content-type: text/html') !== -1) { chosen = parts[i]; chosenHtml = true; }
                                            }
                                            if (chosen) {
                                                var pc = chosen.indexOf('\r\n\r\n'), pl2 = chosen.indexOf('\n\n'), ps = (pc >= 0) ? pc : pl2;
                                                var pcte = (chosen.match(/content-transfer-encoding:\s*([^\r\n]+)/i) || [])[1];
                                                body = ps >= 0 ? chosen.substring(ps + (pc >= 0 ? 4 : 2)) : chosen;
                                                cte = (pcte || '').toLowerCase(); out.isHtml = chosenHtml;
                                            }
                                        }
                                        if (cte.indexOf('quoted-printable') !== -1) body = window._opDecodeQP(body);
                                        else if (cte.indexOf('base64') !== -1) { try { body = decodeURIComponent(escape(atob(body.replace(/\s+/g, '')))); } catch (e) { } }
                                        out.body = body;
                                    } catch (e) { out.body = raw; }
                                    return out;
                                };
                                window.opDownloadViewerFile = function () {
                                    var d = window._opViewerDl; if (!d) return;
                                    var a = document.createElement('a'); a.href = d.url; a.download = d.name || 'archivo';
                                    document.body.appendChild(a); a.click(); a.remove();
                                };
                                window.opCloseFileViewer = function () {
                                    var m = document.getElementById('op-file-viewer'); if (m) m.remove();
                                    try { if (window._opViewerObjUrl) { window.URL.revokeObjectURL(window._opViewerObjUrl); window._opViewerObjUrl = null; } } catch (e) { }
                                };
                                window.opFileViewerModal = function (titleText, bodyHtml, dlUrl, dlName) {
                                    window.opCloseFileViewer();
                                    window._opViewerObjUrl = dlUrl || null;
                                    window._opViewerDl = dlUrl ? { url: dlUrl, name: dlName } : null;
                                    var ov = document.createElement('div');
                                    ov.id = 'op-file-viewer';
                                    ov.style.cssText = 'position:fixed; inset:0; z-index:100000; background:rgba(15,23,42,0.55); display:flex; align-items:center; justify-content:center; padding:24px;';
                                    ov.innerHTML = '<div style="background:#fff; width:100%; max-width:920px; max-height:90vh; border-radius:12px; overflow:hidden; display:flex; flex-direction:column; box-shadow:0 20px 60px rgba(0,0,0,0.3);">'
                                        + '  <div style="display:flex; align-items:center; gap:10px; padding:12px 16px; border-bottom:1px solid #e2e8f0; background:#f8fafc;">'
                                        + '    <i class="fas fa-eye text-primary"></i>'
                                        + '    <span style="font-weight:700; font-size:13px; color:#1e293b; flex:1; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">' + window._opEsc(titleText || 'Documento') + '</span>'
                                        + (dlUrl ? '    <button type="button" class="btn btn-sm btn-outline-primary font-weight-bold" onclick="opDownloadViewerFile()" title="Descargar original"><i class="fas fa-download mr-1"></i> Descargar</button>' : '')
                                        + '    <button type="button" class="btn btn-sm btn-light" onclick="opCloseFileViewer()" style="font-weight:700; line-height:1;">&times;</button>'
                                        + '  </div>'
                                        + '  <div style="flex:1; overflow:auto; padding:0; background:#fff;">' + bodyHtml + '</div>'
                                        + '</div>';
                                    ov.addEventListener('click', function (e) { if (e.target === ov) opCloseFileViewer(); });
                                    document.body.appendChild(ov);
                                };
                                // P4: Gestor de Archivos completo (OfficePlatform.jsp) en un modal overlay con iframe,
                                // sin salir del contexto de la memoria. Cierra por boton x o click en el overlay.
                                window.opOpenFileManagerModal = function (index, subIndex) {
                                    // Recordar desde que actividad se abrio (para "Vincular seleccionado"). Puede venir sin args
                                    // (uso general): en ese caso el boton de vincular avisa que no hay actividad destino.
                                    window._opFmActiveIndex = (index === undefined || index === null) ? null : index;
                                    window._opFmActiveSub = (subIndex === undefined || subIndex === null) ? null : subIndex;
                                    var canLink = window._opFmActiveIndex !== null && window._opFmActiveSub !== null;
                                    var old = document.getElementById('op-fm-fullmodal'); if (old) old.remove();
                                    var ov = document.createElement('div');
                                    ov.id = 'op-fm-fullmodal';
                                    ov.style.cssText = 'position:fixed; inset:0; z-index:100000; background:rgba(15,23,42,0.55); display:flex; align-items:center; justify-content:center; padding:20px;';
                                    ov.innerHTML = '<div style="background:#fff; width:100%; max-width:1240px; height:90vh; border-radius:12px; overflow:hidden; display:flex; flex-direction:column; box-shadow:0 20px 60px rgba(0,0,0,0.3);">'
                                        + '  <div style="display:flex; align-items:center; gap:10px; padding:12px 16px; border-bottom:1px solid #e2e8f0; background:#f8fafc;">'
                                        + '    <i class="fas fa-folder-open text-warning"></i>'
                                        + '    <span style="font-weight:700; font-size:14px; color:#1e293b; flex:1;">Gestor de Archivos — Office Platform</span>'
                                        + (canLink ? '    <button type="button" class="btn btn-sm btn-success font-weight-bold" onclick="opLinkSelectedFileFromIframe()" title="Vincular a la actividad el archivo seleccionado en el gestor"><i class="fas fa-link mr-1"></i> Vincular seleccionado</button>' : '')
                                        + '    <button type="button" class="btn btn-sm btn-light" onclick="opCloseFileManagerModal()" style="font-weight:700; line-height:1;">&times;</button>'
                                        + '  </div>'
                                        + '  <iframe src="OfficePlatformEmbed.jsp" style="flex:1; width:100%; border:none;" title="Gestor de Archivos"></iframe>'
                                        + '</div>';
                                    ov.addEventListener('click', function (e) { if (e.target === ov) opCloseFileManagerModal(); });
                                    document.body.appendChild(ov);
                                    // Puente de clic: si el gestor se abrio DESDE una actividad, el clic principal en una tarjeta
                                    // VINCULA (no previsualiza). Listener en CAPTURA sobre el doc del iframe (same-origin) para
                                    // interceptar antes del onclick propio del widget. La previsualizacion queda para el menu (⋮)/
                                    // controles explicitos. Delegacion en document -> cubre tarjetas renderizadas async.
                                    if (canLink) {
                                        var ifr = ov.querySelector('iframe');
                                        if (ifr) {
                                            ifr.onload = function () {
                                                var d = null;
                                                try { d = ifr.contentDocument || (ifr.contentWindow && ifr.contentWindow.document); } catch (e) { d = null; }
                                                if (!d) return;
                                                d.addEventListener('click', function (e) {
                                                    if (window._opFmActiveIndex === null || window._opFmActiveSub === null) return;
                                                    var t = e.target;
                                                    if (!t || !t.closest) return;
                                                    // Dejar pasar controles explicitos (menu ⋮, checkbox, botones, enlaces, inputs)
                                                    if (t.closest('.op-card-menu-btn, .op-card-check, .op-card-menu, .op-row-menu, .op-menu, button, a, input, select')) return;
                                                    var card = t.closest('.op-card, .op-row');
                                                    if (!card) return;
                                                    var fid = card.getAttribute('data-id');
                                                    if (!fid) return;
                                                    e.preventDefault(); e.stopPropagation();
                                                    var nameEl = card.querySelector('.op-card-name') || card.querySelector('.op-row-name');
                                                    var fname = nameEl ? (nameEl.textContent || '').trim() : ('archivo_' + fid);
                                                    opLinkFile(fid, fname);
                                                }, true); // captura: gana al onclick del widget
                                            };
                                        }
                                    }
                                };
                                window.opCloseFileManagerModal = function () { var m = document.getElementById('op-fm-fullmodal'); if (m) m.remove(); };
                                // Vincula UN archivo (id+nombre) a la actividad activa: inserta oo:<id>:<nombre> en la observacion,
                                // autoguarda (BD opc=11 + borrador) y cierra el modal con toast. Reutilizado por el clic y el boton.
                                window.opLinkFile = function (fid, fname) {
                                    var idx = window._opFmActiveIndex, sub = window._opFmActiveSub;
                                    if (idx === null || sub === null) return;
                                    var ta = document.getElementById('op-detail-response-text-' + idx + '-' + sub);
                                    if (!ta) { alert('No se encontró el área de la actividad destino.'); return; }
                                    var cur = (ta.value || '').trim();
                                    if (cur.indexOf('oo:' + fid + ':') !== -1) {
                                        if (window.opToast) opToast('<i class="fas fa-info-circle mr-1"></i> Ese archivo ya estaba vinculado');
                                        opCloseFileManagerModal(); return;
                                    }
                                    var tag = 'oo:' + fid + ':' + fname;
                                    ta.value = cur ? (cur + '\n' + tag) : tag;
                                    if (typeof opAutoSaveResponse === 'function') opAutoSaveResponse(idx, sub);
                                    if (typeof opSaveDraft === 'function') opSaveDraft('resp', idx + '-' + sub, ta.value);
                                    if (window.opToast) opToast('<i class="fas fa-link mr-1"></i> Archivo vinculado con éxito');
                                    opCloseFileManagerModal();
                                };
                                // Puente same-origin: lee del iframe del widget la(s) tarjeta(s) seleccionada(s) (.op-card/.op-row con
                                // .op-selected y data-id) e inserta oo:<id>:<nombre> en la observacion de la actividad que abrio el modal.
                                window.opLinkSelectedFileFromIframe = function () {
                                    var idx = window._opFmActiveIndex, sub = window._opFmActiveSub;
                                    if (idx === null || sub === null) { alert('No hay actividad destino. Abrí el gestor desde el botón de una actividad para poder vincular.'); return; }
                                    var modal = document.getElementById('op-fm-fullmodal');
                                    var iframe = modal ? modal.querySelector('iframe') : null;
                                    var doc = null;
                                    try { doc = iframe && (iframe.contentDocument || (iframe.contentWindow && iframe.contentWindow.document)); } catch (e) { doc = null; }
                                    if (!doc) { alert('No se pudo acceder al gestor (aún cargando). Esperá unos segundos e intentá de nuevo.'); return; }
                                    var sel = doc.querySelectorAll('.op-card.op-selected, .op-row.op-selected');
                                    if (!sel || sel.length === 0) { alert('Por favor selecciona un archivo en el gestor para vincularlo (activá la casilla de la tarjeta / modo selección).'); return; }
                                    var ta = document.getElementById('op-detail-response-text-' + idx + '-' + sub);
                                    if (!ta) { alert('No se encontró el área de la actividad destino.'); return; }
                                    var linked = 0;
                                    for (var i = 0; i < sel.length; i++) {
                                        var el = sel[i];
                                        var fid = el.getAttribute('data-id');
                                        if (!fid) continue;
                                        var nameEl = el.querySelector('.op-card-name') || el.querySelector('.op-row-name');
                                        var fname = nameEl ? (nameEl.textContent || '').trim() : ('archivo_' + fid);
                                        var cur = (ta.value || '').trim();
                                        var tag = 'oo:' + fid + ':' + fname;
                                        if (cur.indexOf('oo:' + fid + ':') !== -1) continue; // ya vinculado
                                        ta.value = cur ? (cur + '\n' + tag) : tag;
                                        linked++;
                                    }
                                    if (linked === 0) { alert('El/los archivo(s) seleccionado(s) ya estaban vinculados a esta actividad.'); return; }
                                    if (typeof opAutoSaveResponse === 'function') opAutoSaveResponse(idx, sub);
                                    if (typeof opSaveDraft === 'function') opSaveDraft('resp', idx + '-' + sub, ta.value);
                                    if (window.opToast) opToast('<i class="fas fa-link mr-1"></i> ' + linked + ' archivo(s) vinculado(s) a la actividad');
                                    opCloseFileManagerModal();
                                };
                                window.opOpenOOFile = function (fileId, title) {
                                    var name = (title || '').toLowerCase();
                                    var isOO = /\.(docx?|xlsx?|pptx?|odt|ods|odp)$/.test(name);
                                    var isEml = /\.eml$/.test(name), isMsg = /\.msg$/.test(name);
                                    var isPdf = /\.pdf$/.test(name);
                                    var isImg = /\.(png|jpe?g|gif|webp|bmp|svg|tiff?)$/.test(name);
                                    var isText = /\.(txt|log|json|xml|csv|md|markdown|ya?ml|ini|js|ts|css|html?|java|sql|properties)$/.test(name);
                                    var id = parseInt(fileId, 10);
                                    if (isOO) {
                                        if (typeof OfficePlatform !== 'undefined' && typeof OfficePlatform.openEditor === 'function') { OfficePlatform.openEditor({ fileId: id }); }
                                        else if (typeof window.ooInitEditor === 'function') { window.ooInitEditor({ containerId: 'office-platform', inputId: 'textInput', existingFileId: id, autoLoad: true }); }
                                        return;
                                    }
                                    var dl = 'http://localhost:8080/api/files/' + id + '/download';
                                    if (window.opToast) opToast('<i class="fas fa-spinner fa-spin mr-1"></i> Abriendo ' + (title || ('archivo ' + id)) + '...');
                                    // Descarga con el BEARER token del usuario (abre sus archivos privados subidos por Subir PC);
                                    // si da 401/403, reintenta con X-Api-Key (archivos globales/legacy). Sin token -> api-key directo.
                                    var _dlTok = (document.querySelector('script[data-token]') || {}).getAttribute ? (document.querySelector('script[data-token]').getAttribute('data-token') || '') : '';
                                    function _dlFetch(useBearer) {
                                        var h = useBearer ? { 'Authorization': 'Bearer ' + _dlTok } : { 'X-Api-Key': 'opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0' };
                                        return fetch(dl, { method: 'GET', headers: h });
                                    }
                                    (_dlTok ? _dlFetch(true).then(function (r) { return (r.status === 401 || r.status === 403) ? _dlFetch(false) : r; }) : _dlFetch(false))
                                        .then(function (res) {
                                            if (res.status === 404) { throw new Error('legacy'); }
                                            if (res.status === 403) { throw new Error('forbidden'); }
                                            if (!res.ok) { throw new Error('http-' + res.status); }
                                            return res.blob();
                                        })
                                        .then(function (blob) {
                                            var objUrl = window.URL.createObjectURL(blob);
                                            if (isPdf) { opFileViewerModal(title, '<iframe src="' + objUrl + '" style="width:100%; height:80vh; border:none;"></iframe>', objUrl, title); return; }
                                            if (isImg) { opFileViewerModal(title, '<div style="padding:16px; text-align:center; background:#0f172a; min-height:200px;"><img src="' + objUrl + '" style="max-width:100%; height:auto;" alt="' + window._opEsc(title) + '"></div>', objUrl, title); return; }
                                            if (isEml) {
                                                return blob.text().then(function (raw) {
                                                    var m = window.opParseEml(raw);
                                                    function row(l, v) { return v ? '<div style="margin-bottom:4px;"><b style="color:#0f5c95; display:inline-block; min-width:64px;">' + l + ':</b> ' + window._opEsc(v) + '</div>' : ''; }
                                                    var hdr = '<div style="padding:14px 16px; border-bottom:1px solid #e2e8f0; font-size:12.5px; background:#fbfdff; color:#1e293b;">'
                                                        + row('De', m.from) + row('Para', m.to) + row('CC', m.cc) + row('Asunto', m.subject) + row('Fecha', m.date) + '</div>';
                                                    var bodyBlock = m.isHtml
                                                        ? '<iframe sandbox srcdoc="' + ('' + m.body).replace(/&/g, '&amp;').replace(/"/g, '&quot;') + '" style="width:100%; height:55vh; border:none; background:#fff;"></iframe>'
                                                        : '<pre style="white-space:pre-wrap; word-wrap:break-word; font-family:inherit; font-size:13px; margin:0; padding:16px; color:#1e293b;">' + window._opEsc(m.body || '(cuerpo vacío)') + '</pre>';
                                                    opFileViewerModal(title, hdr + bodyBlock, objUrl, title);
                                                });
                                            }
                                            if (isMsg) { opFileViewerModal(title, '<div style="padding:28px; text-align:center; color:#64748b;"><i class="fas fa-envelope fa-2x mb-2"></i><p style="margin-top:10px;">Correo de Outlook (.msg): formato binario, no se previsualiza en el navegador.<br>Usá <b>Descargar</b> para abrirlo en tu cliente de correo.</p></div>', objUrl, title); return; }
                                            if (isText) { return blob.text().then(function (txt) { opFileViewerModal(title, '<pre style="white-space:pre-wrap; word-wrap:break-word; font-size:12.5px; margin:0; padding:16px; color:#1e293b;">' + window._opEsc(txt) + '</pre>', objUrl, title); }); }
                                            // Resto (zip, binarios, etc.) -> descarga directa
                                            var a = document.createElement('a'); a.href = objUrl; a.download = title || ('archivo_' + id);
                                            document.body.appendChild(a); a.click(); a.remove();
                                            if (window.opToast) opToast('<i class="fas fa-check mr-1"></i> Archivo descargado');
                                        })
                                        .catch(function (err) {
                                            var mm = (err && err.message) || '';
                                            var msg = (mm === 'legacy') ? '<i class="fas fa-exclamation-triangle mr-1"></i> Archivo no disponible: registro legacy que no existe en el almacenamiento.'
                                                : (mm === 'forbidden') ? '<i class="fas fa-lock mr-1"></i> Sin permisos de descarga: el archivo se subio como privado. Contacte al administrador.'
                                                    : '<i class="fas fa-exclamation-triangle mr-1"></i> No se pudo abrir el archivo.';
                                            if (window.opToast) opToast(msg, false); else alert(msg.replace(/<[^>]+>/g, ''));
                                        });
                                };

                                        // Intercept ALL OnlyOffice file links and open in OfficePlatform.openEditor()
                                        document.addEventListener('click', function (e) {
                                            var t = e.target.closest('a');
                                            if (!t) return;
                                            var href = t.getAttribute('href') || '';
                                            var fid = t.getAttribute('data-file-id');
                                            if (!fid) {
                                                var m = href.match(/\/api\/files\/(\d+)\/download/);
                                                if (m) fid = m[1];
                                            }
                                            if (fid) {
                                                e.preventDefault();
                                                e.stopPropagation();
                                                window.opOpenOOFile(fid, (t.textContent || 'Documento').trim());
                                            }
                                        }, true);

                                        // Observador para alternar la clase op-editor-open en el body cuando el modal de OnlyOffice esté activo
                                        var observer = new MutationObserver(function () {
                                            var hasOverlay = !!document.querySelector('.op-editor-overlay');
                                            if (hasOverlay) {
                                                document.body.classList.add('op-editor-open');
                                            } else {
                                                document.body.classList.remove('op-editor-open');
                                            }
                                        });
                                        if (document.body) {
                                            observer.observe(document.body, { childList: true, subtree: true });
                                        } else {
                                            document.addEventListener('DOMContentLoaded', function () {
                                                observer.observe(document.body, { childList: true, subtree: true });
                                            });
                                        }

                                        // ═══════════════════════════════════════════════════════════════
                                        // FORMATTEADOR UNIVERSAL DE HIPERVÍNCULOS Y EVIDENCIAS ONLYOFFICE
                                        // ═══════════════════════════════════════════════════════════════
                                        window.opFormatHyperlinksAndTags = function (text) {
                                            if (!text) return '';
                                            var raw = String(text);
                                            var safe = raw
                                                .replace(/&/g, '&amp;')
                                                .replace(/</g, '&lt;')
                                                .replace(/>/g, '&gt;');

                                            // 1. Tags OnlyOffice
                                            var withOO = safe.replace(/oo:(\d+):([^<,\n\r]+)/g, function (match, fileId, fileName) {
                                                fileName = fileName.trim();
                                                var ext = fileName.split('.').pop().toLowerCase();
                                                var iconClass = 'fa-file-alt';
                                                var btnStyle = 'btn-outline-primary';
                                                if (['xls', 'xlsx', 'ods', 'csv'].indexOf(ext) >= 0) { iconClass = 'fa-file-excel'; btnStyle = 'btn-outline-success'; }
                                                else if (['ppt', 'pptx', 'odp'].indexOf(ext) >= 0) { iconClass = 'fa-file-powerpoint'; btnStyle = 'btn-outline-warning'; }
                                                else if (['doc', 'docx', 'odt', 'txt'].indexOf(ext) >= 0) { iconClass = 'fa-file-word'; btnStyle = 'btn-outline-primary'; }
                                                else if (ext === 'pdf') { iconClass = 'fa-file-pdf'; btnStyle = 'btn-outline-danger'; } else if (['eml', 'msg'].indexOf(ext) >= 0) { iconClass = 'fa-envelope'; btnStyle = 'btn-outline-info'; }

                                                return '<a href="javascript:void(0)" onclick="if(typeof opOpenOOFile===\'function\'){opOpenOOFile(' + fileId + ',\'' + fileName.replace(/'/g, "\\'") + '\');}else if(typeof OfficePlatform!==\'undefined\'){OfficePlatform.openEditor({fileId:' + fileId + '});}" class="btn btn-sm ' + btnStyle + ' oo-formatted" style="margin:2px 4px; font-weight:600; text-transform:none; text-decoration:none; display:inline-flex; align-items:center; gap:4px;" title="Abrir en OnlyOffice"><i class="far ' + iconClass + ' mr-1"></i> ' + fileName + '</a>';
                                            });

                                            // 2. URLs / Hipervínculos Web con Tarjeta de Previsualización Ejecutiva
                                            var withLinks = withOO.replace(/(https?:\/\/[^\s<"']+)/gi, function (match, url) {
                                                var domain = 'Sitio Web Externo';
                                                try { domain = (new URL(url)).hostname; } catch (e) { }
                                                return '<div class="op-rich-link-card my-2 p-2 border rounded d-flex align-items-center justify-content-between flex-wrap gap-2" style="background:#f0f9ff; border:1px solid #0284c7 !important; border-radius:8px; width:100%; box-shadow:0 1px 3px rgba(0,0,0,0.03);">'
                                                    + '  <div class="d-flex align-items-center gap-2 text-truncate" style="max-width:80%;">'
                                                    + '    <i class="fas fa-globe text-primary fa-lg mr-1"></i>'
                                                    + '    <div class="text-truncate">'
                                                    + '      <span class="font-weight-bold text-dark d-block text-truncate" style="font-size:11.5px;"><i class="fas fa-external-link-alt text-muted mr-1" style="font-size:9px;"></i>' + domain + '</span>'
                                                    + '      <a href="' + url + '" target="_blank" rel="noopener noreferrer" class="op-link-formatted text-primary text-truncate d-block" style="text-decoration:underline; font-size:11px;" title="' + url + '">' + url + '</a>'
                                                    + '    </div>'
                                                    + '  </div>'
                                                    + '  <a href="' + url + '" target="_blank" rel="noopener noreferrer" class="btn btn-xs btn-outline-primary font-weight-bold px-2 py-1" style="font-size:10.5px; text-decoration:none; white-space:nowrap;"><i class="fas fa-arrow-up-right-from-square mr-1"></i> Abrir</a>'
                                                    + '</div>';
                                            });

                                            return withLinks.replace(/\n/g, '<br>');
                                        };

                                        // ═══════════════════════════════════════════════════════════════
                                        // AUTOMATIC DOM SCANNER
                                        // Convierte cualquier texto tipo oo:129:Archivo.xlsx o URLs
                                        // en botones estéticos y enlaces activos al hacer clic.
                                        // ═══════════════════════════════════════════════════════════════
                                        function ooFormatTextNodes() {
                                            var walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
                                            var node;
                                            var nodesToReplace = [];
                                            while (node = walker.nextNode()) {
                                                if (node.nodeValue && (node.nodeValue.indexOf('oo:') !== -1 || /https?:\/\//i.test(node.nodeValue))) {
                                                    var parent = node.parentNode;
                                                    if (parent && !parent.closest('script, style, textarea, input, .oo-toolbar, .oo-formatted, .op-link-formatted, a')) {
                                                        nodesToReplace.push(node);
                                                    }
                                                }
                                            }
                                            nodesToReplace.forEach(function (n) {
                                                var val = n.nodeValue;
                                                var replaced = val.replace(/oo:(\d+):([^<,\n\r]+)/g, function (match, fileId, fileName) {
                                                    fileName = fileName.trim();
                                                    var ext = fileName.split('.').pop().toLowerCase();
                                                    var iconClass = 'fa-file-alt';
                                                    var btnStyle = 'btn-outline-primary';
                                                    if (['xls', 'xlsx', 'ods', 'csv'].indexOf(ext) >= 0) { iconClass = 'fa-file-excel'; btnStyle = 'btn-outline-success'; }
                                                    else if (['ppt', 'pptx', 'odp'].indexOf(ext) >= 0) { iconClass = 'fa-file-powerpoint'; btnStyle = 'btn-outline-warning'; }
                                                    else if (['doc', 'docx', 'odt', 'txt'].indexOf(ext) >= 0) { iconClass = 'fa-file-word'; btnStyle = 'btn-outline-primary'; }
                                                    else if (ext === 'pdf') { iconClass = 'fa-file-pdf'; btnStyle = 'btn-outline-danger'; } else if (['eml', 'msg'].indexOf(ext) >= 0) { iconClass = 'fa-envelope'; btnStyle = 'btn-outline-info'; }

                                                    return '<a href="javascript:void(0)" onclick="if(typeof opOpenOOFile===\'function\'){opOpenOOFile(' + fileId + ',\'' + fileName.replace(/'/g, "\\'") + '\');}else if(typeof OfficePlatform!==\'undefined\'){OfficePlatform.openEditor({fileId:' + fileId + '});}" class="btn btn-sm ' + btnStyle + ' oo-formatted" style="margin:2px 4px; font-weight:600; text-transform:none;" title="Abrir en OnlyOffice"><i class="far ' + iconClass + ' mr-1"></i> ' + fileName + '</a>';
                                                });

                                                replaced = replaced.replace(/(https?:\/\/[^\s<"']+)/gi, function (match, url) {
                                                    return '<a href="' + url + '" target="_blank" rel="noopener noreferrer" class="op-link-formatted font-weight-bold text-primary" style="text-decoration:underline; word-break:break-all; margin:0 2px;"><i class="fas fa-external-link-alt mr-1" style="font-size:10px;"></i>' + url + '</a>';
                                                });

                                                if (replaced !== val) {
                                                    var span = document.createElement('span');
                                                    span.className = 'oo-span-formatted';
                                                    span.innerHTML = replaced;
                                                    n.parentNode.replaceChild(span, n);
                                                }
                                            });
                                        }

                                        // ═══════════════════════════════════════════════════════════════
                                        // ENTERPRISE WORKSPACE ENGINE (FASE 7) — STATE PERSISTENCE & DRAWER
                                        // ═══════════════════════════════════════════════════════════════
                                        (function initEnterpriseWorkspace() {
                                            var STORAGE_KEY_TAB = 'op_active_tab_';
                                            var STORAGE_KEY_SCROLL = 'op_scroll_pos_';
                                            var STORAGE_KEY_PHASES = 'op_expanded_phases_';
                                            var projectId = (new URLSearchParams(window.location.search)).get('ipy') || 'global';

                                            // 1. Guardar y Restaurar Estado de Scroll
                                            window.addEventListener('beforeunload', function () {
                                                sessionStorage.setItem(STORAGE_KEY_SCROLL + projectId, window.scrollY || document.documentElement.scrollTop);
                                            });

                                            document.addEventListener('DOMContentLoaded', function () {
                                                // Restaurar Scroll
                                                var savedScroll = sessionStorage.getItem(STORAGE_KEY_SCROLL + projectId);
                                                if (savedScroll !== null) {
                                                    setTimeout(function () { window.scrollTo(0, parseInt(savedScroll, 10)); }, 100);
                                                }

                                                // Restaurar Tab Activo de Numerales ISO
                                                var savedTab = sessionStorage.getItem(STORAGE_KEY_TAB + projectId);
                                                if (savedTab) {
                                                    var targetTab = document.querySelector('a[href="' + savedTab + '"]');
                                                    if (targetTab && typeof $(targetTab).tab === 'function') {
                                                        $(targetTab).tab('show');
                                                    }
                                                }

                                                // Guardar Tab Activo al hacer clic
                                                document.addEventListener('click', function (e) {
                                                    var tabLink = e.target.closest('a[data-toggle="tab"]');
                                                    if (tabLink) {
                                                        var href = tabLink.getAttribute('href');
                                                        if (href) {
                                                            sessionStorage.setItem(STORAGE_KEY_TAB + projectId, href);
                                                        }
                                                    }
                                                });

                                            });
                                        })();

                                        if (document.readyState === 'loading') {
                                            document.addEventListener('DOMContentLoaded', function () {
                                                ooFormatTextNodes();
                                                setInterval(ooFormatTextNodes, 800);
                                            });
                                        } else {
                                            ooFormatTextNodes();
                                            setInterval(ooFormatTextNodes, 800);
                                        }
                                    })();
                        </script>
                        <!-- ═══════════════════════════════════════════════════════════════
         SPRINT 4: PERSISTENCIA DE CONTEXTO DE TRABAJO
         Elimina la pérdida de scroll, tab activo y acordeones
         después de cada guardado/recarga del Servlet.
         ═══════════════════════════════════════════════════════════════ -->
                        <script>
                                    (function () {
                                        'use strict';

                                        var STORAGE_PREFIX = 'op_ctx_';
                                        var currentPage = window.location.pathname + window.location.search.split('&TempM=')[0];

                                        // --- RESTAURAR CONTEXTO AL CARGAR ---
                                        function restoreContext() {
                                            var savedPage = sessionStorage.getItem(STORAGE_PREFIX + 'page');
                                            if (savedPage !== currentPage) return; // Solo restaurar si es la misma vista

                                            // 1. Restaurar scroll vertical
                                            var savedScroll = sessionStorage.getItem(STORAGE_PREFIX + 'scrollY');
                                            if (savedScroll) {
                                                window.scrollTo(0, parseInt(savedScroll, 10));
                                            }

                                            // 2. Restaurar tab activo (#myTab5)
                                            var savedTab = sessionStorage.getItem(STORAGE_PREFIX + 'activeTab');
                                            if (savedTab && typeof $ !== 'undefined') {
                                                try {
                                                    var tabLink = document.querySelector('a[href="' + savedTab + '"]');
                                                    if (tabLink) {
                                                        $(tabLink).tab('show');
                                                    }
                                                } catch (e) { /* Bootstrap tab no disponible */ }
                                            }

                                            // 3. Restaurar collapses expandidos
                                            var savedCollapses = sessionStorage.getItem(STORAGE_PREFIX + 'collapses');
                                            if (savedCollapses && typeof $ !== 'undefined') {
                                                try {
                                                    var ids = JSON.parse(savedCollapses);
                                                    for (var i = 0; i < ids.length; i++) {
                                                        var el = document.getElementById(ids[i]);
                                                        if (el) {
                                                            $(el).collapse('show');
                                                        }
                                                    }
                                                } catch (e) { /* JSON parse error */ }
                                            }

                                            // Limpiar después de restaurar (single-use)
                                            sessionStorage.removeItem(STORAGE_PREFIX + 'scrollY');
                                            sessionStorage.removeItem(STORAGE_PREFIX + 'activeTab');
                                            sessionStorage.removeItem(STORAGE_PREFIX + 'collapses');
                                        }

                                        // --- GUARDAR CONTEXTO ANTES DE NAVEGAR ---
                                        function saveContext() {
                                            sessionStorage.setItem(STORAGE_PREFIX + 'page', currentPage);

                                            // 1. Guardar scroll vertical
                                            sessionStorage.setItem(STORAGE_PREFIX + 'scrollY', window.scrollY || window.pageYOffset || 0);

                                            // 2. Guardar tab activo
                                            var activeTab = document.querySelector('#myTab5 .nav-link.active, .nav-tabs .nav-link.active');
                                            if (activeTab && activeTab.getAttribute('href')) {
                                                sessionStorage.setItem(STORAGE_PREFIX + 'activeTab', activeTab.getAttribute('href'));
                                            }

                                            // 3. Guardar collapses expandidos
                                            var openCollapses = document.querySelectorAll('.collapse.show');
                                            var collapseIds = [];
                                            for (var i = 0; i < openCollapses.length; i++) {
                                                if (openCollapses[i].id) {
                                                    collapseIds.push(openCollapses[i].id);
                                                }
                                            }
                                            if (collapseIds.length > 0) {
                                                sessionStorage.setItem(STORAGE_PREFIX + 'collapses', JSON.stringify(collapseIds));
                                            }
                                        }

                                        // Guardar antes de cualquier submit de formulario
                                        document.addEventListener('submit', saveContext, true);

                                        // Guardar antes de navegación por links (href a Servlets)
                                        document.addEventListener('click', function (e) {
                                            var link = e.target.closest ? e.target.closest('a[href*="Proyecto?"]') : null;
                                            if (!link) {
                                                // Fallback para IE/legacy
                                                var el = e.target;
                                                while (el && el.tagName !== 'A') { el = el.parentElement; }
                                                if (el && el.href && el.href.indexOf('Proyecto?') !== -1) {
                                                    link = el;
                                                }
                                            }
                                            if (link) {
                                                saveContext();
                                            }
                                        }, true);

                                        // Guardar antes de unload (cubre redirects)
                                        window.addEventListener('beforeunload', saveContext);

                                        // --- SPRINT 5: APERTURA TOTAL Y PERMANENTE DE SECCIONES ISO (MutationObserver) ---
                                        // Utiliza MutationObserver para detectar cualquier cambio en el DOM
                                        // (ej: Bootstrap re-colapsando al cambiar de tab) y forzar reapertura inmediata.
                                        function opForceExpandAll(root) {
                                            var container = root || document.getElementById('Formulario') || document.querySelector('.main-content');
                                            if (!container) return;

                                            // 1. Abrir todos los .collapse de Bootstrap (tabs 7.3.2, 7.3.3, etc.)
                                            var collapses = container.querySelectorAll('.collapse:not(.show)');
                                            for (var i = 0; i < collapses.length; i++) {
                                                var col = collapses[i];
                                                // NO tocar Ventana* — son modales que deben estar cerrados por defecto
                                                if (!col.id || col.id.indexOf('Ventana') !== 0) {
                                                    col.classList.add('show');
                                                    col.style.display = 'block';
                                                    col.style.height = 'auto';
                                                    col.style.overflow = 'visible';
                                                }
                                            }

                                            // 2. Quitar op-activity-collapsed de cualquier tabla que lo tenga
                                            var collapsed = container.querySelectorAll('.op-activity-collapsed');
                                            for (var j = 0; j < collapsed.length; j++) {
                                                collapsed[j].classList.remove('op-activity-collapsed');
                                            }

                                            // 3. Desbloquear filas ocultas (display:none inline)
                                            var hiddenRows = container.querySelectorAll('tr[style*="display: none"], tr[style*="display:none"]');
                                            for (var r = 0; r < hiddenRows.length; r++) {
                                                hiddenRows[r].removeAttribute('style');
                                            }
                                        }

                                        // Ejecutar al cargar la página
                                        document.addEventListener('DOMContentLoaded', function () { opForceExpandAll(); });
                                        window.addEventListener('load', function () { opForceExpandAll(); });

                                        // MutationObserver: reacciona a cualquier cambio de clase en el DOM
                                        // (ej: Bootstrap agrega/quita .show cuando el usuario cambia de tab)
                                        var opExpandObserver = new MutationObserver(function (mutations) {
                                            var needsExpand = false;
                                            for (var i = 0; i < mutations.length; i++) {
                                                var m = mutations[i];
                                                if (m.type === 'attributes' && m.attributeName === 'class') {
                                                    var el = m.target;
                                                    // Si un .collapse perdió su clase .show, re-expandir
                                                    if (el.classList.contains('collapse') && !el.classList.contains('show')) {
                                                        if (!el.id || el.id.indexOf('Ventana') !== 0) {
                                                            needsExpand = true;
                                                            break;
                                                        }
                                                    }
                                                }
                                            }
                                            if (needsExpand) {
                                                setTimeout(opForceExpandAll, 30);
                                            }
                                        });

                                        // Arrancar el observer sobre todo el body una vez cargado
                                        window.addEventListener('load', function () {
                                            opExpandObserver.observe(document.body, {
                                                attributes: true,
                                                attributeFilter: ['class'],
                                                subtree: true
                                            });
                                        });

                                        // --- SPRINT 6: STICKY HEADER DE PROYECTO ISO ---
                                        // Detecta la cabecera DHF por su texto (CONSECUTIVO) — el backend
                                        // está congelado y el .card-header no tiene id único — y le aplica
                                        // la clase .op-sticky-header. Progressive enhancement puro: sin POST,
                                        // sin AJAX, sin alterar el DOM legacy.
                                        function opInitStickyHeader() {
                                            var headers = document.querySelectorAll('.main-content .card-header');
                                            for (var i = 0; i < headers.length; i++) {
                                                var h = headers[i];
                                                var txt = (h.textContent || h.innerText || '').toUpperCase();
                                                if (txt.indexOf('CONSECUTIVO') !== -1) {
                                                    h.classList.add('op-sticky-header');
                                                    break; // solo hay un header DHF por vista
                                                }
                                            }
                                        }

                                        // --- SPRINT 9: ADVANCED CROSS-SECTION SPLIT VIEW, CONTINUOUS DOC & MULTI-STAGE WIZARD ---
                                        var _opPlaceholders = [];
                                        var _opActiveActivityIndex = null;
                                        var _opActivitiesList = [];

                                        // Deteccion DUAL de editabilidad: el listado legacy SIEMPRE genera la URL con
                                        // estadoM=1, incluso para proyectos TERMINADO/FINALIZADO. Por eso cruzamos el
                                        // parametro de URL con el ESTADO real leido de la cabecera Plastitec del DOM;
                                        // si el proyecto esta cerrado, NO es editable aunque la URL diga estadoM=1.
                                        window.opDetectProjectClosed = function () {
                                            try {
                                                var candidates = document.querySelectorAll('.card-header table, #Formulario table');
                                                var headerTxt = '';
                                                for (var i = 0; i < candidates.length; i++) {
                                                    var tt = candidates[i].innerText || candidates[i].textContent || '';
                                                    if (/CONSECUTIVO|MEMORIAS DE DISE|DOCUMENTO CONFIDENCIAL/i.test(tt) && /ESTADO/i.test(tt)) { headerTxt = tt; break; }
                                                }
                                                if (!headerTxt) return false; // sin cabecera identificable -> no forzar cierre (cae al gate de URL)
                                                var m = headerTxt.match(/ESTADO\s*:?\s*([A-ZÁÉÍÓÚÑ ]{2,25})/i);
                                                if (m) {
                                                    var v = m[1].toUpperCase();
                                                    if (/TERMINAD|FINALIZAD|CERRAD/.test(v)) return true;   // proyecto cerrado
                                                    if (/PROCESO|ABIERT|ACTIV|CURSO|REVISION/.test(v)) return false; // en curso
                                                }
                                                return /\b(TERMINAD[OA]|FINALIZAD[OA])\b/.test(headerTxt);
                                            } catch (e) { return false; }
                                        };

                                        function opInitSplitScreen() {
                                            var isDHFPage = (
                                                window.location.search.indexOf('opc=7') !== -1 ||
                                                window.location.search.indexOf('opc=14') !== -1 ||
                                                window.location.search.indexOf('opc=18') !== -1 ||
                                                window.location.pathname.indexOf('Memorias') !== -1 ||
                                                window.location.pathname.indexOf('Entradas') !== -1 ||
                                                window.location.pathname.indexOf('Pruebas') !== -1
                                            ) && (document.title.toLowerCase().indexOf('memorias') !== -1 || document.title.toLowerCase().indexOf('entradas') !== -1 || window.location.search.indexOf('ipy=') !== -1);

                                            if (!isDHFPage) return;

                                            var mainCard = document.querySelector('.main-content .card') || document.querySelector('.card');
                                            var cardBody = mainCard ? (mainCard.querySelector('.card-body') || mainCard) : (document.getElementById('Formulario') || document.querySelector('.main-content') || document.body);
                                            if (!cardBody) return;

                                            // Cleanup existing workspace if present
                                            var existingWorkspace = document.getElementById('op-split-workspace');
                                            if (existingWorkspace) {
                                                existingWorkspace.remove();
                                                _opPlaceholders.forEach(function (pl) { if (pl) pl.remove(); });
                                                _opPlaceholders = [];
                                                _opActiveActivityIndex = null;
                                            }

                                            // Detect sections and gather activities grouped by section
                                            var activityElements = [];
                                            var sections = []; // [{ id, title, activities: [{ element, title, globalIndex }] }]

                                            var tabPanes = cardBody.querySelectorAll('.tab-pane');

                                            if (tabPanes.length > 0) {
                                                for (var t = 0; t < tabPanes.length; t++) {
                                                    var pane = tabPanes[t];
                                                    var paneId = pane.id || ('section_' + t);
                                                    var tabLink = document.querySelector('a[href="#' + paneId + '"]') || document.querySelector('a[data-target="#' + paneId + '"]');
                                                    var sectionTitle = tabLink ? (tabLink.textContent || tabLink.innerText || '').trim() : ('Etapa ISO ' + (t + 1));
                                                    sectionTitle = sectionTitle.replace(/DEBERES DE ISO.*/i, '').trim();

                                                    var paneTables = pane.querySelectorAll('table.table-bordered');
                                                    var secActivities = [];

                                                    for (var i = 0; i < paneTables.length; i++) {
                                                        var elem = paneTables[i];
                                                        if (elem.closest('.card-header') || elem.id === 'op-view-toolbar' || elem.querySelector('img') || elem.classList.contains('op-wiz-stage-table')) continue;
                                                        var textContent = (elem.textContent || elem.innerText || '').trim();
                                                        if (textContent.indexOf('AUTOR:') !== -1 || textContent.indexOf('ACTIVIDAD') !== -1 || textContent.indexOf('ESTADO:') !== -1 || textContent.indexOf('RESPUESTAS') !== -1) {
                                                            var globalIndex = activityElements.length;
                                                            activityElements.push(elem);

                                                            var actTitle = 'Actividad DHF ' + (activityElements.length);
                                                            // FIX G6: el textContent de la <table> concatena celdas sin separador → el
                                                            // titulo arrastraba "Historial de cambios / Cambiar numeral / RESPUESTAS".
                                                            // Leemos celda por celda: preferimos la del texto de la actividad ("ACTIVIDAD N:").
                                                            var _opCells = elem.querySelectorAll('td, th');
                                                            for (var _oc = 0; _oc < _opCells.length; _oc++) {
                                                                var _oct = (_opCells[_oc].textContent || '').replace(/\s+/g, ' ').trim();
                                                                if (/^ACTIVIDAD\s*\d*\s*:/i.test(_oct)) { actTitle = _oct.substring(0, 80); break; }
                                                            }
                                                            if (actTitle.indexOf('Actividad DHF') === 0) {
                                                                var _opTh = elem.querySelector('th');
                                                                if (_opTh) { var _tht = (_opTh.textContent || '').replace(/\s+/g, ' ').trim(); if (_tht) actTitle = _tht.substring(0, 80); }
                                                            }

                                                            secActivities.push({
                                                                element: elem,
                                                                title: actTitle,
                                                                globalIndex: globalIndex,
                                                                sectionTitle: sectionTitle
                                                            });
                                                        }
                                                    }

                                                    if (secActivities.length > 0) {
                                                        sections.push({
                                                            id: paneId,
                                                            title: sectionTitle,
                                                            activities: secActivities
                                                        });
                                                    }
                                                }
                                            }

                                            // Fallback if no tab panes found or empty tab panes
                                            if (sections.length === 0) {
                                                var allTables = cardBody.querySelectorAll('table.table-bordered');
                                                var currentSec = null;

                                                for (var i = 0; i < allTables.length; i++) {
                                                    var elem = allTables[i];
                                                    if (elem.closest('.card-header') || elem.id === 'op-view-toolbar' || elem.querySelector('img') || elem.classList.contains('op-wiz-stage-table')) continue;
                                                    var textContent = (elem.textContent || elem.innerText || '').trim();
                                                    if (textContent.indexOf('AUTOR:') === -1 && textContent.indexOf('ACTIVIDAD') === -1 && textContent.indexOf('ESTADO:') === -1 && textContent.indexOf('RESPUESTAS') === -1) continue;

                                                    // Detect real section name from table headers (e.g., 7.3.1, 7.3.2, etc.)
                                                    var secHeader = elem.querySelector('th[style*="dfe1e1"], th[style*="aliceblue"], th[colspan="5"], th[colspan="4"]');
                                                    var secName = secHeader ? (secHeader.textContent || '').trim() : '';
                                                    if (!secName) {
                                                        var mSec = textContent.match(/7\.3[\.\d]*\s*[^<>\n\r]{3,80}/i);
                                                        if (mSec) secName = mSec[0].trim();
                                                    }
                                                    if (!secName && currentSec) secName = currentSec.title;
                                                    if (!secName) secName = '7.3 DISEÑO Y DESARROLLO';

                                                    if (!currentSec || currentSec.title !== secName) {
                                                        currentSec = {
                                                            id: 'sec_' + sections.length,
                                                            title: secName,
                                                            activities: []
                                                        };
                                                        sections.push(currentSec);
                                                    }

                                                    var globalIndex = activityElements.length;
                                                    activityElements.push(elem);

                                                    var actTitle = 'Actividad DHF ' + (activityElements.length);
                                                    // FIX G6: el textContent de la <table> concatena celdas sin separador → el
                                                    // titulo arrastraba "Historial de cambios / Cambiar numeral / RESPUESTAS".
                                                    // Leemos celda por celda: preferimos la del texto de la actividad ("ACTIVIDAD N:").
                                                    var _opCells = elem.querySelectorAll('td, th');
                                                    for (var _oc = 0; _oc < _opCells.length; _oc++) {
                                                        var _oct = (_opCells[_oc].textContent || '').replace(/\s+/g, ' ').trim();
                                                        if (/^ACTIVIDAD\s*\d*\s*:/i.test(_oct)) { actTitle = _oct.substring(0, 80); break; }
                                                    }
                                                    if (actTitle.indexOf('Actividad DHF') === 0) {
                                                        var _opTh = elem.querySelector('th');
                                                        if (_opTh) { var _tht = (_opTh.textContent || '').replace(/\s+/g, ' ').trim(); if (_tht) actTitle = _tht.substring(0, 80); }
                                                    }

                                                    currentSec.activities.push({
                                                        element: elem,
                                                        title: actTitle,
                                                        globalIndex: globalIndex,
                                                        sectionTitle: secName
                                                    });
                                                }
                                            }

                                            if (activityElements.length === 0) return;

                                            // Create placeholders for DOM movement
                                            for (var j = 0; j < activityElements.length; j++) {
                                                var el = activityElements[j];
                                                var placeholder = document.createElement('div');
                                                placeholder.id = 'op-placeholder-' + j;
                                                placeholder.style.display = 'none';
                                                el.parentNode.insertBefore(placeholder, el);
                                                _opPlaceholders.push(placeholder);
                                            }

                                            // Build flat metadata array for lookup
                                            _opActivitiesList = [];
                                            sections.forEach(function (sec) {
                                                sec.activities.forEach(function (act) {
                                                    _opActivitiesList[act.globalIndex] = act;
                                                });
                                            });

                                            // Insert enterprise view mode toolbar
                                            var existingToolbar = document.getElementById('op-view-toolbar');
                                            if (existingToolbar) existingToolbar.remove();

                                            var urlParams = new URLSearchParams(window.location.search);
                                            var estadoM = urlParams.get('estadoM') || '1';
                                            // Deteccion dual: URL estadoM=1 Y el proyecto NO cerrado en la cabecera del DOM.
                                            var isEditable = (estadoM === '1') && !window.opDetectProjectClosed();

                                            var toolbar = document.createElement('div');
                                            toolbar.id = 'op-view-toolbar';
                                            toolbar.className = 'op-view-toolbar mb-4 d-flex align-items-center justify-content-between flex-wrap gap-2';
                                            toolbar.style.cssText = 'background: #ffffff !important; padding: 12px 20px !important; border-radius: 10px !important; border: 1px solid var(--op-border-strong) !important; box-shadow: 0 4px 12px rgba(0,0,0,0.05) !important; margin-bottom: 24px !important; width: 100% !important; display: flex !important; justify-content: space-between !important; align-items: center !important; position: relative !important; z-index: 10 !important;';

                                            var toolbarActionsHtml = '<button type="button" class="btn btn-sm btn-outline-danger font-weight-bold mr-1" id="op-btn-export-pdf" onclick="opExportFullDocPDF();" title="Descargar Memoria de Diseño completa en PDF"><i class="fas fa-file-pdf mr-1"></i> Descargar Memoria (PDF)</button>';
                                            if (isEditable) {
                                                toolbarActionsHtml += '  <button type="button" class="op-action-tertiary" id="op-btn-batch-modal" onclick="if(typeof opShowBatchCreationModal===\'function\')opShowBatchCreationModal();"><i class="fas fa-bolt mr-1"></i> Cargue masivo</button>'
                                                    + '  <button type="button" class="op-action-primary" id="op-btn-save-all" onclick="alert(\'Memoria guardada correctamente.\');"><i class="fas fa-save mr-1"></i> Guardar memoria</button>';
                                            } else {
                                                toolbarActionsHtml += '  <span class="badge badge-danger font-weight-bold px-3 py-2" style="font-size:12px;"><i class="fas fa-lock mr-1"></i> Memoria Finalizada (Solo Lectura)</span>';
                                            }

                                            var segControlHtml = '';
                                            if (isEditable) {
                                                segControlHtml = '<div class="op-seg-control" role="group">'
                                                    + '  <button type="button" class="op-seg-btn op-active" id="op-btn-split" title="Modo Gestión Dividida (Estilo IDE / Notion)"><i class="fas fa-bolt mr-1 text-warning"></i> Modo Gestión</button>'
                                                    + '  <button type="button" class="op-seg-btn" id="op-btn-full-doc" title="Previsualizador Ejecutivo de Documento Continuo"><i class="fas fa-file-alt mr-1"></i> Previsualizador</button>'
                                                    + '</div>';
                                            } else {
                                                // P2: memoria finalizada -> SIN control segmentado. Titulo estatico, vista bloqueada en Previsualizador.
                                                segControlHtml = '<div class="op-seg-static" style="display:inline-flex; align-items:center; gap:8px; font-weight:700; color:#0f172a; font-size:14px;">'
                                                    + '  <i class="fas fa-file-alt text-secondary mr-1"></i> Previsualizador Ejecutivo (Solo Lectura)'
                                                    + '</div>';
                                            }

                                            toolbar.innerHTML = ''
                                                + segControlHtml
                                                + '<div class="op-toolbar-actions d-flex align-items-center gap-2">'
                                                + '  ' + toolbarActionsHtml
                                                + '</div>';

                                            // FIX (re-aplicado): montar el toolbar como hijo DIRECTO de #Formulario,
                                            // no de cardBody. Si va en cardBody queda dentro del .row legacy, y la regla
                                            // body.op-split-mode #Formulario > *:not(#op-view-toolbar) oculta ese .row y
                                            // colapsa toda la vista a 0x0 (pantalla en blanco). Ver commit 0eba4e7.
                                            var _opFormRoot = document.getElementById('Formulario') || cardBody;
                                            _opFormRoot.insertBefore(toolbar, _opFormRoot.firstChild);

                                            // Create workspace split-screen container
                                            var workspace = document.createElement('div');
                                            workspace.className = 'op-split-workspace';
                                            workspace.id = 'op-split-workspace';
                                            workspace.style.cssText = 'display:none; gap:20px; width:100%; min-height:650px; align-items:flex-start;';

                                            // Master Panel (Hierarchical Tree Sidebar)
                                            var masterPanel = document.createElement('div');
                                            masterPanel.className = 'op-master-panel';
                                            masterPanel.id = 'op-master-panel';
                                            masterPanel.style.cssText = 'width:340px; min-width:300px; background:#f8fafc; border:1px solid var(--op-border-strong); border-radius:10px; padding:12px; box-shadow:0 2px 8px rgba(0,0,0,0.04); height:auto; max-height:82vh; overflow-y:auto; position:sticky; top:20px;';

                                            // EJE G: contar finalizadas para la barra de progreso del índice
                                            var _opFinalized = 0;
                                            for (var _fi = 0; _fi < activityElements.length; _fi++) {
                                                if (activityElements[_fi].querySelector('.text-success')) _opFinalized++;
                                            }
                                            var _opPct = activityElements.length ? Math.round(_opFinalized * 100 / activityElements.length) : 0;
                                            var masterHeader = document.createElement('div');
                                            masterHeader.className = 'op-master-header mb-3 pb-2 border-bottom';
                                            masterHeader.innerHTML = '<h6 class="m-0 font-weight-bold text-primary" style="font-size:13px;"><i class="fas fa-project-diagram mr-1"></i> Índice DHF ISO 13485</h6>'
                                                + '<div class="op-progress-wrap"><div class="op-progress-bar" style="width:' + _opPct + '%;"></div></div>'
                                                + '<div class="op-progress-label">' + _opFinalized + ' / ' + activityElements.length + ' actividades terminadas</div>';
                                            masterPanel.appendChild(masterHeader);

                                            // Render Sections Tree in Master Panel (Etapas desplegadas de forma clara y directa)
                                            sections.forEach(function (sec, secIdx) {
                                                var secCard = document.createElement('div');
                                                secCard.className = 'op-tree-section';
                                                secCard.style.cssText = 'background:#ffffff; border:1px solid #e2e8f0; border-radius:8px; margin-bottom:8px; overflow:hidden; transition:all 0.15s; box-shadow:0 1px 3px rgba(0,0,0,0.02);';

                                                var header = document.createElement('div');
                                                header.className = 'op-tree-section-header';
                                                header.style.cssText = 'padding:10px 12px; display:flex; align-items:center; justify-content:space-between; cursor:pointer; font-size:11.5px; font-weight:700; color:#1e293b; user-select:none; background:#f1f5f9;';
                                                header.innerHTML = '<span class="text-truncate" style="max-width:215px;" title="' + sec.title + '"><i class="fas fa-folder text-warning mr-2" style="color:#f59e0b;"></i> ' + sec.title + '</span>'
                                                    + '<span class="badge badge-secondary" style="font-size:10px; font-weight:700; padding:3px 7px; border-radius:6px;">' + sec.activities.length + '</span>';

                                                var secBody = document.createElement('div');
                                                secBody.className = 'op-tree-section-body';
                                                secBody.style.cssText = 'padding:6px 8px; background:#ffffff; border-top:1px solid #e2e8f0;';

                                                header.onclick = function () {
                                                    var isCollapsed = secCard.classList.toggle('collapsed');
                                                    if (!isCollapsed && sec.activities.length > 0) {
                                                        opShowActivityDetail(sec.activities[0].globalIndex, activityElements, detailPanel, masterPanel);
                                                    }
                                                };

                                                sec.activities.forEach(function (act) {
                                                    var card = document.createElement('div');
                                                    card.className = 'op-activity-card p-2 mb-1';
                                                    card.setAttribute('data-activity-index', act.globalIndex);
                                                    card.style.cssText = 'background:#f8fafc; border:1px solid #e2e8f0; border-radius:6px; cursor:pointer; font-size:11.5px; font-weight:600; color:#334155; transition:all 0.15s; margin-left:4px;';

                                                    var _stTok = 'muted', _stLbl = 'Sin iniciar';
                                                    if (window.opNodeFinalizedFromCache && window.opNodeFinalizedFromCache(act.globalIndex)) { _stTok = 'finalizado'; _stLbl = 'Terminada'; }
                                                    else if (act.element.querySelector('.text-success')) { _stTok = 'finalizado'; _stLbl = 'Terminada'; }
                                                    else if (act.element.querySelector('.text-warning')) { _stTok = 'revision'; _stLbl = 'En revisión'; }
                                                    else if (/EN PROCESO|PROCESO/i.test(act.element.textContent || '')) { _stTok = 'proceso'; _stLbl = 'En proceso'; }
                                                    card.setAttribute('title', act.title + ' — ' + _stLbl);
                                                    card.innerHTML = '<span class="op-status-dot" style="background:var(--op-status-' + _stTok + '-dot, var(--op-text-muted));"></span>'
                                                        + '<span class="op-activity-card-title">' + act.title + '</span>';
                                                    secBody.appendChild(card);
                                                });

                                                secCard.appendChild(header);
                                                secCard.appendChild(secBody);
                                                masterPanel.appendChild(secCard);
                                            });

                                            // Detail Panel
                                            var detailPanel = document.createElement('div');
                                            detailPanel.className = 'op-detail-panel';
                                            detailPanel.id = 'op-detail-panel';
                                            detailPanel.style.cssText = 'flex:1; background:#ffffff; border:1px solid var(--op-border-strong); border-radius:10px; padding:24px; box-shadow:0 4px 16px rgba(0,0,0,0.06); min-height:650px;';
                                            detailPanel.innerHTML = '<div class="text-center p-5 text-muted"><i class="fas fa-hand-pointer fa-2x mb-2"></i><p>Selecciona una sección del índice para ver y editar su contenido completo.</p></div>';

                                            workspace.appendChild(masterPanel);
                                            workspace.appendChild(detailPanel);

                                            // FIX (re-aplicado): workspace como hijo DIRECTO de #Formulario (no cardBody),
                                            // para que la regla de ocultamiento en split lo proteja via :not(#op-split-workspace)
                                            // y su ancestro .row no lo colapse a 0x0. Ver commit 0eba4e7.
                                            (document.getElementById('Formulario') || cardBody).appendChild(workspace);

                                            // Default a Modo Gestión (Split View) si es editable, o Previsualizador si está finalizado
                                            var currentMode = isEditable ? 'split' : 'full';

                                            // Renderizar Previsualizador de Documento Continuo Ejecutivo Limpio
                                            window.opRenderExecutivePreviewDocument = function () {
                                                // Estado GLOBAL de la memoria: si esta TERMINADO/FINALIZADO, ninguna actividad puede
                                                // quedar "EN PROCESO" (decision de negocio autorizada). Se usa como fallback cuando
                                                // Tag_memoria omite el marcador <b class="text-success"> de una actividad sin respuesta.
                                                var _opPreviewMemFin = (typeof window.opDetectProjectClosed === 'function') ? !!window.opDetectProjectClosed() : false;
                                                var existingPreview = document.getElementById('op-continuous-preview-container');
                                                if (existingPreview) existingPreview.remove();

                                                var previewContainer = document.createElement('div');
                                                previewContainer.id = 'op-continuous-preview-container';
                                                previewContainer.className = 'op-continuous-preview-container';
                                                previewContainer.style.cssText = 'background:#ffffff; border:1px solid var(--op-border-strong); border-radius:12px; padding:24px 30px; box-shadow:0 4px 20px rgba(0,0,0,0.06); width:100%; margin-top:15px;';

                                                // 1. Cabecera Plastitec Oficial limpia
                                                var originalHeaderTable = document.querySelector('.card-header table, #Formulario table:not(.op-wiz-stage-table)');
                                                var headerHtml = '';
                                                if (originalHeaderTable) {
                                                    var headerClone = originalHeaderTable.cloneNode(true);

                                                    // P4: la "Lista de Distribucion" vive como texto plano (separado por <br>) en la
                                                    // MISMA celda del icono de personas. La extraemos y la desplegamos legible debajo
                                                    // de la cabecera para que en el PDF Gerencia lea nombres/cargos sin depender del hover.
                                                    var _opDistList = [];
                                                    var _opPeopleIco = headerClone.querySelector('.fa-users, .fa-user, .fa-user-friends, .fa-address-book');
                                                    var _opPeopleCell = _opPeopleIco ? _opPeopleIco.closest('td, th') : null;
                                                    if (_opPeopleCell) {
                                                        var _opTmp = _opPeopleCell.cloneNode(true);
                                                        var _opStrip = _opTmp.querySelectorAll('i, svg, button, a');
                                                        for (var _z = 0; _z < _opStrip.length; _z++) _opStrip[_z].remove();
                                                        var _opRaw = (_opTmp.innerHTML || '').replace(/<br\s*\/?>/gi, '\n').replace(/<[^>]+>/g, ' ');
                                                        var _opTxt = _opRaw.replace(/&nbsp;/gi, ' ').replace(/&amp;/gi, '&').replace(/[ \t]{2,}/g, ' ').replace(/\s*\n\s*/g, '\n').trim();
                                                        _opDistList = _opTxt.split('\n').map(function (s) { return s.trim(); }).filter(function (s) { return s.length > 1 && !/^lista de distribuci/i.test(s); });
                                                        // Evitar duplicado en el PDF: en el clone del header dejamos solo el icono + etiqueta;
                                                        // el detalle legible va al bloque dedicado de abajo.
                                                        if (_opDistList.length > 0) { _opPeopleCell.innerHTML = '<i class="fas fa-users" style="margin-right:4px;"></i> Lista de Distribución'; }
                                                    }

                                                    var btns = headerClone.querySelectorAll('button, input, a, select, .op-card-actions, [id^="Ventana"], .floating-button, .objeto');
                                                    for (var b = 0; b < btns.length; b++) btns[b].remove();

                                                    headerClone.setAttribute('border', '1');
                                                    headerClone.className = 'table table-bordered mb-4';
                                                    headerClone.style.cssText = 'width:100% !important; border-collapse:collapse !important; border:1.5px solid #0f172a !important; font-family:Arial,sans-serif !important; background:#ffffff !important; margin-bottom:0 !important;';

                                                    var tds = headerClone.querySelectorAll('td, th');
                                                    for (var j = 0; j < tds.length; j++) {
                                                        var _isTh = tds[j].tagName === 'TH';
                                                        tds[j].style.cssText = 'border:1px solid #0f172a !important; padding:8px 12px !important; text-align:center !important; font-size:12px !important; line-height:1.4 !important; color:#0f172a !important; background:#ffffff !important; font-weight:' + (_isTh ? '700' : '400') + ' !important;';
                                                    }
                                                    headerHtml = headerClone.outerHTML;

                                                    // P4: bloque visible de responsables (texto plano) debajo de la cabecera Plastitec.
                                                    if (_opDistList.length > 0) {
                                                        var _opSeen = {};
                                                        var _opRows = '';
                                                        _opDistList.forEach(function (_entry) {
                                                            _entry.split(/\n|;|\||,(?=\s*[A-ZÁÉÍÓÚÑ])/).forEach(function (_line) {
                                                                var _l = _line.replace(/\s{2,}/g, ' ').trim();
                                                                if (_l && _l.length > 1 && !_opSeen[_l.toLowerCase()]) {
                                                                    _opSeen[_l.toLowerCase()] = true;
                                                                    _opRows += '<li style="margin-bottom:2px; break-inside:avoid;">' + _l + '</li>';
                                                                }
                                                            });
                                                        });
                                                        if (_opRows) {
                                                            headerHtml += '<div class="op-preview-distribution" style="border:1px solid #e2e8f0; border-radius:8px; padding:14px 18px; font-family:Arial,sans-serif; font-size:12px; color:#1e293b; background:#f8fafc; margin:16px 0 24px; page-break-inside:avoid;">'
                                                                + '<div style="font-weight:700; text-transform:uppercase; margin-bottom:8px; letter-spacing:0.4px; color:#0f172a; font-size:12px;"><i class="fas fa-users mr-1" style="color:#0284c7;"></i> Lista de Distribución / Responsables</div>'
                                                                + '<ul style="margin:0; padding-left:18px; columns:2; -webkit-columns:2; column-gap:32px; list-style:disc; line-height:1.7;">' + _opRows + '</ul>'
                                                                + '</div>';
                                                        }
                                                    }
                                                }

                                                // 2. Extraer y construir etapas ISO limpias usando `sections`
                                                var stagesHtml = '';
                                                var totalActivities = 0;

                                                sections.forEach(function (sec, sIdx) {
                                                    if (!sec.activities || sec.activities.length === 0) return;
                                                    var stageTitle = sec.title || ('Etapa ' + (sIdx + 1));
                                                    var actHtml = '';

                                                    sec.activities.forEach(function (act, aIdx) {
                                                        totalActivities++;
                                                        var tbl = act.element;
                                                        if (!tbl) return;

                                                        var trs = tbl.querySelectorAll('tr');
                                                        var author = 'No especificado';
                                                        var date = 'No especificada';
                                                        // Estado a NIVEL DE TABLA (robusto): el marcador real de Tag_memoria es
                                                        // <b class="text-success">FINALIZADO</b>, que segun la vista/branch cae en una fila
                                                        // distinta de la de AUTOR. Buscarlo solo en la fila de AUTOR fallaba -> badge EN PROCESO
                                                        // para actividades que en BD estan en estado 3. Se busca en todo el tbl.
                                                        var _fbTbl = tbl.querySelector('b.text-success');
                                                        var _fwTbl = tbl.querySelector('b.text-warning');
                                                        // 1) marcador explicito FINALIZADO -> FINALIZADO. 2) marcador EN REVISION -> EN REVISION.
                                                        // 3) sin marcador (Tag_memoria lo omite si la actividad no tiene respuesta): si la memoria
                                                        //    global esta TERMINADA -> FINALIZADO (no puede haber pendientes en una memoria cerrada);
                                                        //    si no, EN PROCESO.
                                                        var estado = (_fbTbl && /FINALIZAD/i.test(_fbTbl.textContent || '')) ? 'FINALIZADO'
                                                            : ((_fwTbl && /REVISION/i.test(_fwTbl.textContent || '')) ? 'EN REVISION'
                                                                : (_opPreviewMemFin ? 'FINALIZADO' : 'EN PROCESO'));
                                                        var desc = act.title || ('Actividad ' + (aIdx + 1));
                                                        var response = '';

                                                        for (var rw = 0; rw < trs.length; rw++) {
                                                            var row = trs[rw];
                                                            var rHtml = row.innerHTML;
                                                            var rText = (row.textContent || '').trim();

                                                            if (/AUTOR/i.test(rText)) {
                                                                var mAuth = rHtml.match(/AUTOR:\s*<\/b>\s*([^<]+)/i) || rHtml.match(/AUTOR:[^<]*<\/td>\s*<td[^>]*>([^<]+)/i);
                                                                if (mAuth) author = mAuth[1].trim();
                                                                else {
                                                                    var cAuth = Array.from(row.cells).find(function (c) { return /AUTOR/i.test(c.textContent); });
                                                                    if (cAuth) author = cAuth.textContent.replace(/AUTOR\s*:?/i, '').trim();
                                                                }

                                                                var mD = rHtml.match(/FECHA:\s*<\/b>\s*(?:<br\s*\/?>)?\s*([0-9\-\/]+)/i);
                                                                if (mD) date = mD[1].trim();
                                                                else {
                                                                    var cD = Array.from(row.cells).find(function (c) { return /FECHA/i.test(c.textContent); });
                                                                    if (cD) date = cD.textContent.replace(/FECHA\s*:?/i, '').trim();
                                                                }

                                                                // (estado ya se calculo a nivel de tabla arriba; no se toca aqui)
                                                            } else if (/Actividad\s*\d*\s*:/i.test(rText)) {
                                                                var mDesc = rHtml.match(/Actividad\s*\d*\s*:\s*<\/b>\s*([\s\S]+)/i);
                                                                if (mDesc) desc = mDesc[1].replace(/<\/td>[\s\S]*/i, '').trim();
                                                                else desc = rText.replace(/Actividad\s*\d*\s*:?/gi, '').trim();
                                                            } else if (/Responsable\s*:/i.test(rText) || /Respuesta\s*:/i.test(rText) || /RESPUESTAS/i.test(rText)) {
                                                                if (rText.indexOf('SIN ATENDER') === -1) {
                                                                    var cleanR = rHtml.replace(/<b>\s*RESPUESTAS\s*<\/b>/gi, '')
                                                                        .replace(/<b>\s*Responsable\s*:\s*<\/b>[^<]*/gi, '')
                                                                        .replace(/<b>\s*Respuesta\s*:\s*<\/b>/gi, '')
                                                                        .replace(/<br\s*\/?>/gi, '\n')
                                                                        .replace(/<[^>]+>/g, '')
                                                                        .trim();
                                                                    if (cleanR) response = cleanR;
                                                                }
                                                            }
                                                        }

                                                        // Sincronizar con el caché local en memoria
                                                        var key = act.globalIndex + '-0';
                                                        if (window._opResponsesCache && window._opResponsesCache[key] !== undefined && window._opResponsesCache[key].trim() !== '') {
                                                            response = window._opResponsesCache[key];
                                                        }

                                                        var hasResponse = response && response.trim() !== '' && response.indexOf('SIN ATENDER') === -1;

                                                        // C (retrocompatibilidad): saneo elegante de registros historicos incompletos.
                                                        // NO se altera el dato original en BD; es solo presentacion en preview/PDF.
                                                        var _authMissing = (!author || author === 'No especificado');
                                                        var _dateMissing = (!date || date === 'No especificada');
                                                        var _isLegacy = _authMissing || _dateMissing;
                                                        var _authorDisp = _authMissing ? '<span class="text-muted font-italic">Registro Histórico Legacy</span>' : ('<b>' + author + '</b>');
                                                        var _dateDisp = _dateMissing ? '<span class="text-muted">s/f</span>' : ('<b>' + date + '</b>');
                                                        var _legacyBadge = _isLegacy ? ' <span class="badge badge-light border text-muted" style="font-size:9px; font-weight:600;" title="Registro anterior a la captura obligatoria de autoria/fecha; se preserva intacto en BD"><i class="fas fa-archive mr-1"></i>Legacy</span>' : '';

                                                        actHtml += '<div class="op-preview-activity-card" style="background:#ffffff; border:1px solid #e2e8f0; border-radius:8px; padding:18px 24px; margin-bottom:20px; page-break-inside:avoid;">'
                                                            + '  <div class="d-flex align-items-center justify-content-between mb-2 pb-2 border-bottom" style="font-size:12px; color:#475569; font-weight:600;">'
                                                            + '    <span><span class="badge badge-primary mr-2" style="font-size:10px;">ACTIVIDAD ' + (aIdx + 1) + '</span> Autor: ' + _authorDisp + _legacyBadge + '</span>'
                                                            + '    <span>Fecha: ' + _dateDisp + ' &nbsp;|&nbsp; Estado: <span class="badge ' + (estado === 'FINALIZADO' ? 'badge-success' : 'badge-warning') + '" style="' + (estado === 'FINALIZADO' ? 'background:#16a34a; color:#fff; font-weight:700;' : '') + '">' + (estado === 'FINALIZADO' ? 'TERMINADA' : estado) + '</span></span>'
                                                            + '  </div>'
                                                            + '  <div class="font-weight-bold text-dark mb-2" style="font-size:13.5px; line-height:1.55; color:#0f172a;">' + desc + '</div>'
                                                            // Tarea 1: solo mostrar el recuadro de avance si HAY respuesta real; nunca la caja vacía.
                                                            + (hasResponse
                                                                ? ('  <div style="background:#f8fafc; border:1px solid #e2e8f0; border-left:4px solid #0284c7; border-radius:6px; padding:14px 18px;">'
                                                                    + '    <div class="font-weight-bold mb-1" style="font-size:11px; color:#64748b; text-transform:uppercase; letter-spacing:0.3px;"><i class="fas fa-reply text-primary mr-1"></i> Registro de Avance / Observaciones</div>'
                                                                    + '    <div style="font-size:13.5px; color:#1e293b; line-height:1.6;">' + opFormatHyperlinksAndTags(response) + '</div>'
                                                                    + '  </div>')
                                                                : '')
                                                            + '</div>';
                                                    });

                                                    stagesHtml += '<div class="op-preview-stage-block" style="page-break-inside:auto;">'
                                                        + '  <div class="text-white font-weight-bold d-flex align-items-center justify-content-between" style="background:#0f172a; padding:12px 20px; border-radius:6px; font-size:14px; font-weight:700; letter-spacing:0.3px; margin-top:32px; margin-bottom:16px;">'
                                                        + '    <span><i class="fas fa-folder-open text-warning mr-2"></i> ' + stageTitle + '</span>'
                                                        + '    <span class="badge badge-secondary">' + sec.activities.length + ' Actividades</span>'
                                                        + '  </div>'
                                                        + actHtml
                                                        + '</div>';
                                                });

                                                previewContainer.innerHTML = headerHtml + stagesHtml;
                                                cardBody.appendChild(previewContainer);
                                            };

                                            function applyViewMode(mode) {
                                                // P2: blindaje solo-lectura -> Modo Gestion (split) prohibido en memorias finalizadas
                                                if (mode === 'split' && !isEditable) { mode = 'full'; }
                                                currentMode = mode;
                                                sessionStorage.setItem('op_view_mode', mode);

                                                var btnFull = document.getElementById('op-btn-full-doc');
                                                var btnSplit = document.getElementById('op-btn-split');

                                                // Ocultar pestañas y contenedores nativos legacy
                                                var legacyTabs = cardBody.querySelectorAll('#myTab, .nav-tabs, .dropdown, .floating-button, .objeto');
                                                legacyTabs.forEach(function (el) { el.style.setProperty('display', 'none', 'important'); });
                                                var legacyTabContent = document.getElementById('myTab2Content');
                                                if (legacyTabContent) legacyTabContent.style.setProperty('display', 'none', 'important');

                                                if (mode === 'full') {
                                                    if (btnFull) btnFull.classList.add('op-active');
                                                    if (btnSplit) btnSplit.classList.remove('op-active');

                                                    // Restore active activity to placeholder before hiding split
                                                    if (_opActiveActivityIndex !== null) {
                                                        var node = activityElements[_opActiveActivityIndex];
                                                        var placeholder = document.getElementById('op-placeholder-' + _opActiveActivityIndex);
                                                        if (node && placeholder) {
                                                            placeholder.parentNode.insertBefore(node, placeholder);
                                                            node.style.display = '';
                                                        }
                                                    }

                                                    workspace.style.display = 'none';
                                                    document.body.classList.add('op-fullview-mode');
                                                    document.body.classList.remove('op-split-mode');

                                                    // Hide legacy tables completely
                                                    for (var tp = 0; tp < tabPanes.length; tp++) {
                                                        tabPanes[tp].style.setProperty('display', 'none', 'important');
                                                    }

                                                    // Render Executive Preview Document
                                                    opRenderExecutivePreviewDocument();
                                                } else if (mode === 'split') {
                                                    if (btnSplit) btnSplit.classList.add('op-active');
                                                    if (btnFull) btnFull.classList.remove('op-active');

                                                    document.body.classList.add('op-split-mode');
                                                    document.body.classList.remove('op-fullview-mode');

                                                    // Remove continuous preview container
                                                    var prev = document.getElementById('op-continuous-preview-container');
                                                    if (prev) prev.remove();

                                                    // Hide all original activities
                                                    for (var y = 0; y < activityElements.length; y++) {
                                                        activityElements[y].style.display = 'none';
                                                    }
                                                    for (var tps = 0; tps < tabPanes.length; tps++) {
                                                        tabPanes[tps].style.setProperty('display', 'none', 'important');
                                                    }
                                                    var myTab2 = document.getElementById('myTab2Content');
                                                    if (myTab2) myTab2.style.setProperty('display', 'none', 'important');

                                                    workspace.style.display = 'flex';

                                                    if (activityElements.length > 0) {
                                                        var sel = parseInt(sessionStorage.getItem('op_split_selected') || '0', 10);
                                                        opShowActivityDetail(sel, activityElements, detailPanel, masterPanel);
                                                    }
                                                }
                                            }

                                            applyViewMode(currentMode);

                                            var btnFullEl = document.getElementById('op-btn-full-doc');
                                            if (btnFullEl) btnFullEl.addEventListener('click', function () { applyViewMode('full'); });
                                            var btnSplitEl = document.getElementById('op-btn-split');
                                            if (btnSplitEl) btnSplitEl.addEventListener('click', function () { applyViewMode('split'); });

                                            masterPanel.addEventListener('click', function (e) {
                                                var card = e.target.closest('.op-activity-card');
                                                if (!card) return;
                                                var idx = parseInt(card.getAttribute('data-activity-index'), 10);
                                                opShowActivityDetail(idx, activityElements, detailPanel, masterPanel);
                                            });
                                        }

                                        // ═══ EJE H-b: adjuntos por AJAX en el documento continuo ═══
                                        // Para cada actividad con adjuntos (count>0 en el clip, aunque este oculto por
                                        // Eje H), hace fetch del view TempM=7&ver_adj=C, parsea el .cont_reg emitido por
                                        // Tag_memoria y lista los archivos como texto. Gated: sin adjuntos, cero fetch.
                                        // Solo lectura; no toca handlers legacy.
                                        function opInjectContinuousAttachments() {
                                            if (!document.body.classList.contains('op-fullview-mode')) return;
                                            var clips = document.querySelectorAll('#myTab2Content a[href*="ver_adj"]');
                                            for (var ci = 0; ci < clips.length; ci++) {
                                                var clip = clips[ci];
                                                var badge = clip.querySelector('.badge');
                                                var count = badge ? parseInt((badge.textContent || '0').trim(), 10) : 0;
                                                if (!count || count < 1) continue;
                                                var host = clip.closest('table.table-bordered');
                                                if (!host) continue;
                                                if (host.nextElementSibling && host.nextElementSibling.classList && host.nextElementSibling.classList.contains('op-attach-list')) continue;
                                                var box = document.createElement('div');
                                                box.className = 'op-attach-list';
                                                box.innerHTML = '<div class="op-attach-title">ADJUNTOS (' + count + ')</div><div class="op-attach-loading">Cargando adjuntos…</div>';
                                                host.parentNode.insertBefore(box, host.nextSibling);
                                                (function (url, target) {
                                                    fetch(url, { headers: { 'X-Requested-With': 'XMLHttpRequest' } })
                                                        .then(function (r) { return r.text(); })
                                                        .then(function (htmlStr) {
                                                            var doc = new DOMParser().parseFromString(htmlStr, 'text/html');
                                                            var cont = doc.querySelector('.cont_reg');
                                                            var links = cont ? cont.querySelectorAll('a[href*="Descargar?file_name"]') : [];
                                                            var load = target.querySelector('.op-attach-loading');
                                                            if (!links.length) { if (load) load.textContent = 'Sin archivos listados.'; return; }
                                                            var listHtml = '<ol class="op-attach-ol">';
                                                            for (var k = 0; k < links.length; k++) {
                                                                var name = (links[k].textContent || '').trim();
                                                                var row = links[k].closest('tr');
                                                                var cells = row ? row.querySelectorAll('td') : [];
                                                                var fecha = cells.length > 1 ? (cells[1].textContent || '').trim() : '';
                                                                listHtml += '<li>' + name + (fecha ? ' &middot; ' + fecha : '') + '</li>';
                                                            }
                                                            listHtml += '</ol>';
                                                            if (load) load.remove();
                                                            target.insertAdjacentHTML('beforeend', listHtml);
                                                        })
                                                        .catch(function () {
                                                            var l = target.querySelector('.op-attach-loading');
                                                            if (l) l.textContent = 'No se pudieron cargar los adjuntos.';
                                                        });
                                                })(clip.getAttribute('href'), box);
                                            }
                                        }

                                        // Render selected activity in Detail Panel (Cross-Section & Interactive)
                                        // Toast discreto no bloqueante (reactividad en vivo).
                                        window.opToast = function (msg, ok) {
                                            var t = document.createElement('div');
                                            t.setAttribute('role', 'status');
                                            t.style.cssText = 'position:fixed; bottom:20px; right:20px; z-index:2147483000; background:' + (ok === false ? '#dc2626' : '#16a34a') + '; color:#fff; font-family:Arial,sans-serif; font-size:13px; font-weight:600; padding:11px 18px; border-radius:8px; box-shadow:0 8px 24px rgba(0,0,0,0.25); opacity:0; transition:opacity .2s ease;';
                                            t.innerHTML = msg;
                                            document.body.appendChild(t);
                                            requestAnimationFrame(function () { t.style.opacity = '1'; });
                                            setTimeout(function () { t.style.opacity = '0'; setTimeout(function () { if (t.parentNode) t.remove(); }, 250); }, 2600);
                                        };

                                        // Borradores persistentes: mantienen descripcion/observaciones en MEMORIA (sobreviven al
                                        // navegar entre actividades) y en localStorage (sobreviven a un F5/recarga y al cierre de
                                        // la pestana/navegador). La clave se namespacea por ipy+estadoM para NO cruzar borradores
                                        // entre proyectos/vistas (el cache es posicional: index-subIndex). localStorage puede fallar
                                        // (lleno/deshabilitado/incognito) -> todo en try/catch, con la memoria como fuente primaria.
                                        // Politica de limpieza: TTL de 7 dias (purga al cargar) + borrado del borrador al TERMINAR.
                                        window._OP_DRAFT_PREFIX = 'opdraft:';
                                        window._OP_DRAFT_TTL = 7 * 24 * 60 * 60 * 1000; // 7 dias en ms
                                        window._opDraftNS = function () {
                                            var up = new URLSearchParams(window.location.search);
                                            return window._OP_DRAFT_PREFIX + (up.get('ipy') || '') + ':' + (up.get('estadoM') || '1') + ':';
                                        };
                                        // Selector del objeto-cache en memoria segun kind: 'desc' | 'resp' | 'state'.
                                        window._opCacheFor = function (kind) {
                                            if (kind === 'desc') { window._opDescCache = window._opDescCache || {}; return window._opDescCache; }
                                            if (kind === 'state') { window._opStateCache = window._opStateCache || {}; return window._opStateCache; }
                                            window._opResponsesCache = window._opResponsesCache || {}; return window._opResponsesCache;
                                        };
                                        window.opSaveDraft = function (kind, cacheKey, value) {
                                            window._opCacheFor(kind)[cacheKey] = value;
                                            // Se guarda {v,t}: t = timestamp para el TTL.
                                            try { localStorage.setItem(window._opDraftNS() + kind + ':' + cacheKey, JSON.stringify({ v: value, t: Date.now() })); } catch (e) { }
                                        };
                                        window.opReadDraft = function (kind, cacheKey) {
                                            var mem = window._opCacheFor(kind);
                                            if (mem && Object.prototype.hasOwnProperty.call(mem, cacheKey)) return mem[cacheKey];
                                            try {
                                                var fullKey = window._opDraftNS() + kind + ':' + cacheKey;
                                                var raw = localStorage.getItem(fullKey);
                                                if (raw !== null) {
                                                    var o = null; try { o = JSON.parse(raw); } catch (e2) { o = null; }
                                                    if (o && typeof o.v !== 'undefined') {
                                                        // TTL: si expiro (>7 dias) se descarta y se limpia; no se restaura.
                                                        if (o.t && (Date.now() - o.t) > window._OP_DRAFT_TTL) {
                                                            try { localStorage.removeItem(fullKey); } catch (e3) { }
                                                            return undefined;
                                                        }
                                                        // hidratar memoria para lecturas siguientes (post F5/recarga)
                                                        window._opCacheFor(kind)[cacheKey] = o.v;
                                                        return o.v;
                                                    }
                                                }
                                            } catch (e) { }
                                            return undefined;
                                        };
                                        // Borra el/los borrador(es) de una actividad (memoria + localStorage). kinds por defecto: desc+resp.
                                        // El estado ('state') NO se borra por defecto al TERMINAR: es justo lo que debe persistir.
                                        window.opClearDraft = function (cacheKey, kinds) {
                                            kinds = kinds || ['desc', 'resp'];
                                            kinds.forEach(function (kind) {
                                                try { var m = window._opCacheFor(kind); if (m) delete m[cacheKey]; } catch (e) { }
                                                try { localStorage.removeItem(window._opDraftNS() + kind + ':' + cacheKey); } catch (e) { }
                                            });
                                        };
                                        // Purga TODOS los borradores expirados (>7 dias) de cualquier proyecto/vista. Se corre 1 vez al cargar.
                                        window.opPurgeOldDrafts = function () {
                                            try {
                                                var now = Date.now(), rm = [];
                                                for (var i = 0; i < localStorage.length; i++) {
                                                    var k = localStorage.key(i);
                                                    if (!k || k.indexOf(window._OP_DRAFT_PREFIX) !== 0) continue;
                                                    var ts = 0; try { var o = JSON.parse(localStorage.getItem(k)); ts = (o && o.t) || 0; } catch (e2) { ts = 0; }
                                                    if (!ts || (now - ts) > window._OP_DRAFT_TTL) rm.push(k);
                                                }
                                                rm.forEach(function (k) { try { localStorage.removeItem(k); } catch (e3) { } });
                                            } catch (e) { }
                                        };
                                        try { window.opPurgeOldDrafts(); } catch (e) { }

                                        // P2: autoguardado en vivo de la DESCRIPCION con debounce 500ms. La memoria se actualiza
                                        // en el acto (no perder al navegar); la persistencia en localStorage se debouncea.
                                        window._opDescDebounce = {};
                                        window.opDescInput = function (cacheKey, value) {
                                            window._opCacheFor('desc')[cacheKey] = value;
                                            clearTimeout(window._opDescDebounce[cacheKey]);
                                            window._opDescDebounce[cacheKey] = setTimeout(function () { opSaveDraft('desc', cacheKey, value); }, 500);
                                        };

                                        // Marca el estado en el nodo subyacente (activityElements[index]) con un data-attr
                                        // NO destructivo. La fuente autoritativa de persistencia es _opStateCache (memoria +
                                        // localStorage); esta marca es una senal secundaria y evita cirugia fragil sobre el HTML legacy.
                                        window.opMutateNodeState = function (index, estadoNum) {
                                            try {
                                                var node = window._opActivityElements && window._opActivityElements[index];
                                                if (node && node.setAttribute) node.setAttribute('data-op-state', estadoNum);
                                            } catch (e) { }
                                        };
                                        // True si ALGUNA sub-actividad de este index quedo TERMINADA (estado 3) segun el state cache
                                        // (memoria + localStorage). Lo usa el build del arbol para pintar el dot verde tras un F5.
                                        window.opNodeFinalizedFromCache = function (index) {
                                            try {
                                                var sc = window._opStateCache || {};
                                                for (var k in sc) { if (sc.hasOwnProperty(k) && k.indexOf(index + '-') === 0 && (sc[k] === 3 || sc[k] === '3')) return true; }
                                                var ns = window._opDraftNS() + 'state:' + index + '-';
                                                for (var i = 0; i < localStorage.length; i++) {
                                                    var lk = localStorage.key(i);
                                                    if (lk && lk.indexOf(ns) === 0) {
                                                        var o = null; try { o = JSON.parse(localStorage.getItem(lk)); } catch (e2) { o = null; }
                                                        if (o && (o.v === 3 || o.v === '3')) return true;
                                                    }
                                                }
                                            } catch (e) { }
                                            return false;
                                        };
                                        // Actualiza EN VIVO (sin reload) el badge del detalle, el punto del arbol y el contador.
                                        function opReflectActivityState(index, idMemoria, estadoNum, subIndex) {
                                            var isFin = (estadoNum === 3 || estadoNum === '3');
                                            // Badge de cabecera: primero por ID UNICO (robusto, no depende de data-id-memoria);
                                            // fallback a la card por data-id-memoria por compatibilidad.
                                            var badge = (subIndex !== undefined && subIndex !== null)
                                                ? document.getElementById('op-detail-header-badge-' + index + '-' + subIndex) : null;
                                            if (!badge) {
                                                var card = idMemoria ? document.querySelector('.op-activity-item-card[data-id-memoria="' + idMemoria + '"]') : null;
                                                if (card) badge = card.querySelector('.op-estado-badge');
                                            }
                                            if (badge) {
                                                badge.className = 'badge op-estado-badge ' + (isFin ? 'badge-success' : 'badge-warning');
                                                badge.style.cssText = isFin ? 'background:#16a34a !important;color:#fff !important;font-weight:700 !important;' : '';
                                                badge.textContent = isFin ? 'TERMINADA' : 'EN PROCESO';
                                            }
                                            var mc = document.querySelector('#op-master-panel .op-activity-card[data-activity-index="' + index + '"]');
                                            if (mc) {
                                                var dot = mc.querySelector('.op-status-dot');
                                                if (dot) dot.style.background = 'var(--op-status-' + (isFin ? 'finalizado' : 'proceso') + '-dot, var(--op-text-muted))';
                                                var ttl = mc.getAttribute('title') || '';
                                                mc.setAttribute('title', ttl.replace(/—.*/, '— ' + (isFin ? 'Terminada' : 'En proceso')));
                                            }
                                            try {
                                                var dots = document.querySelectorAll('#op-master-panel .op-status-dot');
                                                var total = dots.length, fin = 0;
                                                dots.forEach(function (d) { if ((d.style.background || '').indexOf('finalizado') !== -1) fin++; });
                                                var lbl = document.querySelector('#op-master-panel .op-progress-label');
                                                if (lbl) lbl.textContent = fin + ' / ' + total + ' actividades terminadas';
                                                var bar = document.querySelector('#op-master-panel .op-progress-bar');
                                                if (bar) bar.style.width = (total ? Math.round(fin * 100 / total) : 0) + '%';
                                            } catch (e) { }
                                        }
                                        // Punto 1: control directo de estado — opc=13 via fetch, SIN reload, reflejo en vivo del DOM.
                                        window.opSetActivityState = function (index, subIndex, idMemoria, estado) {
                                            idMemoria = ('' + idMemoria).trim();
                                            if (!idMemoria) { alert('No se pudo identificar la actividad (id_memoria).'); return; }
                                            var up = new URLSearchParams(window.location.search);
                                            var ipy = up.get('ipy') || (document.querySelector('[name="ipy"]') || {}).value || '';
                                            var estadoM = up.get('estadoM') || '1';
                                            var isFin = (estado === 3 || estado === '3');
                                            var label = isFin ? 'TERMINADA' : 'EN PROCESO';
                                            fetch('Proyecto?opc=13', { method: 'POST', headers: { 'Content-Type': 'application/x-www-form-urlencoded' }, credentials: 'same-origin',
                                                body: 'ipy=' + ipy + '&id_memoria=' + idMemoria + '&estado=' + estado + '&estadoM=' + estadoM })
                                                .then(function (r) {
                                                    try { if (window.swal) swal.close(); } catch (e) { }
                                                    if (r && (r.ok || r.status === 302)) {
                                                        opReflectActivityState(index, idMemoria, estado, subIndex);
                                                        // Persistir el ESTADO para que sobreviva al re-render al navegar y al F5.
                                                        opSaveDraft('state', index + '-' + subIndex, estado);
                                                        opMutateNodeState(index, estado); // reflejar en el HTML subyacente del arbol
                                                        // Al TERMINAR (estado 3): la observacion ya se autoguardo (opc=11) -> se borra ese
                                                        // borrador. NO se borra el de la descripcion: opc=13 (este flujo) NO persiste la
                                                        // descripcion, y borrarlo perderia una edicion no guardada.
                                                        if (estado === 3 || estado === '3') { opClearDraft(index + '-' + subIndex, ['resp']); }
                                                        opToast('<i class="fas fa-check mr-1"></i> Actividad marcada como ' + label);
                                                    } else { opToast('<i class="fas fa-exclamation-triangle mr-1"></i> No se pudo cambiar el estado', false); }
                                                }).catch(function () { try { if (window.swal) swal.close(); } catch (e) { } opToast('<i class="fas fa-exclamation-triangle mr-1"></i> Error de red al cambiar el estado', false); });
                                        };
                                        // Punto 1 (decoupleado): "Marcar como FINALIZADA". El autoguardado ya persistió la
                                        // observación (opc=11, sin cambiar estado). Aquí SOLO se finaliza (opc=13). Si la
                                        // DESCRIPCION fue editada, se persiste via opc=10 (que ademas finaliza) preservando el
                                        // numeral leido del form de edicion; si no cambio, se usa opc=13 puro (sin email/numeral).
                                        // NO se re-envia la observacion (evita duplicar la respuesta del autoguardado).
                                        window.opMarkActivityFinalized = function (index, subIndex, idMemoria) {
                                            idMemoria = ('' + (idMemoria || '')).trim();
                                            // Red de seguridad (Punto 2): si llego vacio/undefined, resolverlo desde el DOM de la
                                            // card (data-id-memoria) o del HTML de la actividad, en vez de abortar.
                                            if (!idMemoria || idMemoria === 'undefined' || idMemoria === 'null') {
                                                var _c = document.querySelector('.op-activity-item-card[data-id-memoria]:not([data-id-memoria=""]) [id="op-detail-response-text-' + index + '-' + subIndex + '"]');
                                                var _card = _c ? _c.closest('.op-activity-item-card') : null;
                                                if (_card) idMemoria = (_card.getAttribute('data-id-memoria') || '').trim();
                                                if (!idMemoria) {
                                                    var _actEl = (window._opActivityElements && window._opActivityElements[index]) || null;
                                                    var _h = _actEl ? (_actEl.innerHTML || '') : '';
                                                    var _m = _h.match(/cba_num=(\d+)/i) || _h.match(/ProyectoEstado\d\(\s*\d+\s*,\s*\d+\s*,\s*(\d+)/) || _h.match(/(?:id_memoria|id_memoria_d)\s*[:=]\s*['"]?(\d+)/i);
                                                    if (_m) idMemoria = _m[1];
                                                }
                                            }
                                            if (!idMemoria) { alert('No se pudo identificar la actividad (id_memoria).'); return; }
                                            var up = new URLSearchParams(window.location.search);
                                            var ipy = up.get('ipy') || (document.querySelector('[name="ipy"]') || {}).value || '';
                                            var estadoM = up.get('estadoM') || '1';
                                            var idUsuario = (document.querySelector('[name="id_usuario"]') || {}).value || '';
                                            var today = new Date().toISOString().substring(0, 10);
                                            var H = { 'Content-Type': 'application/x-www-form-urlencoded' };
                                            var descEl = document.getElementById('op-detail-desc-' + index + '-' + subIndex);
                                            var descChanged = descEl && (descEl.value || '') !== (descEl.getAttribute('data-orig') || '');
                                            if (typeof window.swal === 'function') { try { swal({ title: 'Finalizando actividad…', text: '<i class="fas fa-spinner fa-spin fa-2x text-primary"></i>', html: true, showConfirmButton: false }); } catch (e) { } }
                                            function pureFinalize() {
                                                return fetch('Proyecto?opc=13', { method: 'POST', headers: H, credentials: 'same-origin',
                                                    body: 'ipy=' + ipy + '&id_memoria=' + idMemoria + '&estado=3&estadoM=' + estadoM });
                                            }
                                            var chain;
                                            if (descChanged) {
                                                // leer numeral ACTUAL del form de edicion (TempM=1) para NO corromperlo; si no aparece, ABORTAR
                                                chain = fetch('Proyecto?opc=7&ipy=' + ipy + '&estadoM=' + estadoM + '&TempM=1&cba_num=' + idMemoria, { credentials: 'same-origin' })
                                                    .then(function (r) { return r.text(); })
                                                    .then(function (html) {
                                                        var doc = new DOMParser().parseFromString(html, 'text/html');
                                                        var numSel = doc.querySelector('#Ventana4 select[name="numeral"]') || doc.querySelector('select[name="numeral"]');
                                                        var numeral = numSel ? numSel.value : '';
                                                        var fEl = doc.querySelector('#Ventana4 input[name="fecha_reg"]') || doc.querySelector('input[name="fecha_reg"]');
                                                        var fecha = (fEl && fEl.value) ? fEl.value : today;
                                                        if (!numeral || numeral === '#' || numeral === '-') { throw new Error('numeral-desconocido'); }
                                                        var body10 = new URLSearchParams({ estado: estadoM, ipy: ipy, id_usuario: idUsuario, id_memoria: idMemoria, fecha_reg: fecha, numeral: numeral, observacion: (descEl.value || '').trim() }).toString();
                                                        return fetch('Proyecto?opc=10', { method: 'POST', headers: H, credentials: 'same-origin', body: body10 });
                                                    });
                                            } else {
                                                chain = pureFinalize();
                                            }
                                            chain.then(function (r) {
                                                try { if (window.swal) swal.close(); } catch (e) { }
                                                if (r && (r.ok || r.status === 302)) {
                                                    opReflectActivityState(index, idMemoria, 3, subIndex); // SIN reload: reflejo en vivo
                                                    if (descChanged && descEl) descEl.setAttribute('data-orig', descEl.value || '');
                                                    // Persistir el ESTADO (TERMINADA) para que sobreviva al re-render al navegar y al F5.
                                                    opSaveDraft('state', index + '-' + subIndex, 3);
                                                    opMutateNodeState(index, 3); // reflejar en el HTML subyacente del arbol
                                                    // TERMINADA por el flujo principal: la descripcion se persistio (opc=10 si cambio) y
                                                    // la observacion via autoguardado (opc=11) -> se borran AMBOS borradores.
                                                    opClearDraft(index + '-' + subIndex);
                                                    opToast('<i class="fas fa-check mr-1"></i> Actividad marcada como TERMINADA');
                                                } else { throw new Error('finalize'); }
                                            }).catch(function (e) {
                                                try { if (window.swal) swal.close(); } catch (er) { }
                                                if (e && e.message === 'numeral-desconocido') alert('Editaste la descripción pero no se pudo determinar el numeral actual; se ABORTÓ para no corromper el registro. Usa el lápiz (Modificar) del flujo estándar para editar la descripción.');
                                                else alert('No se pudo finalizar la actividad. Revise e intente nuevamente.');
                                            });
                                        };

                                        // Acordeon de Observaciones (progressive disclosure): muestra/oculta el bloque de
                                        // avance/observacion sin tocar el estado ni recargar. Tolerante: si el nodo no existe, no falla.
                                        window.opToggleObservationBlock = function (index, subIndex) {
                                            var body = document.getElementById('op-obs-body-' + index + '-' + subIndex);
                                            if (!body) return;
                                            var chevron = document.getElementById('op-obs-chevron-' + index + '-' + subIndex);
                                            var label = document.getElementById('op-obs-label-' + index + '-' + subIndex);
                                            var isOpen = body.style.display !== 'none';
                                            if (isOpen) {
                                                body.style.display = 'none';
                                                if (chevron) { chevron.classList.remove('fa-chevron-down'); chevron.classList.add('fa-chevron-right'); }
                                                if (label) label.textContent = 'Agregar Conclusión / Nota de Seguimiento (Opcional)';
                                            } else {
                                                body.style.display = 'block';
                                                if (chevron) { chevron.classList.remove('fa-chevron-right'); chevron.classList.add('fa-chevron-down'); }
                                                if (label) label.textContent = 'Conclusión / Nota de Seguimiento';
                                                var ta = document.getElementById('op-detail-response-text-' + index + '-' + subIndex);
                                                if (ta) { try { ta.focus(); } catch (e) { } }
                                            }
                                        };

                                        function opShowActivityDetail(index, activityElements, detailPanel, masterPanel) {
                                            if (index < 0 || index >= activityElements.length) return;

                                            // Update styles in Master Panel
                                            var cards = masterPanel.querySelectorAll('.op-activity-card');
                                            for (var i = 0; i < cards.length; i++) {
                                                cards[i].style.background = '#ffffff';
                                                cards[i].style.borderColor = '#e2e8f0';
                                                cards[i].style.color = '#334155';
                                            }
                                            var activeCard = masterPanel.querySelector('.op-activity-card[data-activity-index="' + index + '"]');
                                            if (activeCard) {
                                                activeCard.style.background = '#e0f2fe';
                                                activeCard.style.borderColor = '#0284c7';
                                                activeCard.style.color = '#0369a1';

                                                // Auto expand parent section if collapsed
                                                var parentSec = activeCard.closest('.op-tree-section');
                                                if (parentSec) parentSec.classList.remove('collapsed');
                                            }

                                            // Restore previous active activity to its placeholder
                                            if (_opActiveActivityIndex !== null && _opActiveActivityIndex !== index) {
                                                // Autosave all text areas typed on the previous activity before moving it away
                                                var activeTextareas = detailPanel.querySelectorAll('textarea[id^="op-detail-response-text-"]');
                                                activeTextareas.forEach(function (ta) {
                                                    var ids = ta.id.replace('op-detail-response-text-', '').split('-');
                                                    var idx = parseInt(ids[0], 10);
                                                    var subIdx = parseInt(ids[1], 10);
                                                    opAutoSaveResponse(idx, subIdx);
                                                });
                                                // P2: persistir la DESCRIPCION editada (memoria + localStorage) ANTES de desmontar,
                                                // para que al volver se restaure exactamente lo escrito (no el texto original del DOM).
                                                var descAreas = detailPanel.querySelectorAll('textarea[id^="op-detail-desc-"]');
                                                descAreas.forEach(function (dta) {
                                                    var dk = dta.id.replace('op-detail-desc-', '');
                                                    if (typeof opSaveDraft === 'function') opSaveDraft('desc', dk, dta.value);
                                                });

                                                var prevNode = activityElements[_opActiveActivityIndex];
                                                var prevPlaceholder = document.getElementById('op-placeholder-' + _opActiveActivityIndex);
                                                if (prevNode && prevPlaceholder) {
                                                    prevPlaceholder.parentNode.insertBefore(prevNode, prevPlaceholder);
                                                    prevNode.style.display = 'none';
                                                }
                                            }

                                            _opActiveActivityIndex = index;
                                            var realNode = activityElements[index];
                                            realNode.style.display = 'block';

                                            // Uncollapse internal collapses
                                            var hiddenEls = realNode.querySelectorAll('.collapse');
                                            for (var h = 0; h < hiddenEls.length; h++) {
                                                hiddenEls[h].classList.add('show');
                                                hiddenEls[h].style.display = 'block';
                                            }

                                            var urlParams = new URLSearchParams(window.location.search);
                                            var estadoM = urlParams.get('estadoM') || '1';
                                            var isEditable = (estadoM === '1' || estadoM === 1) && !window.opDetectProjectClosed();

                                            var meta = _opActivitiesList[index] || {};
                                            var title = meta.title || ('Actividad DHF ' + (index + 1));
                                            var sectionTitle = meta.sectionTitle || 'Etapa ISO';

                                            var prevDisabled = index === 0 ? 'disabled' : '';
                                            var nextDisabled = index === (activityElements.length - 1) ? 'disabled' : '';

                                            // Build Detail Panel base HTML
                                            detailPanel.innerHTML = ''
                                                + '<div class="op-detail-breadcrumb">'
                                                + '  <i class="fas fa-layer-group text-primary"></i>'
                                                + '  <span>' + sectionTitle + '</span>'
                                                + '  <i class="fas fa-chevron-right text-muted mx-1" style="font-size:10px;"></i>'
                                                + '  <span class="font-weight-bold text-dark">' + title + '</span>'
                                                + '</div>'
                                                + '<div class="d-flex align-items-center justify-content-between pb-3 mb-3 border-bottom">'
                                                + '  <div>'
                                                + '    <span class="badge badge-primary px-2 py-1 mb-1">DHF ISO 13485</span>'
                                                + '    <h5 class="m-0 font-weight-bold text-dark">' + title + '</h5>'
                                                + '  </div>'
                                                + '  <div class="d-flex align-items-center gap-2">'
                                                + '    <span class="text-muted font-weight-bold" style="font-size:12px;">Actividad ' + (index + 1) + ' de ' + activityElements.length + '</span>'
                                                + '  </div>'
                                                + '</div>'
                                                + '<div class="op-detail-content-wrapper mb-3" style="max-height: 58vh; overflow-y: auto; padding-right: 5px;"></div>'
                                                + '<div class="op-detail-nav-footer">'
                                                + '  <button type="button" class="btn btn-sm btn-outline-secondary font-weight-bold" ' + prevDisabled + ' onclick="opGoToActivity(' + (index - 1) + ')"><i class="fas fa-arrow-left mr-1"></i> Anterior Actividad</button>'
                                                + '  <span class="text-muted font-weight-bold" style="font-size:12px;">' + (index + 1) + ' / ' + activityElements.length + '</span>'
                                                + '  <button type="button" class="btn btn-sm btn-outline-primary font-weight-bold" ' + nextDisabled + ' onclick="opGoToActivity(' + (index + 1) + ')">Siguiente Actividad <i class="fas fa-arrow-right ml-1"></i></button>'
                                                + '</div>';

                                            window._opActivityElements = activityElements;

                                            // Parse the cloned table's rows and build beautiful Notion-style cards for each activity block
                                            var clonedNode = realNode.cloneNode(true);
                                            var trs = clonedNode.querySelectorAll('tr');
                                            var blocks = [];
                                            var currentRows = [];

                                            for (var r = 0; r < trs.length; r++) {
                                                var row = trs[r];
                                                if (row.querySelector('th') && (row.textContent.indexOf('AUTOR:') === -1)) {
                                                    continue; // Skip the phase table header row
                                                }
                                                if (row.innerHTML.indexOf('AUTOR:') !== -1) {
                                                    if (currentRows.length > 0) {
                                                        blocks.push(currentRows);
                                                        currentRows = [];
                                                    }
                                                }
                                                currentRows.push(row);
                                            }
                                            if (currentRows.length > 0) {
                                                blocks.push(currentRows);
                                            }

                                            var contentWrapper = detailPanel.querySelector('.op-detail-content-wrapper');
                                            var cardsHtml = '';

                                            if (blocks.length > 0) {
                                                blocks.forEach(function (blockRows, subIndex) {
                                                    var authorText = 'Autor no especificado';
                                                    var dateText = 'Fecha no especificada';
                                                    var estadoText = 'Estado no especificado';
                                                    var descText = 'Descripción no disponible';
                                                    var statusHtml = '';
                                                    var idMemoria = '';
                                                    var fileLink = null;
                                                    var existingResponse = '';
                                                    var actionsHtml = '';

                                                    blockRows.forEach(function (row) {
                                                        var rHtml = row.innerHTML;
                                                        var textContent = (row.textContent || '').trim();

                                                        // Buscar cba_num (id_memoria) en cualquier enlace o botón
                                                        var link = row.querySelector('a[href*="cba_num="]');
                                                        if (link) {
                                                            var match = link.getAttribute('href').match(/cba_num=(\d+)/);
                                                            if (match) idMemoria = match[1];
                                                        }
                                                        var btn = row.querySelector('button[onclick*="ProyectoEstado2"]');
                                                        if (btn) {
                                                            var matchBtn = btn.getAttribute('onclick').match(/ProyectoEstado2\([^,]+,[^,]+,(\d+)/);
                                                            if (matchBtn) idMemoria = matchBtn[1];
                                                        }

                                                        // 1. Identificar fila de metadatos (AUTOR, FECHA, ESTADO)
                                                        if (/AUTOR/i.test(textContent)) {
                                                            var mAuthor = rHtml.match(/AUTOR:\s*<\/b>\s*([^<]+)/i) || rHtml.match(/AUTOR:[^<]*<\/td>\s*<td[^>]*>([^<]+)/i);
                                                            if (mAuthor) {
                                                                authorText = mAuthor[1].trim();
                                                            } else {
                                                                var cellAuthor = Array.from(row.cells).find(function (c) { return /AUTOR/i.test(c.textContent); });
                                                                if (cellAuthor) authorText = cellAuthor.textContent.replace(/AUTOR\s*:?/i, '').trim();
                                                            }

                                                            var mDate = rHtml.match(/FECHA:\s*<\/b>\s*(?:<br\s*\/?>)?\s*([0-9\-\/]+)/i);
                                                            if (mDate) {
                                                                dateText = mDate[1].trim();
                                                            } else {
                                                                var cellDate = Array.from(row.cells).find(function (c) { return /FECHA/i.test(c.textContent); });
                                                                if (cellDate) dateText = cellDate.textContent.replace(/FECHA\s*:?/i, '').trim();
                                                            }

                                                            if (/FINALIZADO/i.test(rHtml)) estadoText = 'FINALIZADO';
                                                            else if (/PROCESO/i.test(rHtml)) estadoText = 'EN PROCESO';
                                                            else if (/SIN ATENDER/i.test(rHtml)) estadoText = 'SIN ATENDER';

                                                            // Extraer los enlaces de control nativos
                                                            var actionLinks = row.querySelectorAll('a, button');
                                                            actionLinks.forEach(function (btnLink) {
                                                                var cloned = btnLink.cloneNode(true);
                                                                cloned.className = 'btn btn-xs btn-outline-secondary font-weight-bold ml-1 px-2 py-1';
                                                                cloned.style.cssText = 'font-size: 11px; display: inline-flex; align-items: center; justify-content: center; gap: 4px; text-decoration: none;';
                                                                actionsHtml += cloned.outerHTML;
                                                            });
                                                        }

                                                        // 2. Identificar fila de descripción de la actividad
                                                        else if (/Actividad\s*\d*\s*:/i.test(textContent)) {
                                                            var mDesc = rHtml.match(/Actividad\s*\d*\s*:\s*<\/b>\s*([\s\S]+)/i);
                                                            if (mDesc) {
                                                                descText = mDesc[1].replace(/<\/td>[\s\S]*/i, '').trim();
                                                            } else {
                                                                descText = textContent.replace(/Actividad\s*\d*\s*:?/gi, '').trim();
                                                            }
                                                        }

                                                        // 3. Identificar fila de respuestas o estado sin atender
                                                        else if (/Responsable\s*:/i.test(textContent) || /Respuesta\s*:/i.test(textContent) || /RESPUESTAS/i.test(textContent) || /SIN ATENDER/i.test(textContent)) {
                                                            if (/SIN ATENDER ACTIVIDAD/i.test(textContent)) {
                                                                if (!statusHtml) {
                                                                    statusHtml = '<span class="op-status-no-atendida"><i class="fas fa-exclamation-triangle mr-1"></i> Sin atender actividad</span>';
                                                                }
                                                            } else if (/Responsable/i.test(textContent) || /Respuesta/i.test(textContent) || (/RESPUESTAS/i.test(textContent) && textContent.indexOf('SIN ATENDER') === -1)) {
                                                                var cleanResp = rHtml.replace(/<b>\s*RESPUESTAS\s*<\/b>/gi, '')
                                                                    .replace(/<b>\s*Responsable\s*:\s*<\/b>[^<]*/gi, '')
                                                                    .replace(/<b>\s*Respuesta\s*:\s*<\/b>/gi, '')
                                                                    .replace(/<br\s*\/?>/gi, '\n')
                                                                    .replace(/<[^>]+>/g, '')
                                                                    .trim();
                                                                if (cleanResp) {
                                                                    existingResponse = cleanResp;
                                                                    statusHtml = '<div class="d-block mb-1"><span class="op-status-atendida"><i class="fas fa-check-circle mr-1"></i> Atendida</span></div>'
                                                                        + '<div class="p-3 bg-light rounded text-dark font-weight-normal border-left-success" style="font-size:12px; border-left:4px solid #10b981; line-height:1.5; margin-top:6px; box-shadow:inset 0 1px 3px rgba(0,0,0,0.02);">' + opFormatHyperlinksAndTags(cleanResp) + '</div>';
                                                                }
                                                            }
                                                            fileLink = row.querySelector('a[href*="/api/files/"], a[href*="Descargar"], .oo-span-formatted') || fileLink;
                                                        }
                                                    });

                                                    // Punto 2: extraccion INFALIBLE de id_memoria por actividad. Si el barrido por
                                                    // filas no lo encontro (comun en actividades secundarias cuyo bloque no trae el
                                                    // link cba_num), se regexea TODO el HTML del bloque. Fuente autoritativa: cba_num
                                                    // (Tag_memoria: id_memoria = getAttribute("cba_num")); fallbacks: ProyectoEstado, id_memoria.
                                                    if (!idMemoria) {
                                                        var _blkHtml = blockRows.map(function (r) { return r.innerHTML || ''; }).join(' ');
                                                        var _mId = _blkHtml.match(/cba_num=(\d+)/i)
                                                            || _blkHtml.match(/ProyectoEstado\d\(\s*\d+\s*,\s*\d+\s*,\s*(\d+)/)
                                                            || _blkHtml.match(/(?:id_memoria|id_memoria_d|idm)\s*[:=]\s*['"]?(\d+)/i);
                                                        if (_mId) idMemoria = _mId[1];
                                                    }

                                                    // Fallback de estadoText a nivel de bloque: si la deteccion por fila no lo hallo,
                                                    // se evita el feo "Estado no especificado" en la cabecera. Default: EN PROCESO.
                                                    if (!estadoText || estadoText === 'Estado no especificado') {
                                                        var _blkTxt = blockRows.map(function (r) { return r.textContent || ''; }).join(' ');
                                                        if (/FINALIZAD/i.test(_blkTxt)) estadoText = 'FINALIZADO';
                                                        else if (/SIN ATENDER/i.test(_blkTxt)) estadoText = 'SIN ATENDER';
                                                        else if (/PROCESO/i.test(_blkTxt)) estadoText = 'EN PROCESO';
                                                        else estadoText = 'EN PROCESO';
                                                    }

                                                    // SPRINT 10: Persistencia de caché en memoria garantizada
                                                    var cacheKey = index + '-' + subIndex;

                                                    // Persistencia de ESTADO: si el usuario cambio el estado en esta sesion (opc=13),
                                                    // el _opStateCache es autoritativo y gana sobre el HTML estatico del JSP -> el badge
                                                    // NO revierte a amarillo al navegar de vuelta ni tras un F5. 3=FINALIZADO (verde),
                                                    // 1=EN PROCESO. Si no hay cache, se usa lo parseado del HTML.
                                                    var _cachedState = opReadDraft('state', cacheKey);
                                                    if (_cachedState === 3 || _cachedState === '3') estadoText = 'FINALIZADO';
                                                    else if (_cachedState === 1 || _cachedState === '1') estadoText = 'EN PROCESO';

                                                    window._opResponsesCache = window._opResponsesCache || {};
                                                    var cachedVal = opReadDraft('resp', cacheKey);
                                                    if (cachedVal !== undefined && cachedVal.trim() !== '') {
                                                        existingResponse = cachedVal;
                                                        statusHtml = '<div class="d-block mb-1"><span class="op-status-atendida"><i class="fas fa-check-circle mr-1"></i> Atendida</span></div>'
                                                            + '<div class="p-3 bg-light rounded text-dark font-weight-normal border-left-success" style="font-size:12px; border-left:4px solid #10b981; line-height:1.5; margin-top:6px; box-shadow:inset 0 1px 3px rgba(0,0,0,0.02);">' + opFormatHyperlinksAndTags(existingResponse) + '</div>';
                                                    }

                                                    // Fallback de estado si no se definió en las filas
                                                    if (!statusHtml) {
                                                        statusHtml = '<span class="op-status-no-atendida"><i class="fas fa-exclamation-triangle mr-1"></i> Sin atender actividad</span>';
                                                    }

                                                    // Punto 2: cache de la DESCRIPCION editada. El re-render al navegar lee el HTML
                                                    // estatico del JSP; sin cache, lo que el usuario escribio en la descripcion se
                                                    // perdia. Se precarga del cache si existe; data-orig conserva el valor ORIGINAL
                                                    // del servidor para que la deteccion de cambios (descChanged) en la finalizacion
                                                    // siga siendo correcta.
                                                    var _origDesc = (descText || '').replace(/<[^>]+>/g, '').replace(/&nbsp;/gi, ' ');
                                                    window._opDescCache = window._opDescCache || {};
                                                    var _cachedDesc = opReadDraft('desc', cacheKey);
                                                    var _descVal = (_cachedDesc !== undefined) ? _cachedDesc : _origDesc;
                                                    var _descOrigAttr = _origDesc.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
                                                    var _descBody = ('' + _descVal).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

                                                    cardsHtml += '<div class="op-activity-item-card mb-4 p-4 border rounded" style="border-radius:12px; background:#ffffff; box-shadow:0 4px 15px rgba(0,0,0,0.04); border:1px solid #cbd5e1;" data-id-memoria="' + idMemoria + '">'
                                                        + '  <div class="d-flex align-items-center justify-content-between mb-3 pb-2 border-bottom" style="font-size:11px; color:#64748b; font-weight:600; flex-wrap: wrap; gap: 8px;">'
                                                        + '    <div class="d-flex flex-wrap gap-3" style="gap: 15px;">'
                                                        + '      <div><i class="fas fa-user-edit mr-1 text-primary"></i> <b>AUTOR:</b> ' + authorText + '</div>'
                                                        + '      <div><i class="far fa-calendar-alt mr-1"></i> <b>FECHA:</b> ' + dateText + '</div>'
                                                        + '      <div><i class="fas fa-info-circle mr-1"></i> <b>ESTADO:</b> <span id="op-detail-header-badge-' + index + '-' + subIndex + '" class="badge op-estado-badge ' + (estadoText === 'FINALIZADO' ? 'badge-success' : 'badge-warning') + '" style="' + (estadoText === 'FINALIZADO' ? 'background:#16a34a;color:#fff;font-weight:700;' : '') + '">' + (estadoText === 'FINALIZADO' ? 'TERMINADA' : estadoText) + '</span>'
                                                        + (isEditable && idMemoria ? (' <span class="ml-2" style="white-space:nowrap;"><button type="button" class="btn btn-outline-warning py-0 px-2" style="font-size:10px;" onclick="opSetActivityState(' + index + ', ' + subIndex + ', \'' + idMemoria + '\', 1)" title="Marcar En Proceso">En Proceso</button> <button type="button" class="btn btn-outline-success py-0 px-2 ml-1" style="font-size:10px;" onclick="opSetActivityState(' + index + ', ' + subIndex + ', \'' + idMemoria + '\', 3)" title="Marcar Terminada">Terminar</button></span>') : '')
                                                        + '      </div>'
                                                        + '    </div>'
                                                        + '    <div class="d-flex align-items-center op-card-actions">' + actionsHtml + '</div>'
                                                        + '  </div>'
                                                        + '  <div class="op-activity-desc mb-3 p-3 rounded" style="font-size:13px; line-height:1.6; color:#1e293b; font-weight:500; background:#f8fafc; border:1px solid #f1f5f9;">'
                                                        + '    <div class="d-flex align-items-center justify-content-between mb-1"><span class="badge badge-info" style="font-size:9px;">ACTIVIDAD ' + (subIndex + 1) + '</span>' + (isEditable ? '<span class="text-muted" style="font-size:10px;"><i class="fas fa-pen mr-1"></i>Descripción editable</span>' : '') + '</div>'
                                                        + (isEditable
                                                            ? '    <textarea class="form-control op-detail-desc" id="op-detail-desc-' + index + '-' + subIndex + '" rows="2" spellcheck="true" lang="es" data-orig="' + _descOrigAttr + '" oninput="opDescInput(\'' + cacheKey + '\', this.value)" onchange="opSaveDraft(\'desc\', \'' + cacheKey + '\', this.value)" onblur="opSaveDraft(\'desc\', \'' + cacheKey + '\', this.value)" style="width:100%; box-sizing:border-box; font-size:13px; background:#ffffff;">' + _descBody + '</textarea>'
                                                            : '    <div>' + descText + '</div>')
                                                        + (isEditable ? ('    <div class="op-doc-toolbar d-flex align-items-center flex-wrap mt-2" style="gap:6px;">'
                                                            + '      <span class="text-muted mr-1" style="font-size:10.5px;"><i class="fas fa-paperclip mr-1"></i>Anexar a la actividad:</span>'
                                                            + '      <button type="button" class="btn btn-sm btn-outline-info font-weight-bold" onclick="opOpenFileManagerModal(' + index + ', ' + subIndex + ')" style="font-size:11px;" title="Abrir el Gestor de Archivos: clic en un archivo lo vincula a esta actividad"><i class="fas fa-folder-open mr-1"></i> Gestor de Archivos</button>'
                                                            + '      <button type="button" class="btn btn-sm btn-outline-primary font-weight-bold" onclick="opCreateInlineDoc(' + index + ', ' + subIndex + ', \'document\')" style="font-size:11px;"><i class="far fa-file-word mr-1"></i> + Word</button>'
                                                            + '      <button type="button" class="btn btn-sm btn-outline-success font-weight-bold" onclick="opCreateInlineDoc(' + index + ', ' + subIndex + ', \'spreadsheet\')" style="font-size:11px;"><i class="far fa-file-excel mr-1"></i> + Excel</button>'
                                                            + '      <button type="button" class="btn btn-sm btn-outline-warning font-weight-bold" onclick="opCreateInlineDoc(' + index + ', ' + subIndex + ', \'presentation\')" style="font-size:11px;"><i class="far fa-file-powerpoint mr-1"></i> + PPT</button>'
                                                            + '      <label class="btn btn-sm btn-outline-dark font-weight-bold m-0" style="font-size:11px; cursor:pointer;" title="Subir archivo desde tu computador"><i class="fas fa-upload mr-1"></i> Subir PC<input type="file" style="display:none;" onchange="opUploadLocalFileForActivity(' + index + ', ' + subIndex + ', this)"></label>'
                                                            + '    </div>') : '')
                                                        + '  </div>'
                                                        + '  <div class="op-activity-status-row mb-3">'
                                                        + '    ' + statusHtml
                                                        + '  </div>';

                                                    // Caja inline de OnlyOffice si tiene archivo adjunto
                                                    if (fileLink) {
                                                        var href = fileLink.getAttribute('href') || '';
                                                        var match = href.match(/\/api\/files\/(\d+)\/download/);
                                                        var fileId = match ? match[1] : null;
                                                        if (fileId) {
                                                            var ooBtnText = isEditable
                                                                ? '<i class="fas fa-edit mr-1"></i> Ver / Editar Documento'
                                                                : '<i class="fas fa-eye mr-1"></i> Ver Documento (Solo Lectura)';
                                                            cardsHtml += '<div class="card border-0 bg-white p-3 border rounded mb-3 mt-3" style="border-radius:10px !important; border:1px solid #cbd5e1 !important;">'
                                                                + '  <div class="d-flex align-items-center justify-content-between">'
                                                                + '    <div class="d-flex align-items-center gap-2">'
                                                                + '      <i class="fas fa-file-alt text-success fa-lg"></i>'
                                                                + '      <div>'
                                                                + '        <span class="font-weight-bold text-dark d-block" style="font-size:12px;">Documento Adjunto Registrado</span>'
                                                                + '        <span class="text-muted" style="font-size:11px;">Esta actividad ya contiene un archivo guardado.</span>'
                                                                + '      </div>'
                                                                + '    </div>'
                                                                + '    <button type="button" class="btn btn-sm btn-outline-primary font-weight-bold" onclick="opToggleEmbeddedOO(' + index + ', ' + fileId + ', ' + subIndex + ')">' + ooBtnText + '</button>'
                                                                + '  </div>'
                                                                + '  <div id="op-oo-frame-wrapper-' + index + '-' + subIndex + '" style="display:none; height:550px; border:1px solid #cbd5e1; border-radius:10px; overflow:hidden; margin-top:12px;"></div>'
                                                                + '</div>';
                                                        }
                                                    }

                                                    // Detección de archivo adjunto en esta actividad específica (sin duplicar en otras)
                                                    var ooMatch = (existingResponse || '').match(/oo:(\d+):([^\r\n]+)/);
                                                    if (ooMatch) {
                                                        var fileId = ooMatch[1];
                                                        var fileName = ooMatch[2].trim();
                                                        var icon = 'far fa-file-alt text-primary';
                                                        if (/\.(docx|doc)$/i.test(fileName)) icon = 'far fa-file-word text-primary';
                                                        else if (/\.(xlsx|xls|csv)$/i.test(fileName)) icon = 'far fa-file-excel text-success';
                                                        else if (/\.(pptx|ppt)$/i.test(fileName)) icon = 'far fa-file-powerpoint text-warning';
                                                        else if (/\.(pdf)$/i.test(fileName)) icon = 'far fa-file-pdf text-danger';

                                                        cardsHtml += '  <div class="p-2 mb-2 bg-white border rounded d-flex align-items-center justify-content-between" style="border:1px solid #0284c7 !important; border-radius:8px; background:#f0f9ff !important;">'
                                                            + '    <div class="d-flex align-items-center gap-2 text-truncate" style="max-width:400px;">'
                                                            + '      <i class="' + icon + ' fa-lg mr-1"></i>'
                                                            + '      <div>'
                                                            + '        <span class="font-weight-bold text-dark d-block text-truncate" style="font-size:11.5px;">' + fileName + '</span>'
                                                            + '        <span class="text-muted" style="font-size:10px;"><i class="fas fa-check text-success mr-1"></i> Documento vinculado en almacenamiento descentralizado</span>'
                                                            + '      </div>'
                                                            + '    </div>'
                                                            + '    <div class="d-flex align-items-center gap-1">'
                                                            + '      <button type="button" class="btn btn-xs btn-outline-primary font-weight-bold mr-1" onclick="opOpenOOFile(' + fileId + ', \'' + fileName.replace(/'/g, "\\'") + '\')" title="Abre en el editor si es Office; descarga si es correo/binario"><i class="fas fa-eye mr-1"></i> Abrir</button>'
                                                            + '      <button type="button" class="btn btn-xs btn-outline-danger font-weight-bold" onclick="opRemoveAttachmentFromActivity(' + index + ', ' + subIndex + ', ' + fileId + ')" title="Quitar archivo adjunto de esta actividad"><i class="fas fa-trash"></i></button>'
                                                            + '    </div>'
                                                            + '  </div>';
                                                    }

                                                    // Caja de respuestas inline para esta tarjeta con barra de herramientas de adjuntos
                                                    if (isEditable) {
                                                        // Observaciones/Avances: acordeon opcional (progressive disclosure).
                                                        // Colapsado si no hay texto (para no estorbar); desplegado si ya hay observacion.
                                                        // Se ignoran las etiquetas oo:<id> (adjuntos) al decidir: eso ya se ve como tarjeta arriba.
                                                        var _hasObs = (existingResponse || '').replace(/oo:\d+:[^\r\n]+/g, '').trim() !== '';
                                                        cardsHtml += '  <!-- Observaciones: acordeon opcional (progressive disclosure) -->'
                                                            + '  <div class="op-obs-accordion mt-3">'
                                                            + '    <a href="javascript:void(0)" class="op-obs-toggle text-muted font-weight-bold" style="font-size:12px;" onclick="opToggleObservationBlock(' + index + ', ' + subIndex + ')">'
                                                            + '      <i class="fas ' + (_hasObs ? 'fa-chevron-down' : 'fa-chevron-right') + ' mr-1" id="op-obs-chevron-' + index + '-' + subIndex + '"></i> '
                                                            + '<span id="op-obs-label-' + index + '-' + subIndex + '">' + (_hasObs ? 'Conclusión / Nota de Seguimiento' : 'Agregar Conclusión / Nota de Seguimiento (Opcional)') + '</span>'
                                                            + '    </a>'
                                                            + '    <div class="op-obs-body" id="op-obs-body-' + index + '-' + subIndex + '" style="display:' + (_hasObs ? 'block' : 'none') + '; margin-top:8px;">'
                                                            + '      <div class="op-inline-response-box p-3 bg-light border rounded" style="border-radius:10px !important; border:1px solid #cbd5e1 !important;">'
                                                            + '        <div class="d-flex align-items-center justify-content-between mb-2">'
                                                            + '          <label class="font-weight-bold text-dark m-0" style="font-size:12px;"><i class="fas fa-reply text-success mr-1"></i> Registrar Avance u Observación:</label>'
                                                            + '          <span class="badge badge-secondary" style="font-size:9px;">Autoguardado activo</span>'
                                                            + '        </div>'
                                                            + '        <textarea class="form-control mb-2" id="op-detail-response-text-' + index + '-' + subIndex + '" rows="3" spellcheck="true" lang="es" placeholder="Escribe tu observación, hipervínculo o avance aquí..." style="border-radius:6px; font-size:13px; background:#ffffff;" oninput="opTriggerAutosave(' + index + ', ' + subIndex + ')" onblur="opAutoSaveResponse(' + index + ', ' + subIndex + ')">' + existingResponse + '</textarea>'
                                                            + '        <div id="op-autosave-status-' + index + '-' + subIndex + '" style="font-size:11px; font-weight:bold; min-height:16px;">'
                                                            + '          <span class="text-muted"><i class="fas fa-check-circle mr-1"></i> Listo para guardar</span>'
                                                            + '        </div>'
                                                            + '      </div>'
                                                            + '    </div>'
                                                            + '  </div>'
                                                            + '  <!-- Pie de control: siempre visible -->'
                                                            + '  <div class="op-activity-footer d-flex align-items-center justify-content-between flex-wrap gap-2 mt-3 pt-3 border-top" style="gap:8px;">'
                                                            + '    <span class="text-muted" style="font-size:10.5px;"><i class="fas fa-info-circle mr-1"></i>Los cambios de texto se autoguardan; el estado lo decides vos.</span>'
                                                            + '    <button type="button" class="btn btn-success font-weight-bold px-3" onclick="opMarkActivityFinalized(' + index + ', ' + subIndex + ', \'' + idMemoria + '\')" title="Finaliza la actividad (opc=13). Si editaste la descripción, la guarda preservando el numeral."><i class="fas fa-check mr-1"></i> Marcar como TERMINADA</button>'
                                                            + '  </div>'
                                                            + '</div>';
                                                    } else {
                                                        var respText = existingResponse ? existingResponse : 'Sin observaciones registradas.';
                                                        cardsHtml += '  <!-- Area de Respuesta Inline (Solo Lectura) -->'
                                                            + '  <div class="op-inline-response-box p-3 bg-light border rounded mt-3" style="border-radius:10px !important; border:1px solid #cbd5e1 !important;">'
                                                            + '    <div class="d-flex align-items-center justify-content-between mb-2">'
                                                            + '      <label class="font-weight-bold text-dark m-0" style="font-size:12px;"><i class="fas fa-reply text-muted mr-1"></i> Observación Registrada:</label>'
                                                            + '      <span class="badge badge-danger" style="font-size:9px;"><i class="fas fa-lock mr-1"></i> Solo Lectura</span>'
                                                            + '    </div>'
                                                            + '    <textarea class="form-control mb-2" id="op-detail-response-text-' + index + '-' + subIndex + '" rows="3" disabled style="border-radius:6px; font-size:13px; background:#f1f5f9; cursor:not-allowed;">' + respText + '</textarea>'
                                                            + '  </div>'
                                                            + '</div>';
                                                    }
                                                });
                                            } else {
                                                cardsHtml = '<div class="op-activity-item-card mb-4 p-4 border rounded" style="border-radius:12px; background:#ffffff; box-shadow:0 4px 15px rgba(0,0,0,0.04); border:1px solid #cbd5e1;">'
                                                    + '  <div class="op-activity-desc mb-3 p-3 rounded" style="font-size:13px; line-height:1.6; color:#1e293b; font-weight:500; background:#f8fafc; border:1px solid #f1f5f9;">'
                                                    + '    <span class="badge badge-primary mb-1" style="font-size:9px;">ACTIVIDAD DHF</span>'
                                                    + '    <div>Registra tu avance u observación para esta actividad a continuación.</div>'
                                                    + '  </div>'
                                                    + '  <div class="op-activity-status-row mb-3">'
                                                    + '    <span class="op-status-no-atendida"><i class="fas fa-exclamation-triangle mr-1"></i> Sin atender actividad</span>'
                                                    + '  </div>'
                                                    + '  <!-- Area de Respuesta Inline -->'
                                                    + '  <div class="op-inline-response-box p-3 bg-light border rounded mt-3" style="border-radius:10px !important; border:1px solid #cbd5e1 !important;">'
                                                    + '    <div class="d-flex align-items-center justify-content-between mb-2">'
                                                    + '      <label class="font-weight-bold text-dark m-0" style="font-size:12px;"><i class="fas fa-reply text-success mr-1"></i> Registrar Avance u Observación:</label>'
                                                    + '      <span class="badge badge-secondary" style="font-size:9px;">Autoguardado activo</span>'
                                                    + '    </div>'
                                                    + '    <textarea class="form-control mb-2" id="op-detail-response-text-' + index + '-0" rows="3" placeholder="Escribe tu observación o avance aquí..." style="border-radius:6px; font-size:13px; background:#ffffff;" oninput="opTriggerAutosave(' + index + ', 0)" onblur="opAutoSaveResponse(' + index + ', 0)"></textarea>'
                                                    + '    <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 pt-2 border-top" style="gap:8px;">'
                                                    + '      <div id="op-autosave-status-' + index + '-0" style="font-size:11px; font-weight:bold; min-height:16px;">'
                                                    + '        <span class="text-muted"><i class="fas fa-check-circle mr-1"></i> Listo para guardar</span>'
                                                    + '      </div>'
                                                    + '      <div class="d-flex align-items-center flex-wrap gap-1" style="gap:6px;">'
                                                    + '        <button type="button" class="btn btn-sm btn-outline-info font-weight-bold" onclick="opOpenFileManagerModal(' + index + ', 0)" style="font-size:11px;" title="Abrir el Gestor de Archivos: clic en un archivo lo vincula a esta actividad"><i class="fas fa-folder-open mr-1"></i> Gestor de Archivos</button>'
                                                    + '        <button type="button" class="btn btn-sm btn-outline-primary font-weight-bold" onclick="opCreateInlineDoc(' + index + ', 0, \'document\')" style="font-size:11px;"><i class="far fa-file-word mr-1"></i> + Word</button>'
                                                    + '        <button type="button" class="btn btn-sm btn-outline-success font-weight-bold" onclick="opCreateInlineDoc(' + index + ', 0, \'spreadsheet\')" style="font-size:11px;"><i class="far fa-file-excel mr-1"></i> + Excel</button>'
                                                    + '        <button type="button" class="btn btn-sm btn-outline-warning font-weight-bold" onclick="opCreateInlineDoc(' + index + ', 0, \'presentation\')" style="font-size:11px;"><i class="far fa-file-powerpoint mr-1"></i> + PPT</button>'
                                                    + '        <label class="btn btn-sm btn-outline-dark font-weight-bold m-0" style="font-size:11px; cursor:pointer;" title="Subir archivo desde tu computador"><i class="fas fa-upload mr-1"></i> Subir PC<input type="file" style="display:none;" onchange="opUploadLocalFileForActivity(' + index + ', 0, this)"></label>'
                                                    + '      </div>'
                                                    + '    </div>'
                                                    + '  </div>'
                                                    + '</div>';
                                            }

                                            contentWrapper.innerHTML = cardsHtml;
                                            detailPanel.scrollTop = 0;
                                            sessionStorage.setItem('op_split_selected', index);
                                        }

                                        // Navegación fluida global entre actividades en Vista Dividida
                                        window.opGoToActivity = function (targetIdx) {
                                            if (targetIdx < 0 || !_opActivitiesList || targetIdx >= _opActivitiesList.length) return;
                                            var masterPanel = document.getElementById('op-master-panel');
                                            var detailPanel = document.getElementById('op-detail-panel');
                                            if (window._opActivityElements && detailPanel && masterPanel) {
                                                opShowActivityDetail(targetIdx, window._opActivityElements, detailPanel, masterPanel);
                                            }
                                        };

                                        // Insertar Hipervínculo o enlace web externo a la actividad
                                        window.opPromptAddHyperlink = function (index, subIndex) {
                                            var ta = document.getElementById('op-detail-response-text-' + index + '-' + subIndex);
                                            if (!ta) return;
                                            var url = prompt('Ingresa la URL o hipervínculo que deseas anexar a esta actividad:\n(Ejemplo: https://drive.google.com/... o https://midominio.com/documento.pdf)');
                                            if (url && url.trim() !== '') {
                                                url = url.trim();
                                                if (!/^https?:\/\//i.test(url)) {
                                                    url = 'https://' + url;
                                                }
                                                var cur = (ta.value || '').trim();
                                                ta.value = cur ? (cur + '\n' + url) : url;
                                                opAutoSaveResponse(index, subIndex);
                                            }
                                        };

                                        // Crear documento OnlyOffice e incrustarlo directamente en la actividad sin recargar página
                                        window.opCreateInlineDoc = function (index, subIndex, type) {
                                            var statusEl = document.getElementById('op-autosave-status-' + index + '-' + subIndex);
                                            if (statusEl) statusEl.innerHTML = '<span class="text-primary"><i class="fas fa-spinner fa-spin mr-1"></i> Creando documento OnlyOffice...</span>';

                                            var urlMap = {
                                                document: 'http://localhost:8080/api/files/new',
                                                spreadsheet: 'http://localhost:8080/api/files/new/spreadsheet',
                                                presentation: 'http://localhost:8080/api/files/new/presentation'
                                            };

                                            fetch(urlMap[type] || urlMap.document, {
                                                method: 'POST',
                                                headers: { 'Content-Type': 'application/json', 'X-Api-Key': 'opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0' }
                                            })
                                                .then(function (r) { return r.json(); })
                                                .then(function (resp) {
                                                    var fileId = resp && resp.data && (resp.data.fileId || resp.data.id);
                                                    var title = (resp && resp.data && resp.data.title) || (type === 'spreadsheet' ? 'Hoja_de_calculo.xlsx' : (type === 'presentation' ? 'Presentacion.pptx' : 'Documento.docx'));
                                                    if (fileId) {
                                                        var ta = document.getElementById('op-detail-response-text-' + index + '-' + subIndex);
                                                        if (ta) {
                                                            var cur = (ta.value || '').trim();
                                                            var tag = 'oo:' + fileId + ':' + title;
                                                            ta.value = cur ? (cur + '\n' + tag) : tag;
                                                            opAutoSaveResponse(index, subIndex);
                                                        }
                                                        if (typeof OfficePlatform !== 'undefined' && OfficePlatform.openEditor) {
                                                            OfficePlatform.openEditor({ fileId: fileId });
                                                        }
                                                    }
                                                })
                                                .catch(function (err) {
                                                    console.error('[OO] Error creando doc inline:', err);
                                                    if (statusEl) statusEl.innerHTML = '<span class="text-danger"><i class="fas fa-exclamation-circle mr-1"></i> Error al crear</span>';
                                                });
                                        };

                                        // Subir archivo local desde el PC directamente a la actividad
                                        window.opUploadLocalFileForActivity = function (index, subIndex, inputEl) {
                                            if (!inputEl || !inputEl.files || !inputEl.files[0]) return;
                                            var file = inputEl.files[0];
                                            var statusEl = document.getElementById('op-autosave-status-' + index + '-' + subIndex);
                                            if (statusEl) statusEl.innerHTML = '<span class="text-primary"><i class="fas fa-spinner fa-spin mr-1"></i> Subiendo ' + file.name + '...</span>';

                                            // FIX VISIBILIDAD EN EL GESTOR (verificado con curl): el widget sube/lista con el BEARER
                                            // TOKEN del usuario (data-token del script del widget), no con la API-key. Al subir con
                                            // X-Api-Key el archivo queda con dueno = api-key (no un usuario) -> NO aparece en "Mis
                                            // archivos" del usuario que consulta el widget. Subimos IGUAL que el widget: Bearer token +
                                            // scope=private en la query, sin userId explicito (el token porta la identidad). Asi el
                                            // archivo aparece en "Mis archivos" y es descargable con el mismo token (opOpenOOFile usa Bearer).
                                            var _tok = (document.querySelector('script[data-token]') || {}).getAttribute ? (document.querySelector('script[data-token]').getAttribute('data-token') || '') : '';
                                            var formData = new FormData();
                                            formData.append('file', file);
                                            // Contrato REAL (verificado): part JSON @RequestPart("request") con originalFileName obligatorio.
                                            formData.append('request', new Blob([JSON.stringify({ originalFileName: file.name })], { type: 'application/json' }));

                                            var _upUrl, _upHeaders;
                                            if (_tok) {
                                                _upUrl = 'http://localhost:8080/api/files/upload?scope=private';
                                                _upHeaders = { 'Authorization': 'Bearer ' + _tok };
                                            } else {
                                                // Fallback sin token: api-key + scope=shared (global, descargable con la key).
                                                _upUrl = 'http://localhost:8080/api/files/upload?scope=shared';
                                                _upHeaders = { 'X-Api-Key': 'opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0' };
                                            }
                                            fetch(_upUrl, {
                                                method: 'POST',
                                                headers: _upHeaders,
                                                body: formData
                                            })
                                                .then(function (r) { return r.json(); })
                                                .then(function (resp) {
                                                    // CRITICO: usar SOLO el id REAL registrado en Office Platform. NUNCA Date.now()
                                                    // (un id timestamp falso no existe en :8080 -> 404 al abrir la tarjeta).
                                                    var fileId = resp && resp.data && (resp.data.fileId || resp.data.id);
                                                    if (!fileId) { throw new Error('sin-id'); }
                                                    var title = (resp && resp.data && (resp.data.originalFileName || resp.data.title)) || file.name;
                                                    var ta = document.getElementById('op-detail-response-text-' + index + '-' + subIndex);
                                                    if (ta) {
                                                        var cur = (ta.value || '').trim();
                                                        var tag = 'oo:' + fileId + ':' + title;
                                                        ta.value = cur ? (cur + '\n' + tag) : tag;
                                                        opAutoSaveResponse(index, subIndex); // persiste en BD (opc=11) + cache
                                                        // Punto 2 (defensivo): asegurar la persistencia en memoria del anexo aunque
                                                        // opAutoSaveResponse hiciera early-return, para que NO se borre al navegar entre
                                                        // actividades en el indice izquierdo (opShowActivityDetail relee _opResponsesCache).
                                                        opSaveDraft('resp', index + '-' + subIndex, ta.value);
                                                    }
                                                    if (window.opToast) opToast('<i class="fas fa-cloud-upload-alt mr-1"></i> Archivo guardado en Gestor Descentralizado y vinculado a la actividad');
                                                    // Punto 2: re-render inmediato de la actividad -> la tarjeta del adjunto aparece al
                                                    // instante (leida del cache). La descripcion se conserva via _opDescCache y la
                                                    // observacion via _opResponsesCache, asi el re-render no pierde nada.
                                                    var _dp = document.getElementById('op-detail-panel');
                                                    var _mp = document.getElementById('op-master-panel');
                                                    var _stillHere = (typeof _opActiveActivityIndex === 'undefined') || (_opActiveActivityIndex === index);
                                                    if (_stillHere && _dp && _mp && window._opActivityElements && typeof opShowActivityDetail === 'function') {
                                                        opShowActivityDetail(index, window._opActivityElements, _dp, _mp);
                                                    } else if (statusEl) {
                                                        statusEl.innerHTML = '<span class="text-success font-weight-bold"><i class="fas fa-cloud-upload-alt mr-1"></i> Guardado en Gestor Descentralizado</span>';
                                                    }
                                                })
                                                .catch(function (err) {
                                                    // El archivo NO quedó registrado: NO insertamos una referencia rota (evita el 404).
                                                    if (statusEl) statusEl.innerHTML = '<span class="text-danger font-weight-bold"><i class="fas fa-exclamation-triangle mr-1"></i> No se pudo subir "' + file.name + '" al gestor. Intente de nuevo.</span>';
                                                });
                                        };

                                        // Obtener Widget Token de autenticación hacia OfficePlatform (Puerto 8080)
                                        window.opGetWidgetToken = function () {
                                            if (window._opWidgetToken) return Promise.resolve(window._opWidgetToken);
                                            var cedulaInput = document.querySelector('input[name="id_usuario"]') || document.querySelector('input[name="cedula"]');
                                            var cedula = (cedulaInput ? cedulaInput.value : '') || '10001';
                                            var userMenu = document.querySelector('.dropdown-toggle') || document.querySelector('.d-sm-none.d-lg-inline-block');
                                            var userName = (userMenu ? (userMenu.textContent || '') : '').trim().replace(/Hola,\s*/i, '') || 'Usuario';

                                            return fetch('http://localhost:8080/api/auth/resolve', {
                                                method: 'POST',
                                                headers: { 'Content-Type': 'application/json' },
                                                body: JSON.stringify({
                                                    cedula: cedula,
                                                    nombre: userName,
                                                    apiKey: 'opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0'
                                                })
                                            })
                                            .then(function (r) { return r.json(); })
                                            .then(function (resp) {
                                                var token = (resp && resp.data && resp.data.widgetToken) || '';
                                                window._opWidgetToken = token;
                                                return token;
                                            })
                                            .catch(function () { return ''; });
                                        };

                                        // Gestor de Archivos Descentralizados (Office Platform)
                                        window.opOpenFileManagerForActivity = function (index, subIndex) {
                                            var modalId = 'op-fm-modal';
                                            var existingModal = document.getElementById(modalId);
                                            if (existingModal) existingModal.remove();

                                            var modalHtml = ''
                                                + '<div class="modal fade show" id="' + modalId + '" tabindex="-1" style="display:block; background:rgba(0,0,0,0.6); z-index:999999;">'
                                                + '  <div class="modal-dialog modal-dialog-centered" style="max-width:1200px; width:95vw; margin:2.5vh auto;">'
                                                + '    <div class="modal-content" style="border-radius:12px; overflow:hidden; border:none; box-shadow:0 25px 60px rgba(0,0,0,0.3); height:85vh; display:flex; flex-direction:column;">'
                                                + '      <div class="modal-header py-3 px-4" style="background:linear-gradient(90deg,#0f172a,#1e3a5f); border:none; flex:0 0 auto;">'
                                                + '        <div class="d-flex align-items-center gap-2"><i class="fas fa-folder-open text-warning mr-2"></i><h5 class="modal-title font-weight-bold m-0 text-white" style="font-size:15px;">Gestor de Archivos del Proyecto (Office Platform)</h5></div>'
                                                + '        <button type="button" class="close text-white" style="opacity:0.9; text-shadow:none;" onclick="document.getElementById(\'' + modalId + '\').remove()">&times;</button>'
                                                + '      </div>'
                                                + '      <div class="op-fm-actionbar d-flex align-items-center justify-content-between flex-wrap px-4 pt-2" style="background:#ffffff; border-bottom:1px solid #e2e8f0; gap:10px; flex:0 0 auto;">'
                                                + '        <div class="op-fm-tabs d-flex align-items-center" role="tablist">'
                                                + '          <button type="button" class="op-fm-tab op-fm-tab-active" data-tab="mis" onclick="opFmSwitchTab(\'mis\', ' + index + ', ' + subIndex + ', \'' + modalId + '\')"><i class="far fa-folder mr-1"></i> Mis archivos <span class="op-fm-badge" id="op-fm-c-mis">0</span></button>'
                                                + '          <button type="button" class="op-fm-tab" data-tab="comp" onclick="opFmSwitchTab(\'comp\', ' + index + ', ' + subIndex + ', \'' + modalId + '\')"><i class="fas fa-share-alt mr-1"></i> Compartidos <span class="op-fm-badge" id="op-fm-c-comp">0</span></button>'
                                                + '          <button type="button" class="op-fm-tab" data-tab="rec" onclick="opFmSwitchTab(\'rec\', ' + index + ', ' + subIndex + ', \'' + modalId + '\')"><i class="far fa-clock mr-1"></i> Recientes <span class="op-fm-badge" id="op-fm-c-rec">0</span></button>'
                                                + '        </div>'
                                                + '        <div class="d-flex align-items-center flex-wrap" style="gap:8px; padding-bottom:8px;">'
                                                + '          <select id="op-fm-typefilter" class="form-control form-control-sm" onchange="opFmSwitchTab(window._opFmActiveTab||\'mis\', ' + index + ', ' + subIndex + ', \'' + modalId + '\')" style="width:135px; font-size:12px; border-radius:6px;"><option value="">Todos los tipos</option><option value="word">Word</option><option value="excel">Excel</option><option value="ppt">PowerPoint</option><option value="pdf">PDF</option></select>'
                                                + '          <div class="btn-group btn-group-sm" role="group">'
                                                + '            <button type="button" id="op-fm-view-grid" class="btn btn-outline-secondary active" onclick="opFmSetView(\'grid\', ' + index + ', ' + subIndex + ', \'' + modalId + '\')" title="Cuadrícula"><i class="fas fa-th"></i></button>'
                                                + '            <button type="button" id="op-fm-view-list" class="btn btn-outline-secondary" onclick="opFmSetView(\'list\', ' + index + ', ' + subIndex + ', \'' + modalId + '\')" title="Lista"><i class="fas fa-list"></i></button>'
                                                + '          </div>'
                                                + '          <div style="position:relative;"><i class="fas fa-search" style="position:absolute; left:12px; top:50%; transform:translateY(-50%); color:#94a3b8; font-size:11px;"></i><input type="text" id="op-fm-search" class="form-control form-control-sm" placeholder="Buscar archivo..." oninput="opFilterFmFiles(this.value)" style="border-radius:20px; font-size:12px; padding-left:30px; width:200px;"></div>'
                                                + '        </div>'
                                                + '      </div>'
                                                + '      <div id="op-fm-file-list" class="op-fm-grid" style="flex:1 1 auto; overflow-y:auto; background:#f8fafc; padding:18px 24px;">'
                                                + '        <div class="text-center p-4 text-muted" style="grid-column:1 / -1;"><i class="fas fa-spinner fa-spin fa-2x mb-2"></i><p>Conectando con almacenamiento…</p></div>'
                                                + '      </div>'
                                                + '      <div class="modal-footer bg-white py-2 px-4 d-flex justify-content-between" style="flex:0 0 auto;">'
                                                + '        <span class="text-muted" style="font-size:11px;"><i class="fas fa-shield-alt text-success mr-1"></i> MinIO / S3 Storage Conectado</span>'
                                                + '        <button type="button" class="btn btn-secondary btn-sm font-weight-bold" onclick="document.getElementById(\'' + modalId + '\').remove()">Cerrar</button>'
                                                + '      </div>'
                                                + '      <style>'
                                                + '        #' + modalId + ' .op-fm-tab{background:transparent;border:none;border-bottom:2px solid transparent;color:#64748b;font-size:12.5px;font-weight:600;padding:8px 14px;cursor:pointer;white-space:nowrap;}'
                                                + '        #' + modalId + ' .op-fm-tab:hover{color:#0f172a;}'
                                                + '        #' + modalId + ' .op-fm-tab-active{color:#0284c7;border-bottom-color:#0284c7;}'
                                                + '        #' + modalId + ' .op-fm-badge{display:inline-block;background:#e2e8f0;color:#475569;border-radius:10px;font-size:10px;padding:1px 7px;margin-left:4px;font-weight:700;}'
                                                + '        #' + modalId + ' .op-fm-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(160px,1fr));gap:14px;align-content:start;}'
                                                + '        #' + modalId + ' .op-fm-card{background:#ffffff;border:1px solid #e2e8f0;border-radius:10px;padding:14px 10px 10px;text-align:center;transition:all .15s ease;display:flex;flex-direction:column;align-items:center;}'
                                                + '        #' + modalId + ' .op-fm-card:hover{border-color:#0284c7;box-shadow:0 6px 18px rgba(2,132,199,0.12);transform:translateY(-2px);}'
                                                + '        #' + modalId + '.op-fm-listmode #op-fm-file-list{display:block;}'
                                                + '        #' + modalId + '.op-fm-listmode .op-fm-row{display:flex;align-items:center;gap:12px;background:#fff;border:1px solid #e2e8f0;border-radius:8px;padding:8px 12px;margin-bottom:8px;}'
                                                + '        #' + modalId + '.op-fm-listmode .op-fm-row:hover{border-color:#0284c7;}'
                                                + '      </style>'
                                                + '    </div>'
                                                + '  </div>'
                                                + '</div>';

                                            var div = document.createElement('div');
                                            div.innerHTML = modalHtml;
                                            document.body.appendChild(div.firstElementChild);

                                            opGetWidgetToken().then(function (token) {
                                                var headers = {};
                                                if (token) headers['Authorization'] = 'Bearer ' + token;
                                                headers['X-Api-Key'] = 'opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0';

                                                Promise.all([
                                                    fetch('http://localhost:8080/api/files/all?scope=shared', { headers: headers }).then(function (r) { return r.json(); }).catch(function () { return { data: [] }; }),
                                                    fetch('http://localhost:8080/api/files/all?scope=private', { headers: headers }).then(function (r) { return r.json(); }).catch(function () { return { data: [] }; }),
                                                    fetch('http://localhost:8080/api/files?scope=shared', { headers: headers }).then(function (r) { return r.json(); }).catch(function () { return { data: [] }; })
                                                ]).then(function (results) {
                                                    var extract = function (res) { return (res && res.data) || (res && res.files) || (Array.isArray(res) ? res : []); };
                                                    var dedupe = function (arr) { var s = {}, o = []; arr.forEach(function (it) { var id = it && (it.id || it.fileId); if (id && !s[id]) { s[id] = 1; o.push(it); } }); return o; };
                                                    var sharedRaw = extract(results[0]).concat(extract(results[2]));
                                                    var privateRaw = extract(results[1]);
                                                    window._opFmShared = dedupe(sharedRaw);
                                                    window._opFmPrivate = dedupe(privateRaw);
                                                    var allF = dedupe(sharedRaw.concat(privateRaw));
                                                    window._opFmCachedFiles = allF;
                                                    window._opFmRecent = allF.slice().sort(function (a, b) {
                                                        var da = new Date(a.updatedAt || a.createdAt || a.date || a.modified || 0).getTime() || 0;
                                                        var db = new Date(b.updatedAt || b.createdAt || b.date || b.modified || 0).getTime() || 0;
                                                        return db - da;
                                                    }).slice(0, 30);
                                                    var setC = function (id, n) { var e = document.getElementById(id); if (e) e.textContent = n; };
                                                    setC('op-fm-c-mis', window._opFmPrivate.length);
                                                    setC('op-fm-c-comp', window._opFmShared.length);
                                                    setC('op-fm-c-rec', window._opFmRecent.length);
                                                    // Default: abrir en el primer tab con contenido para no mostrar el modal vacio
                                                    var _opDefTab = window._opFmPrivate.length ? 'mis' : (window._opFmRecent.length ? 'rec' : 'comp');
                                                    opFmSwitchTab(_opDefTab, index, subIndex, modalId);
                                                }).catch(function (err) {
                                                    console.error('[FM] Error consultando gestor de archivos:', err);
                                                    var list = document.getElementById('op-fm-file-list');
                                                    if (list) list.innerHTML = '<div class="text-center p-4 text-danger" style="grid-column:1 / -1;"><i class="fas fa-exclamation-triangle fa-2x mb-2"></i><p>No se pudo conectar con el Gestor de Archivos.</p></div>';
                                                });
                                            });
                                        };

                                        function renderFmGrid(files, index, subIndex, modalId) {
                                            var grid = document.getElementById('op-fm-file-list');
                                            if (!grid) return;
                                            // Filtro por tipo (cliente) sobre la data ya cargada de /api/files
                                            var tf = (document.getElementById('op-fm-typefilter') || {}).value || '';
                                            function typeOf(name) { if (/\.(docx|doc|odt)$/i.test(name)) return 'word'; if (/\.(xlsx|xls|csv|ods)$/i.test(name)) return 'excel'; if (/\.(pptx|ppt|odp)$/i.test(name)) return 'ppt'; if (/\.(pdf)$/i.test(name)) return 'pdf'; return 'other'; }
                                            var isList = (window._opFmView === 'list');
                                            var listFiles = (files || []).filter(function (f) {
                                                if (!tf) return true;
                                                return typeOf(f.originalFileName || f.title || f.name || f.filename || '') === tf;
                                            });
                                            if (listFiles.length === 0) {
                                                grid.innerHTML = '<div class="text-center p-5 text-muted" style="grid-column:1 / -1;"><i class="fas fa-folder-open fa-2x mb-2"></i><p style="font-size:12px;">No hay archivos' + (tf ? ' de ese tipo' : '') + ' en esta vista.</p></div>';
                                                return;
                                            }
                                            var html = '';
                                            listFiles.forEach(function (f) {
                                                var fId = f.id || f.fileId;
                                                var fTitle = f.originalFileName || f.title || f.name || f.filename || ('Archivo_' + fId);
                                                var icon = 'far fa-file-alt', col = '#64748b';
                                                if (/\.(docx|doc)$/i.test(fTitle)) { icon = 'far fa-file-word'; col = '#2b579a'; }
                                                else if (/\.(xlsx|xls|csv)$/i.test(fTitle)) { icon = 'far fa-file-excel'; col = '#217346'; }
                                                else if (/\.(pptx|ppt)$/i.test(fTitle)) { icon = 'far fa-file-powerpoint'; col = '#d24726'; }
                                                else if (/\.(pdf)$/i.test(fTitle)) { icon = 'far fa-file-pdf'; col = '#e11d48'; }
                                                else if (/\.(eml|msg)$/i.test(fTitle)) { icon = 'far fa-envelope'; col = '#0284c7'; }
                                                var esc = fTitle.replace(/'/g, "\\'");
                                                var safeTitle = fTitle.replace(/"/g, '&quot;');
                                                var verBtn = '<button type="button" class="btn btn-xs btn-outline-secondary' + (isList ? '' : ' flex-fill') + '" style="font-size:10.5px; font-weight:600;" onclick="if(typeof opOpenOOFile===\'function\'){opOpenOOFile(' + fId + ',\'' + esc + '\');}else if(typeof OfficePlatform!==\'undefined\'){OfficePlatform.openEditor({fileId:' + fId + '});}" title="Abre en el editor si es Office; descarga si es correo/binario"><i class="fas fa-eye"></i></button>';
                                                var addBtn = '<button type="button" class="btn btn-xs btn-primary' + (isList ? '' : ' flex-fill') + '" style="font-size:10.5px; font-weight:700;" onclick="opSelectFmFileForActivity(' + index + ', ' + subIndex + ', ' + fId + ', \'' + esc + '\', \'' + modalId + '\')" title="Vincular / Adjuntar a la actividad"><i class="fas fa-plus mr-1"></i>Vincular</button>';
                                                if (isList) {
                                                    html += '<div class="op-fm-row" data-title="' + fTitle.toLowerCase().replace(/"/g, '') + '">'
                                                        + '  <i class="' + icon + '" style="font-size:24px; color:' + col + '; flex:0 0 auto;"></i>'
                                                        + '  <div style="flex:1 1 auto; min-width:0;"><div class="text-truncate" title="' + safeTitle + '" style="font-size:12.5px; font-weight:600; color:#1e293b;">' + fTitle + '</div><div style="font-size:10px; color:#94a3b8;">ID ' + fId + '</div></div>'
                                                        + '  <div class="d-flex" style="gap:6px; flex:0 0 auto;">' + verBtn + addBtn + '</div>'
                                                        + '</div>';
                                                } else {
                                                    html += '<div class="op-fm-card" data-title="' + fTitle.toLowerCase().replace(/"/g, '') + '">'
                                                        + '  <i class="' + icon + '" style="font-size:34px; color:' + col + '; margin-bottom:8px;"></i>'
                                                        + '  <span title="' + safeTitle + '" style="font-size:11.5px; font-weight:600; color:#1e293b; line-height:1.3; word-break:break-word; display:-webkit-box; -webkit-line-clamp:2; line-clamp:2; -webkit-box-orient:vertical; overflow:hidden; min-height:30px;">' + fTitle + '</span>'
                                                        + '  <span style="font-size:9.5px; color:#94a3b8; margin-top:2px;">ID ' + fId + '</span>'
                                                        + '  <div class="d-flex w-100 mt-2" style="gap:5px;">' + verBtn + addBtn + '</div>'
                                                        + '</div>';
                                                }
                                            });
                                            grid.innerHTML = html;
                                        }
                                        window.opFmSetView = function (view, index, subIndex, modalId) {
                                            window._opFmView = view;
                                            var modal = document.getElementById(modalId);
                                            if (modal) { if (view === 'list') modal.classList.add('op-fm-listmode'); else modal.classList.remove('op-fm-listmode'); }
                                            var g = document.getElementById('op-fm-view-grid'), l = document.getElementById('op-fm-view-list');
                                            if (g) g.classList.toggle('active', view === 'grid');
                                            if (l) l.classList.toggle('active', view === 'list');
                                            opFmSwitchTab(window._opFmActiveTab || 'mis', index, subIndex, modalId);
                                        };

                                        window.opFmSwitchTab = function (tab, index, subIndex, modalId) {
                                            window._opFmActiveTab = tab;
                                            var tabs = document.querySelectorAll('#' + modalId + ' .op-fm-tab');
                                            tabs.forEach(function (t) {
                                                if (t.getAttribute('data-tab') === tab) t.classList.add('op-fm-tab-active');
                                                else t.classList.remove('op-fm-tab-active');
                                            });
                                            var list = tab === 'comp' ? (window._opFmShared || []) : tab === 'rec' ? (window._opFmRecent || []) : (window._opFmPrivate || []);
                                            renderFmGrid(list, index, subIndex, modalId);
                                            var s = document.getElementById('op-fm-search');
                                            if (s && s.value) opFilterFmFiles(s.value);
                                        };

                                        window.opFilterFmFiles = function (query) {
                                            var q = (query || '').toLowerCase().trim();
                                            var items = document.querySelectorAll('#op-fm-modal .op-fm-card, #op-fm-modal .op-fm-row');
                                            items.forEach(function (item) {
                                                var title = item.getAttribute('data-title') || '';
                                                item.style.display = (!q || title.indexOf(q) !== -1) ? '' : 'none';
                                            });
                                        };

                                        window.opSelectFmFileForActivity = function (index, subIndex, fileId, title, modalId) {
                                            var ta = document.getElementById('op-detail-response-text-' + index + '-' + subIndex);
                                            if (ta) {
                                                var cur = (ta.value || '').trim();
                                                var tag = 'oo:' + fileId + ':' + title;
                                                ta.value = cur ? (cur + '\n' + tag) : tag;
                                                opAutoSaveResponse(index, subIndex);
                                            }
                                            var modal = document.getElementById(modalId);
                                            if (modal) modal.remove();
                                        };

                                        // Quitar adjunto de una actividad
                                        window.opRemoveAttachmentFromActivity = function (index, subIndex, fileId) {
                                            var ta = document.getElementById('op-detail-response-text-' + index + '-' + subIndex);
                                            if (ta) {
                                                var cur = (ta.value || '');
                                                var regex = new RegExp('oo:' + fileId + ':[^\\r\\n]*', 'g');
                                                ta.value = cur.replace(regex, '').replace(/\n\s*\n/g, '\n').trim();
                                                opAutoSaveResponse(index, subIndex);
                                            }
                                            // Refrescar panel de detalle
                                            opShowActivityDetail(index, window._opActivityElements, document.getElementById('op-detail-panel'), document.getElementById('op-master-panel'));
                                        };

                                        // Normalizar texto para búsquedas robustas
                                        function normalizeText(str) {
                                            return (str || '').toLowerCase()
                                                .replace(/[^a-z0-9]/g, '')
                                                .trim();
                                        }

                                        // Resolver robustamente la tabla de actividad activa (soporta movimiento de DOM en Vista Dividida)
                                        window.opGetActivityElement = function (index) {
                                            if (window._opActivityElements && window._opActivityElements[index]) {
                                                return window._opActivityElements[index];
                                            }
                                            var tables = document.querySelectorAll('#Formulario table.table-bordered, table.table-bordered');
                                            return tables[index] || null;
                                        };

                                        // Guardar respuesta u observación directa ingresada en el textarea inline
                                        window.opSubmitDetailResponse = function (index) {
                                            var ta = document.getElementById('op-detail-response-text-' + index);
                                            if (!ta) return;
                                            var text = (ta.value || '').trim();
                                            if (!text) {
                                                alert('Por favor escribe tu observación o respuesta antes de guardar.');
                                                ta.focus();
                                                return;
                                            }

                                            opOpenRegisterForActivity(index);
                                            setTimeout(function () {
                                                var modalTa = document.getElementById('op-register-desc');
                                                if (modalTa) modalTa.value = text;
                                                var textInput = document.getElementById('textInput');
                                                if (textInput) {
                                                    var existing = (textInput.value || '').trim();
                                                    var ooRef = (existing.indexOf('oo:') === 0) ? existing : '';
                                                    textInput.value = ooRef ? (text ? (text + '\n' + ooRef) : ooRef) : text;
                                                }

                                                // Asegurar campo fecha
                                                var fechaInput = document.getElementById('fecha_reg');
                                                if (fechaInput && !fechaInput.value) {
                                                    var today = new Date().toISOString().split('T')[0];
                                                    fechaInput.value = today;
                                                }

                                                var form = document.querySelector('#Ventana1 form') || (modalTa ? modalTa.closest('form') : null);
                                                if (form) {
                                                    if (typeof window.validate !== 'function') {
                                                        window.validate = function () { return true; };
                                                    }

                                                    var submitBtn = form.querySelector('input[type="submit"]') || form.querySelector('button[type="submit"]');
                                                    if (submitBtn) {
                                                        submitBtn.click();
                                                    } else {
                                                        if (typeof form.requestSubmit === 'function') {
                                                            form.requestSubmit();
                                                        } else {
                                                            form.submit();
                                                        }
                                                    }
                                                } else {
                                                    alert('Error: Formulario de registro no encontrado.');
                                                }
                                            }, 150);
                                        };

                                        // Guardar de forma asíncrona (AJAX) en segundo plano para el autoguardado
                                        window.opAutoSaveResponse = function (index, subIndex) {
                                            var urlParams = new URLSearchParams(window.location.search);
                                            var estadoM = urlParams.get('estadoM') || '1';
                                            if (estadoM !== '1') return; // no guardar si está bloqueada/finalizada

                                            var ta = document.getElementById('op-detail-response-text-' + index + '-' + subIndex);
                                            if (!ta) return;
                                            var text = (ta.value || '').trim();
                                            if (!text) return; // no guardar vacíos automáticamente

                                            // Guardar inmediatamente en cache (memoria + sessionStorage: sobrevive F5)
                                            var cacheKey = index + '-' + subIndex;
                                            opSaveDraft('resp', cacheKey, text);

                                            var statusIndicator = document.getElementById('op-autosave-status-' + index + '-' + subIndex);
                                            if (statusIndicator) {
                                                statusIndicator.innerHTML = '<span class="text-warning"><i class="fas fa-spinner fa-spin mr-1"></i> Guardando en base de datos...</span>';
                                            }

                                            // 1. Obtener id_memoria (cba_num / collapseExample) de la actividad
                                            var card = ta.closest('.op-activity-item-card');
                                            var idMemoria = card ? card.getAttribute('data-id-memoria') : '';
                                            if (!idMemoria) {
                                                var activityEl = opGetActivityElement(index);
                                                if (activityEl) {
                                                    var mCol = activityEl.innerHTML.match(/collapseExample(\d+)/i);
                                                    if (mCol) idMemoria = mCol[1];
                                                    if (!idMemoria) {
                                                        var link = activityEl.querySelector('a[href*="cba_num="]');
                                                        if (link) {
                                                            var match = link.getAttribute('href').match(/cba_num=(\d+)/);
                                                            if (match) idMemoria = match[1];
                                                        }
                                                    }
                                                    if (!idMemoria) {
                                                        var btn = activityEl.querySelector('button[onclick*="ProyectoEstado2"]');
                                                        if (btn) {
                                                            var matchBtn = btn.getAttribute('onclick').match(/ProyectoEstado2\([^,]+,[^,]+,(\d+)/);
                                                            if (matchBtn) idMemoria = matchBtn[1];
                                                        }
                                                    }
                                                }
                                            }

                                            // 2. Parámetros del sistema
                                            var ipyInp = document.querySelector('input[name="ipy"]');
                                            var ipy = urlParams.get('ipy') || (ipyInp ? ipyInp.value : '') || '';
                                            var estado = estadoM;
                                            var usrInp = document.querySelector('input[name="id_usuario"]');
                                            var idUsuario = (usrInp ? usrInp.value : '') || '1';
                                            var userMenu = document.querySelector('.dropdown-toggle') || document.querySelector('.d-sm-none.d-lg-inline-block');
                                            var userName = (userMenu ? (userMenu.textContent || '') : '').trim().replace(/Hola,\s*/i, '') || 'Usuario';
                                            var today = (new Date()).toISOString().split('T')[0];
                                            var finalObs = text; // Usar exclusivamente el texto y adjuntos propios de esta actividad específica

                                            var params = new URLSearchParams();
                                            var opc = '11'; // RESPONDER ACTIVIDAD (Atender actividad)

                                            if (idMemoria) {
                                                params.append('ipy', ipy);
                                                params.append('estado', estado);
                                                params.append('id_memoria', idMemoria);
                                                params.append('id_usuario', idUsuario);
                                                params.append('usuario', userName);
                                                params.append('fecha_reg', today);
                                                params.append('observacion', finalObs);
                                                params.append('Cbx_enviar_autor', '0');
                                                params.append('form_ant', '');
                                                params.append('Tipo_log', 'RESPONSABLE');
                                            } else {
                                                opc = '9';
                                                params.append('ipy', ipy);
                                                params.append('estado', estado);
                                                params.append('id_usuario', idUsuario);
                                                params.append('fecha_reg', today);
                                                var realSelect = document.querySelector('#Ventana1 select[name="numeral"]') || document.querySelector('select[name="numeral"]');
                                                params.append('numeral', realSelect ? realSelect.value : '');
                                                params.append('personas', '[' + idUsuario + ']');
                                                params.append('observacion', finalObs);
                                            }

                                            fetch('Proyecto?opc=' + opc, {
                                                method: 'POST',
                                                headers: {
                                                    'Content-Type': 'application/x-www-form-urlencoded',
                                                    'X-Requested-With': 'XMLHttpRequest'
                                                },
                                                body: params.toString()
                                            })
                                                .then(function (response) {
                                                    return response.text();
                                                })
                                                .then(function (htmlText) {
                                                    if (statusIndicator) {
                                                        var now = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
                                                        statusIndicator.innerHTML = '<span class="text-success font-weight-bold"><i class="fas fa-check-circle mr-1"></i> Guardado automáticamente (' + now + ')</span>';
                                                    }

                                                    try {
                                                        // Actualizar la tarjeta localmente en el panel de detalles para remover la alerta de "Sin atender"
                                                        var activeCard = ta.closest('.op-activity-item-card');
                                                        if (activeCard) {
                                                            var statusRow = activeCard.querySelector('.op-activity-status-row');
                                                            if (statusRow) {
                                                                statusRow.innerHTML = '<div class="d-block mb-1"><span class="op-status-atendida"><i class="fas fa-check-circle mr-1"></i> Atendida</span></div>'
                                                                    + '<div class="p-3 bg-light rounded text-dark font-weight-normal border-left-success" style="font-size:12px; border-left:4px solid #10b981; line-height:1.5; margin-top:6px; box-shadow:inset 0 1px 3px rgba(0,0,0,0.02);">' + opFormatHyperlinksAndTags(text) + '</div>';
                                                            }
                                                        }

                                                        // Actualizar el DOM local del reporte para reflejar la nueva respuesta
                                                        var targetTable = opGetActivityElement(index);
                                                        if (targetTable) {
                                                            var allRows = targetTable.querySelectorAll('tr');
                                                            var sinAtenderFound = false;
                                                            for (var r = 0; r < allRows.length; r++) {
                                                                var rowText = (allRows[r].textContent || '').trim();
                                                                if (rowText.indexOf('SIN ATENDER ACTIVIDAD') !== -1) {
                                                                    var tdCount = allRows[r].cells ? allRows[r].cells.length : 1;
                                                                    allRows[r].innerHTML = '<td colspan="' + tdCount + '" class="text-success font-weight-bold"><b>Responsable : </b>' + userName + '<br><b>Respuesta : </b>' + text + '</td>';
                                                                    sinAtenderFound = true;
                                                                    break;
                                                                }
                                                            }
                                                            if (!sinAtenderFound) {
                                                                for (var r2 = 0; r2 < allRows.length; r2++) {
                                                                    var rowText2 = (allRows[r2].textContent || '').trim();
                                                                    if (/RESPUESTAS/i.test(rowText2) || /Responsable/i.test(rowText2)) {
                                                                        var cell = allRows[r2].cells ? allRows[r2].cells[0] : null;
                                                                        if (cell) {
                                                                            cell.className = 'text-success font-weight-bold';
                                                                            cell.innerHTML = '<b>Responsable : </b>' + userName + '<br><b>Respuesta : </b>' + text;
                                                                        }
                                                                        break;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    } catch (domErr) {
                                                        console.warn('[Autosave DOM Warning]:', domErr);
                                                    }
                                                })
                                                .catch(function (err) {
                                                    console.error('[Autosave Error]:', err);
                                                    if (statusIndicator) {
                                                        statusIndicator.innerHTML = '<span class="text-danger font-weight-bold"><i class="fas fa-exclamation-triangle mr-1"></i> Error al guardar en BD</span>';
                                                    }
                                                });
                                        };

                                        // Control de debounce para evitar llamadas excesivas al escribir
                                        window._opAutosaveDebounceTimer = null;
                                        window.opTriggerAutosave = function (index, subIndex) {
                                            var statusIndicator = document.getElementById('op-autosave-status-' + index + '-' + subIndex);
                                            if (statusIndicator) {
                                                statusIndicator.innerHTML = '<span class="text-muted"><i class="fas fa-pen fa-spin mr-1"></i> Escribiendo...</span>';
                                            }
                                            // Guardar en cache inmediatamente para evitar pérdidas de foco
                                            var ta = document.getElementById('op-detail-response-text-' + index + '-' + subIndex);
                                            if (ta) {
                                                opSaveDraft('resp', index + '-' + subIndex, ta.value);
                                            }
                                            clearTimeout(window._opAutosaveDebounceTimer);
                                            window._opAutosaveDebounceTimer = setTimeout(function () {
                                                opAutoSaveResponse(index, subIndex);
                                            }, 3000); // Guardar 3s tras pausar la escritura (o al blur). NO cambia estado (opc=11).
                                        };

                                        // Abrir modal con opciones avanzadas de OnlyOffice mostradas automáticamente
                                        window.opOpenAdvancedRegister = function (index, subIndex) {
                                            var urlParams = new URLSearchParams(window.location.search);
                                            var estadoM = urlParams.get('estadoM') || '1';
                                            if (estadoM !== '1') {
                                                alert('Acceso Denegado: La memoria se encuentra finalizada o bloqueada y no permite modificaciones.');
                                                return;
                                            }
                                            window._ooActiveIndex = index;
                                            window._ooActiveSubIndex = subIndex;

                                            opOpenRegisterForActivity(index, subIndex);
                                            setTimeout(function () {
                                                var block = document.getElementById('oo-editor-block');
                                                if (block) block.style.display = '';
                                                var btnToggle = document.getElementById('op-register-oo-toggle');
                                                if (btnToggle) btnToggle.style.display = 'none';

                                                if (!window._ooCurrentFileId) {
                                                    if (typeof window.ooCreateDoc === 'function') {
                                                        window.ooCreateDoc('document');
                                                    }
                                                }
                                            }, 200);
                                        };

                                        // Alternar visualización del editor OnlyOffice de forma opcional
                                        window.opToggleEmbeddedOO = function (index, fileId, subIndex) {
                                            var containerId = 'op-oo-frame-wrapper-' + index + '-' + subIndex;
                                            var wrapper = document.getElementById(containerId);
                                            if (!wrapper) return;
                                            if (wrapper.style.display === 'none') {
                                                wrapper.style.display = 'block';
                                                if (typeof window.ooInitEditor === 'function' && !wrapper.getAttribute('data-loaded')) {
                                                    wrapper.setAttribute('data-loaded', 'true');
                                                    window.ooInitEditor({
                                                        containerId: containerId,
                                                        inputId: 'textInput',
                                                        existingFileId: parseInt(fileId, 10),
                                                        autoLoad: true
                                                    });
                                                }
                                            } else {
                                                wrapper.style.display = 'none';
                                            }
                                        };

                                        // Descargar la Memoria de Diseño Completa en formato PDF (Reporte Ejecutivo para Gerencia)
                                        window.opExportFullDocPDF = function () {
                                            var btn = document.getElementById('op-btn-export-pdf');
                                            if (btn) {
                                                btn.disabled = true;
                                                btn.innerHTML = '<i class="fas fa-spinner fa-spin mr-1"></i> Generando PDF...';
                                            }

                                            if (typeof window.opRenderExecutivePreviewDocument === 'function') {
                                                window.opRenderExecutivePreviewDocument();
                                            }

                                            var previewEl = document.getElementById('op-continuous-preview-container');
                                            var exportHtml = previewEl ? previewEl.innerHTML : '';

                                            var overlay = document.createElement('div');
                                            overlay.id = 'op-pdf-render-box';
                                            overlay.style.cssText = 'position:fixed; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,0.6); z-index:9999999; display:flex; justify-content:center; align-items:flex-start; overflow-y:auto; padding:20px;';

                                            var paper = document.createElement('div');
                                            paper.style.cssText = 'width:780px; background:#ffffff; color:#0f172a; padding:24px 30px; box-shadow:0 0 30px rgba(0,0,0,0.4); font-family:Arial,sans-serif; border-radius:4px;';
                                            paper.innerHTML = exportHtml;
                                            overlay.appendChild(paper);
                                            document.body.appendChild(overlay);

                                            var safetyTimeout = setTimeout(function () {
                                                if (document.getElementById('op-pdf-render-box')) {
                                                    overlay.remove();
                                                    if (btn) {
                                                        btn.disabled = false;
                                                        btn.innerHTML = '<i class="fas fa-file-pdf mr-1"></i> Descargar Memoria (PDF)';
                                                    }
                                                }
                                            }, 45000); // fallback amplio: memorias grandes (20+ actividades, html2canvas scale:2) tardan ~20s; el camino de exito (.then) debe ganar la carrera

                                            function executePdfDownload() {
                                                var opt = {
                                                    margin: [8, 8, 8, 8],
                                                    filename: 'Memoria_de_Diseno_DHF.pdf',
                                                    image: { type: 'jpeg', quality: 0.98 },
                                                    html2canvas: { scale: 2, scrollY: 0, useCORS: true, allowTaint: true, logging: false },
                                                    jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' },
                                                    pagebreak: { mode: ['css', 'legacy'], avoid: '.op-preview-activity-card' }
                                                };

                                                window.html2pdf().set(opt).from(paper).save().then(function () {
                                                    clearTimeout(safetyTimeout);
                                                    setTimeout(function () {
                                                        overlay.remove();
                                                        if (btn) {
                                                            btn.disabled = false;
                                                            btn.innerHTML = '<i class="fas fa-file-pdf mr-1"></i> Descargar Memoria (PDF)';
                                                        }
                                                    }, 400);
                                                }).catch(function (err) {
                                                    console.error('[PDF] Error generando descarga directa:', err);
                                                    clearTimeout(safetyTimeout);
                                                    overlay.remove();
                                                    if (btn) {
                                                        btn.disabled = false;
                                                        btn.innerHTML = '<i class="fas fa-file-pdf mr-1"></i> Descargar Memoria (PDF)';
                                                    }
                                                });
                                            }

                                            if (typeof window.html2pdf !== 'undefined') {
                                                // Diferir para que el overlay/spinner PINTE antes del rasterizado de
                                                // html2canvas (que es sincrono y bloquea el hilo). Asi el usuario ve
                                                // "Generando PDF..." en vez de un freeze mudo de la interfaz.
                                                setTimeout(executePdfDownload, 60);
                                            } else {
                                                var script = document.createElement('script');
                                                script.src = 'https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js';
                                                script.onload = executePdfDownload;
                                                script.onerror = function () {
                                                    clearTimeout(safetyTimeout);
                                                    overlay.remove();
                                                    alert('No se pudo cargar la librería de generación PDF.');
                                                    if (btn) {
                                                        btn.disabled = false;
                                                        btn.innerHTML = '<i class="fas fa-file-pdf mr-1"></i> Descargar Memoria (PDF)';
                                                    }
                                                };
                                                document.head.appendChild(script);
                                            }
                                        };

                                        /* ═══════════════════════════════════════════════════════════════════
                                           QUALITY GATES (Progressive Enhancement / Asistencia UX)
                                           IMPORTANTE: esto NO es control normativo. Se bypassea desde URL/POST/
                                           devtools. El enforcement REAL debe vivir en el backend (Proyecto.java),
                                           congelado y escalado en CLAUDE.md §8 (gates A/B/C/D). Aqui solo guiamos
                                           al usuario y prevenimos errores honestos, sin romper handlers legacy.
                                           ═══════════════════════════════════════════════════════════════════ */
                                        (function opInitQualityGates() {
                                            try {
                                                var _opStartISO = null, _opStartResolved = false;
                                                function opTodayISO() {
                                                    var d = new Date();
                                                    return d.getFullYear() + '-' + ('0' + (d.getMonth() + 1)).slice(-2) + '-' + ('0' + d.getDate()).slice(-2);
                                                }
                                                function opGetProjectStartISO() {
                                                    if (_opStartResolved) return _opStartISO;
                                                    _opStartResolved = true;
                                                    try {
                                                        var m = (document.body.innerText || '').match(/INICIO[:\s]+(\d{4}-\d{2}-\d{2})/i);
                                                        _opStartISO = m ? m[1] : null;
                                                    } catch (e) { _opStartISO = null; }
                                                    return _opStartISO;
                                                }
                                                // B: acotar fechas -> min = inicio de proyecto, max = hoy (evita viajes en el tiempo desde la UI)
                                                function opApplyDateGuardsTo(el) {
                                                    if (!el) return;
                                                    var nm = (el.name || '') + ' ' + (el.id || '');
                                                    if (nm.indexOf('fecha_reg') === -1) return;
                                                    el.setAttribute('max', opTodayISO());
                                                    var start = opGetProjectStartISO();
                                                    if (start) el.setAttribute('min', start);
                                                    el.setAttribute('data-op-dateguard', '1');
                                                }
                                                function opApplyAllDateGuards() {
                                                    var inputs = document.querySelectorAll('input[type="date"]');
                                                    for (var i = 0; i < inputs.length; i++) opApplyDateGuardsTo(inputs[i]);
                                                }
                                                // cubre inputs dinamicos (modales/responder) al enfocarlos
                                                document.addEventListener('focusin', function (e) {
                                                    var el = e.target;
                                                    if (el && el.matches && el.matches('input[type="date"]')) opApplyDateGuardsTo(el);
                                                });
                                                setTimeout(opApplyAllDateGuards, 300);

                                                // C: advisory NO destructivo de campos obligatorios en el submit de actividad (uploadFiles).
                                                function opAdvisory(title, msg) {
                                                    if (typeof window.swal === 'function') {
                                                        try { window.swal(title, msg, 'warning'); return; } catch (e) { }
                                                    }
                                                    alert(title + '\n\n' + msg);
                                                }
                                                function opValidateNewActivity(form) {
                                                    var missing = [];
                                                    if (!form) return missing;
                                                    var pers = form.querySelector('select[name="personas"]');
                                                    if (pers && pers.selectedOptions && pers.selectedOptions.length === 0) missing.push('al menos un Responsable');
                                                    var fch = form.querySelector('[name="fecha_reg"]');
                                                    if (fch && !((fch.value || '').trim())) missing.push('la Fecha del registro');
                                                    var desc = form.querySelector('#op-register-desc, textarea[name="descripcion"], [name="descripcion"]');
                                                    if (desc && !((desc.value || '').trim())) missing.push('la Descripción de la actividad');
                                                    return missing;
                                                }
                                                /* ── Seccion 4: feedback de envio + guard anti doble-submit ──
                                                   El 1er click SIEMPRE pasa (no se toca el handler nativo). Solo se bloquean
                                                   clicks EXTRA mientras hay un envio en curso (mitiga el F3 §8.1: duplicados
                                                   del audit trail por doble-click). El visual/disabled se aplica DIFERIDO
                                                   (setTimeout 0) para NO cancelar el submit nativo del primer click. */
                                                var _opSubmitting = false, _opSubmitTimer = null;
                                                function opSubmitToast(on) {
                                                    var id = 'op-submit-toast', t = document.getElementById(id);
                                                    if (on) {
                                                        if (t) return;
                                                        t = document.createElement('div');
                                                        t.id = id;
                                                        t.setAttribute('role', 'status');
                                                        t.style.cssText = 'position:fixed; top:16px; right:16px; z-index:2147483000; background:#0f172a; color:#ffffff; font-family:Arial,sans-serif; font-size:13px; font-weight:600; padding:10px 16px; border-radius:8px; box-shadow:0 6px 20px rgba(0,0,0,0.25); display:flex; align-items:center; gap:8px; pointer-events:none;';
                                                        t.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Procesando…';
                                                        document.body.appendChild(t);
                                                    } else if (t) { t.remove(); }
                                                }
                                                function opSubmitVisual(btn, on) {
                                                    if (btn) {
                                                        if (on) {
                                                            btn.style.pointerEvents = 'none';
                                                            btn.style.opacity = '0.6';
                                                            if (btn.querySelector && !btn.querySelector('.op-submit-spin')) {
                                                                var sp = document.createElement('span');
                                                                sp.className = 'op-submit-spin';
                                                                sp.innerHTML = ' <i class="fas fa-spinner fa-spin"></i>';
                                                                try { btn.appendChild(sp); } catch (e) { }
                                                            }
                                                            if ('disabled' in btn) { try { btn.disabled = true; } catch (e) { } }
                                                        } else {
                                                            btn.style.pointerEvents = '';
                                                            btn.style.opacity = '';
                                                            var s = btn.querySelector ? btn.querySelector('.op-submit-spin') : null;
                                                            if (s) s.remove();
                                                            if ('disabled' in btn) { try { btn.disabled = false; } catch (e) { } }
                                                        }
                                                    }
                                                    opSubmitToast(on);
                                                }
                                                function opResetSubmit(btn) { _opSubmitting = false; opSubmitVisual(btn, false); }

                                                // Controles de ESCRITURA conocidos (submit de actividad / avance / respuesta).
                                                var OP_WRITE_SEL = '[onclick*="uploadFiles"], [onclick*="Enviar_caso"], [onclick*="Enviar("]';

                                                // Un solo listener en CAPTURA: (1) advisory de campos, (2) guard anti doble-submit.
                                                document.addEventListener('click', function (e) {
                                                    var btn = (e.target && e.target.closest) ? e.target.closest(OP_WRITE_SEL) : null;
                                                    if (!btn) return;

                                                    // (2) guard: si ya hay un envio en curso, bloquear clicks extra
                                                    if (_opSubmitting) {
                                                        e.preventDefault();
                                                        e.stopImmediatePropagation();
                                                        return;
                                                    }

                                                    // (1) advisory de campos obligatorios (solo el submit de actividad uploadFiles)
                                                    if (/uploadFiles/.test(btn.getAttribute('onclick') || '')) {
                                                        var missing = opValidateNewActivity(btn.closest('form'));
                                                        if (missing.length > 0) {
                                                            e.preventDefault();
                                                            e.stopImmediatePropagation();
                                                            opAdvisory('Advertencia Normativa (ISO 13485 / 21 CFR Part 11)',
                                                                'Para la trazabilidad del DHF, la actividad requiere: ' + missing.join(', ') + '. Complete estos campos antes de enviar.');
                                                            return; // no marca envio en curso (no se envio nada)
                                                        }
                                                    }

                                                    // submit valido -> marcar en curso (bloquea el 2do click YA); visual DIFERIDO
                                                    // (no cancela el submit nativo del 1er click) + reset de seguridad si no navega.
                                                    _opSubmitting = true;
                                                    var _b = btn;
                                                    setTimeout(function () { opSubmitVisual(_b, true); }, 0);
                                                    clearTimeout(_opSubmitTimer);
                                                    _opSubmitTimer = setTimeout(function () { opResetSubmit(_b); }, 6000);
                                                }, true);

                                                /* ── Enlaces legacy UserFiles (evitar el 404 crudo de Tomcat) ──
                                                   NO inventamos el mapeo real de esos archivos (es backend/almacenamiento).
                                                   Verificamos existencia real (HEAD): si esta, se abre; si no, aviso amigable.
                                                   Es SOLO LECTURA (no toca MemoriaDLog). */
                                                function opLegacyFileAdvisory() {
                                                    opAdvisory('Archivo Histórico Legacy',
                                                        'El documento físico adjunto (enlace UserFiles antiguo) no se encuentra en el servidor local. Contacte al administrador de TI para restaurar el respaldo de archivos UserFiles.');
                                                }
                                                document.addEventListener('click', function (e) {
                                                    var a = (e.target && e.target.closest) ? e.target.closest('a[href*="UserFiles"]') : null;
                                                    if (!a) return;
                                                    var href = a.getAttribute('href') || '';
                                                    if (href.indexOf('UserFiles') === -1) return;
                                                    e.preventDefault();
                                                    e.stopImmediatePropagation();
                                                    var resolved = a.href; // absoluto resuelto por el navegador
                                                    try {
                                                        fetch(resolved, { method: 'HEAD' }).then(function (r) {
                                                            if (r && (r.ok || r.status === 405)) {
                                                                window.open(resolved, '_blank', 'noopener'); // existe (o HEAD no soportado): abrir
                                                            } else {
                                                                opLegacyFileAdvisory();               // 404 u otro: degradar
                                                            }
                                                        }).catch(function () { opLegacyFileAdvisory(); });
                                                    } catch (err) { opLegacyFileAdvisory(); }
                                                }, true);
                                            } catch (e) { /* PE tolerante a fallos: nunca bloquear la pagina */ }
                                        })();

                                        window.opOpenRegisterForActivity = function (index, subIndex) {
                                            var realSelect = document.querySelector('#Ventana1 select[name="numeral"]') || document.querySelector('select[name="numeral"]');
                                            var activityEl = opGetActivityElement(index);
                                            if (!activityEl) return;

                                            // Mostrar Ventana1
                                            if (typeof mostrarConvencion === 'function') {
                                                mostrarConvencion(1);

                                                // SPRINT 9: asegurar que el textarea y boton de anexar estén inicializados
                                                opSetupRegisterAvance();

                                                // Pre-popular la fecha de registro si está vacía
                                                var fechaInput = document.getElementById('fecha_reg');
                                                if (fechaInput && !fechaInput.value) {
                                                    var today = new Date().toISOString().substring(0, 10);
                                                    fechaInput.value = today;
                                                }

                                                // reiniciar el modal a "Solo Texto" por defecto al abrir
                                                var ta = document.getElementById("op-register-desc");
                                                if (ta) {
                                                    var inlineTa = document.getElementById('op-detail-response-text-' + index + '-' + subIndex);
                                                    ta.value = inlineTa ? (inlineTa.value || '').trim() : '';
                                                }
                                                var block = document.getElementById("oo-editor-block");
                                                if (block) block.style.display = "none";
                                                var btnToggle = document.getElementById("op-register-oo-toggle");
                                                if (btnToggle) btnToggle.style.display = "";
                                                window._ooCurrentFileId = null;
                                                var textInput = document.getElementById("textInput");
                                                if (textInput) textInput.value = "";
                                                var container = document.getElementById("oo-editor-container");
                                                if (container) container.innerHTML = "<div id='oo-editor-loading' style='display:flex;align-items:center;justify-content:center;height:100%;color:#aaa;font-size:14px;gap:10px;'><i class='fas fa-spinner fa-spin'> Cargando editor...";

                                                // Buscar coincidencia en el select de forma robusta exclusivamente entre opciones válidas (no vacías)
                                                if (realSelect) {
                                                    var tableText = (activityEl.textContent || activityEl.innerText || '').trim();
                                                    var matchedIndex = -1;

                                                    // 1. Intentar buscar coincidencia completa de sub-etapa en el texto de la tabla
                                                    for (var i = 0; i < realSelect.options.length; i++) {
                                                        var opt = realSelect.options[i];
                                                        if (opt.value && opt.value.trim() !== '' && !opt.disabled && opt.text) {
                                                            var normalizedOpt = normalizeText(opt.text);
                                                            if (normalizeText(tableText).indexOf(normalizedOpt) !== -1) {
                                                                matchedIndex = i;
                                                                break;
                                                            }
                                                        }
                                                    }

                                                    // 2. Si no coincide, buscar por prefijo de letra de la actividad (ej. "A", "B", "C", "D")
                                                    if (matchedIndex === -1) {
                                                        var meta = _opActivitiesList[index] || {};
                                                        var cardTitleText = meta.title || '';
                                                        var codeMatch = cardTitleText.match(/^([A-Z0-9]+)/i) || tableText.match(/^([A-Z0-9]+)/i);
                                                        if (codeMatch) {
                                                            var prefix = codeMatch[1].trim().toLowerCase();
                                                            for (var j = 0; j < realSelect.options.length; j++) {
                                                                var optJ = realSelect.options[j];
                                                                if (optJ.value && optJ.value.trim() !== '' && !optJ.disabled) {
                                                                    var optText = (optJ.text || '').trim().toLowerCase();
                                                                    if (optText.indexOf(prefix + ' -') === 0 || optText.indexOf(prefix + '-') === 0 || optText.indexOf(prefix + ' ') === 0) {
                                                                        matchedIndex = j;
                                                                        break;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }

                                                    // 3. Fallback: primera opción válida del select
                                                    if (matchedIndex === -1) {
                                                        for (var m = 0; m < realSelect.options.length; m++) {
                                                            if (realSelect.options[m].value && realSelect.options[m].value.trim() !== '' && !realSelect.options[m].disabled) {
                                                                matchedIndex = m;
                                                                break;
                                                            }
                                                        }
                                                    }

                                                    if (matchedIndex !== -1) {
                                                        var val = realSelect.options[matchedIndex].value;
                                                        realSelect.value = val;
                                                        if (window.$) {
                                                            $(realSelect).val(val).trigger('change');
                                                        }
                                                        // Limpiar cualquier feedback de error rojo
                                                        var parentCol = realSelect.closest('.col') || realSelect.parentNode;
                                                        if (parentCol) {
                                                            var invalidFb = parentCol.querySelector('.invalid-feedback');
                                                            if (invalidFb) invalidFb.style.display = 'none';
                                                            realSelect.classList.remove('is-invalid');
                                                        }
                                                    }
                                                }

                                                // Pre-popular campo de distribución/personas si no tiene nada seleccionado
                                                var personsSelect = document.querySelector('#Ventana1 select[name="personas"]') || document.querySelector('select[name="personas"]');
                                                if (personsSelect && personsSelect.options.length > 0) {
                                                    var hasSelection = false;
                                                    for (var p = 0; p < personsSelect.options.length; p++) {
                                                        if (personsSelect.options[p].selected) { hasSelection = true; break; }
                                                    }
                                                    if (!hasSelection) {
                                                        for (var k = 0; k < personsSelect.options.length; k++) {
                                                            personsSelect.options[k].selected = true;
                                                        }
                                                        if (window.$ && $.fn.select2) {
                                                            $(personsSelect).trigger('change');
                                                        }
                                                    }
                                                }
                                            }
                                        };

                                        // Crear documento OnlyOffice directamente en la actividad seleccionada
                                        window.opCreateOnlyOfficeForSelected = function (index, type) {
                                            var urlParams = new URLSearchParams(window.location.search);
                                            var estadoM = urlParams.get('estadoM') || '1';
                                            if (estadoM !== '1') {
                                                alert('Acceso Denegado: La memoria se encuentra finalizada o bloqueada y no permite modificaciones.');
                                                return;
                                            }
                                            opOpenRegisterForActivity(index);
                                            setTimeout(function () {
                                                // SPRINT 9: mostrar el editor y ocultar el boton de anexar, luego crear el doc
                                                var block = document.getElementById('oo-editor-block');
                                                if (block) block.style.display = '';
                                                var btnToggle = document.getElementById('op-register-oo-toggle');
                                                if (btnToggle) btnToggle.style.display = 'none';
                                                if (typeof window.ooCreateDoc === 'function') {
                                                    window.ooCreateDoc(type);
                                                }
                                            }, 400);
                                        };

                                        // --- MULTI-STAGE WIZARD DE CARGUE MASIVO DHF ---
                                        window._opBatchWizardStep = 1;
                                        window._opSelectedStages = [];

                                        /* ═══════════════════════════════════════════════════════════════════
                                           Diálogo enriquecido de CIERRE de proyecto (consentimiento informado).
                                           Override diferido de ProyectoProceso (definido en Proyecto.jsp -> TERMINADO):
                                           consulta métricas por FETCH DE LECTURA (opc=7) y muestra el desglose real.
                                           NO autocompleta ni fabrica registros (Opción 1 descartada por ALCOA/21 CFR
                                           Part 11). El cambio de estado sigue siendo el backend (opc=6); aquí solo se
                                           envuelve la confirmación con consentimiento informado. Ver CLAUDE.md §8.9.
                                           ═══════════════════════════════════════════════════════════════════ */
                                        window.opConfirmProjectClose = function (id, finalState) {
                                            // Navegación DIRECTA: no llamar swal.close() antes (la navegación desmonta la página).
                                            var tipoEl = document.getElementById('t_proyecto');
                                            var tipo = (tipoEl && tipoEl.value) ? tipoEl.value : '0';
                                            window.location.href = 'Proyecto?opc=6&id_proyecto=' + id + '&Rdb_consulta=' + encodeURIComponent(tipo) + '&f_salida=' + (finalState || 'TERMINADO');
                                        };
                                        // Listener DELEGADO en fase de captura: corre antes de que SweetAlert v1 gestione el
                                        // click, garantizando que los 3 botones del modal disparen aunque el inline falle.
                                        (function opInstallCloseButtonsDelegate() {
                                            if (window._opCloseBtnsDelegated) return;
                                            window._opCloseBtnsDelegated = true;
                                            document.addEventListener('click', function (e) {
                                                var t = (e.target && e.target.closest) ? e.target.closest('#op-btn-autocomplete, #op-btn-close-pending, #op-btn-cancel') : null;
                                                if (!t) return;
                                                e.preventDefault();
                                                e.stopImmediatePropagation();
                                                if (t.id === 'op-btn-cancel') { try { if (window.swal) swal.close(); } catch (err) { } return; }
                                                var ctx = window._opCloseCtx || {};
                                                if (t.id === 'op-btn-close-pending') { opConfirmProjectClose(ctx.id, ctx.finalState || 'TERMINADO'); return; }
                                                if (t.id === 'op-btn-autocomplete') { opAutocompleteAndFinalize(); return; }
                                            }, true);
                                        })();
                                        function opParseMemoriaMetrics(html) {
                                            try {
                                                var doc = new DOMParser().parseFromString(html, 'text/html');
                                                var tables = doc.querySelectorAll('table.table-bordered');
                                                var total = 0, fin = 0, pendingIds = [], seen = {};
                                                for (var i = 0; i < tables.length; i++) {
                                                    var t = tables[i];
                                                    if (t.querySelector('img') || t.classList.contains('op-wiz-stage-table')) continue;
                                                    var txt = (t.textContent || '');
                                                    if (/AUTOR/i.test(txt)) {
                                                        total++;
                                                        // FINALIZADA solo si tiene el marcador REAL de estado de Tag_memoria:
                                                        // <b class="text-success">FINALIZADO/FINALIZADA</b>. La regex laxa /FINALIZAD/
                                                        // sobre todo el texto marcaba pendientes como finalizadas (respuestas/adjuntos/
                                                        // fase con esa palabra) -> pendingIds incompleto -> actividades no se finalizaban.
                                                        var _fb = t.querySelector('b.text-success');
                                                        if (_fb && /FINALIZAD/i.test(_fb.textContent || '')) {
                                                            fin++;
                                                        } else {
                                                            // pendiente -> id_memoria. Fuente AUTORITATIVA presente en TODA actividad
                                                            // (no permission-gated): el param cba_num de los links historial/modificar/
                                                            // adjuntos = id_memoria (Tag_memoria: id_memoria = getAttribute("cba_num")).
                                                            // Fallbacks: radios ProyectoEstado, o id_memoria/id_memoria_d explicitos.
                                                            var _ih = (t.innerHTML || '');
                                                            var oc = _ih.match(/cba_num=(\d+)/i)
                                                                || _ih.match(/ProyectoEstado\d\(\s*\d+\s*,\s*\d+\s*,\s*(\d+)/)
                                                                || _ih.match(/(?:id_memoria|id_memoria_d|idm)\s*[:=]\s*['"]?(\d+)/i);
                                                            if (oc && !seen[oc[1]]) { seen[oc[1]] = 1; pendingIds.push(oc[1]); }
                                                        }
                                                    }
                                                }
                                                var idU = (doc.querySelector('[name="id_usuario"]') || {}).value || '';
                                                var usr = (doc.querySelector('[name="usuario"]') || {}).value || '';
                                                var em = (doc.querySelector('[name="estadoM"]') || {}).value || (doc.querySelector('[name="estado"]') || {}).value || '1';
                                                return { total: total, finalizadas: fin, pendientes: total - fin, pendingIds: pendingIds, idUsuario: idU, usuario: usr, estadoM: em };
                                            } catch (e) { return null; }
                                        }
                                        function opShowCloseDialog(m, id, finalState) {
                                            if (m && m.pendientes === 0 && m.total > 0) {
                                                // Escenario B: todas finalizadas
                                                swal({
                                                    title: 'Cierre de Proyecto',
                                                    text: '✅ Todas las actividades (' + m.total + ') se encuentran finalizadas satisfactoriamente. ¿Confirmar cierre del proyecto?',
                                                    type: 'success', showCancelButton: true, confirmButtonColor: 'green',
                                                    confirmButtonText: 'Confirmar Cierre', cancelButtonText: 'Cancelar', closeOnConfirm: false
                                                }, function () { opConfirmProjectClose(id, finalState); });
                                            } else if (m && m.pendientes > 0) {
                                                // Escenario A: hay pendientes -> decisión informada del usuario (3 opciones).
                                                // Contexto de escritura para la Opción 1 (autocompletar) — autorizado, ver §8.9.
                                                window._opCloseCtx = { id: id, finalState: finalState, pendingIds: (m.pendingIds || []), pendientes: m.pendientes, idUsuario: m.idUsuario, usuario: m.usuario, estadoM: m.estadoM || '1' };
                                                var _bs = 'width:100%; box-sizing:border-box; border:none; border-radius:6px; padding:10px 16px; font-weight:700; font-size:12.5px; margin:0; cursor:pointer; color:#ffffff; text-align:center;';
                                                var panel = '<div style="background:#f8fafc; border:1px solid #e2e8f0; border-radius:8px; padding:12px; margin-bottom:12px; font-size:13px; color:#0f172a;">'
                                                    + '<div style="font-weight:700; margin-bottom:6px;">📊 Resumen de Actividades DHF</div>'
                                                    + '<b>' + m.total + '</b> Total &nbsp;|&nbsp; <span style="color:#16a34a;"><b>' + m.finalizadas + '</b> Finalizadas</span> &nbsp;|&nbsp; <span style="color:#d97706;"><b>' + m.pendientes + '</b> Pendientes</span>'
                                                    + '</div>'
                                                    + '<p style="font-size:12.5px; color:#b45309; margin-bottom:14px;"><i class="fas fa-exclamation-triangle mr-1"></i> Esta memoria cuenta con <b>' + m.pendientes + '</b> actividad(es) sin cerrar o sin registro de avance.</p>'
                                                    + '<div style="display:flex; flex-direction:column; gap:8px; width:100%;">'
                                                    + '  <button type="button" id="op-btn-autocomplete" onclick="opAutocompleteAndFinalize();return false;" style="' + _bs + ' background:#16a34a;">Autocompletar observaciones y Finalizar</button>'
                                                    + '  <button type="button" id="op-btn-close-pending" data-id="' + id + '" data-fs="' + finalState + '" onclick="opConfirmProjectClose(' + id + ',\'' + finalState + '\');return false;" style="' + _bs + ' background:#dc2626;">Finalizar dejando actividades pendientes</button>'
                                                    + '  <button type="button" id="op-btn-cancel" onclick="if(window.swal){swal.close();}return false;" style="' + _bs + ' background:#64748b;">Cancelar / Volver a Gestión</button>'
                                                    + '</div>';
                                                swal({ title: 'Cierre con Actividades Pendientes', text: panel, type: 'warning', html: true, showConfirmButton: false });
                                            } else if (m && m.total === 0) {
                                                // Memoria sin actividades registradas (métricas cargadas pero vacías)
                                                swal({
                                                    title: 'Cierre de Proyecto',
                                                    text: 'Esta memoria no tiene actividades registradas. ¿Confirmar el cambio de estado a ' + finalState + '?',
                                                    type: 'warning', showCancelButton: true, confirmButtonColor: 'green',
                                                    confirmButtonText: 'Confirmar', cancelButtonText: 'Cancelar', closeOnConfirm: false
                                                }, function () { opConfirmProjectClose(id, finalState); });
                                            } else {
                                                // Fallback real: el fetch/parse de métricas falló -> confirmación simple, sin bloquear
                                                swal({
                                                    title: 'Cambio de Estado del Proyecto',
                                                    text: 'No se pudieron cargar las métricas de la memoria. ¿Confirmar el cambio de estado a ' + finalState + '?',
                                                    type: 'warning', showCancelButton: true, confirmButtonColor: 'green',
                                                    confirmButtonText: 'Aceptar', cancelButtonText: 'Cancelar', closeOnConfirm: false
                                                }, function () { opConfirmProjectClose(id, finalState); });
                                            }
                                        }
                                        window.opShowCloseDialog = opShowCloseDialog; // expuesto para verificación controlada (solo lectura)

                                        /* OPCIÓN 1 AUTORIZADA (excepción de negocio, ver CLAUDE.md §8.9): autocompletar las
                                           actividades pendientes con la observación técnica estándar y finalizar. ESCRIBE en el
                                           audit trail (opc=11 + opc=13). Atribuye al usuario de sesión que cierra (matiz ALCOA
                                           documentado). Se dispara por fetch (evita el F3 del forward de opc=11). */
                                        // Overlay de progreso PROPIO (no swal) para no colisionar con el SweetAlert v1 abierto.
                                        function opShowInlineProgress(title) {
                                            try { if (window.swal) swal.close(); } catch (e) { }
                                            var ov = document.getElementById('op-ac-overlay');
                                            if (ov) ov.remove();
                                            ov = document.createElement('div');
                                            ov.id = 'op-ac-overlay';
                                            ov.style.cssText = 'position:fixed; left:0; top:0; right:0; bottom:0; background:rgba(0,0,0,0.55); z-index:2147483000; display:flex; align-items:center; justify-content:center;';
                                            ov.innerHTML = '<div style="background:#ffffff; border-radius:12px; padding:28px 34px; box-shadow:0 15px 50px rgba(0,0,0,0.35); text-align:center; font-family:Arial,sans-serif; min-width:320px; max-width:440px;">'
                                                + '<i class="fas fa-cog fa-spin fa-3x" style="color:#0284c7;"></i>'
                                                + '<h6 style="font-weight:700; margin:14px 0 6px; color:#0f172a;">' + title + '</h6>'
                                                + '<div id="op-ac-log" style="font-size:12px; color:#334155;"></div>'
                                                + '</div>';
                                            document.body.appendChild(ov);
                                        }
                                        window.opAutocompleteAndFinalize = function () {
                                            var ctx = window._opCloseCtx;
                                            if (!ctx) return;
                                            var ids = (ctx.pendingIds || []);
                                            // GUARDA HONESTA: si hay actividades pendientes cuyo id NO se pudo capturar del DOM
                                            // (los links con el id_memoria_d estan permission-gated a otros responsables), NO cerrar
                                            // en silencio dejandolas en "En Proceso". Se informa cuantas se pueden vs no, y el usuario
                                            // decide. El cierre server-side de TODAS (incl. de otros responsables) requiere backend (escalado).
                                            var pend = (typeof ctx.pendientes === 'number') ? ctx.pendientes : ids.length;
                                            if (ids.length < pend) {
                                                var faltan = pend - ids.length;
                                                var msg = 'De ' + pend + ' actividad(es) pendiente(s), puedo autocompletar y finalizar ' + ids.length + '.\n\n'
                                                    + faltan + ' actividad(es) son gestionadas por otros responsables y su identificador no está disponible en esta vista, por lo que NO puedo finalizarlas automáticamente (deben finalizarse por su responsable o desde el backend).\n\n'
                                                    + '¿Deseás finalizar las ' + ids.length + ' que sí puedo y CERRAR el proyecto de todos modos (las otras ' + faltan + ' quedarán En Proceso)?';
                                                if (!confirm(msg)) { try { if (window.swal) swal.close(); } catch (e) { } return; }
                                            }
                                            opShowInlineProgress(ids.length > 0 ? ('Autocompletando ' + ids.length + ' actividad(es) y finalizando…') : 'Finalizando proyecto…');
                                            if (ids.length === 0) {
                                                setTimeout(function () { opConfirmProjectClose(ctx.id, ctx.finalState || 'TERMINADO'); }, 400);
                                                return;
                                            }
                                            opRunAutocompleteSequence(ctx);
                                        };
                                        async function opRunAutocompleteSequence(ctx) {
                                            var STD = 'Actividad realizada y verificada satisfactoriamente según las especificaciones técnicas del proyecto.';
                                            var today = new Date().toISOString().substring(0, 10);
                                            var ids = ctx.pendingIds.slice();
                                            var ok = 0, fail = 0;
                                            // El overlay de progreso (#op-ac-log) ya lo mostró opShowInlineProgress (sin swal).
                                            function log(msg) { var l = document.getElementById('op-ac-log'); if (l) l.innerHTML = msg; }
                                            function body(obj) { var p = new URLSearchParams(); for (var k in obj) { if (obj.hasOwnProperty(k)) p.append(k, obj[k]); } return p.toString(); }
                                            var H = { 'Content-Type': 'application/x-www-form-urlencoded' };
                                            // async/await ESTRICTO: cada opc=11 y opc=13 debe COMPLETAR (ok) antes del siguiente.
                                            for (var i = 0; i < ids.length; i++) {
                                                var idm = ids[i];
                                                log('Autocompletando actividad ' + (i + 1) + ' / ' + ids.length + '…');
                                                try {
                                                    // 1) opc=11: observación estándar -> esperar respuesta ok
                                                    var r11 = await fetch('Proyecto?opc=11', { method: 'POST', headers: H, credentials: 'same-origin',
                                                        body: body({ ipy: ctx.id, estado: ctx.estadoM, id_memoria: idm, id_usuario: ctx.idUsuario, usuario: ctx.usuario, fecha_reg: today, observacion: STD, Tipo_log: 'RESPONSABLE' }) });
                                                    if (!r11 || !(r11.ok || r11.status === 302)) throw new Error('opc=11 ' + (r11 && r11.status));
                                                    // 2) opc=13: finalizar (estado=3) -> esperar respuesta ok
                                                    var r13 = await fetch('Proyecto?opc=13', { method: 'POST', headers: H, credentials: 'same-origin',
                                                        body: body({ ipy: ctx.id, id_memoria: idm, estado: 3, estadoM: ctx.estadoM }) });
                                                    if (!r13 || !(r13.ok || r13.status === 302)) throw new Error('opc=13 ' + (r13 && r13.status));
                                                    ok++;
                                                } catch (e) { fail++; }
                                            }
                                            // Cerrar el proyecto SOLO si el 100% se completó; si algo falló, NO cerrar (evita cierre inconsistente).
                                            if (fail === 0 && ok === ids.length) {
                                                log('✔ ' + ok + ' actividad(es) finalizada(s). Cerrando proyecto…');
                                                setTimeout(function () { opConfirmProjectClose(ctx.id, ctx.finalState || 'TERMINADO'); }, 700);
                                            } else {
                                                log('<span style="color:#dc2626; font-weight:700;">⚠ ' + ok + ' completada(s), ' + fail + ' con error.</span><br>El proyecto NO se cerró para evitar un cierre inconsistente. Revise el servidor e intente nuevamente.'
                                                    + '<div style="margin-top:12px;"><button type="button" onclick="var o=document.getElementById(\'op-ac-overlay\');if(o)o.remove();" style="background:#64748b;color:#fff;border:none;border-radius:6px;padding:8px 14px;font-weight:600;cursor:pointer;">Cerrar</button></div>');
                                            }
                                        }

                                        function opEnrichedProjectClose(id, finalState) {
                                            try {
                                                if (window.swal) swal({ title: 'Consultando métricas…', text: '<i class="fas fa-spinner fa-spin fa-2x text-primary"></i>', type: 'info', html: true, showConfirmButton: false });
                                            } catch (e) { }
                                            fetch('Proyecto?opc=7&ipy=' + id + '&estadoM=1', { credentials: 'same-origin' })
                                                .then(function (r) { return r.text(); })
                                                .then(function (html) { opShowCloseDialog(opParseMemoriaMetrics(html), id, finalState); })
                                                .catch(function () { opShowCloseDialog(null, id, finalState); });
                                        }
                                        (function opInstallCloseOverride() {
                                            function install() {
                                                // Solo en el listado (Proyecto.jsp), donde ProyectoProceso existe.
                                                if (typeof window.ProyectoProceso === 'function' && !window._opOrigProyectoProceso) {
                                                    window._opOrigProyectoProceso = window.ProyectoProceso;
                                                    window.ProyectoProceso = function (id_proyecto) { opEnrichedProjectClose(id_proyecto, 'TERMINADO'); };
                                                }
                                            }
                                            // DOMContentLoaded corre DESPUES de los <script> inline de Proyecto.jsp -> gana el override.
                                            if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', install);
                                            else install();
                                        })();

                                        /* ═══════════════════════════════════════════════════════════════════
                                           Autocorrector nativo (Parte 1): habilita spellcheck/gramática del navegador
                                           en español en todos los campos de texto libre, sin puente con Word. Aditivo y
                                           tolerante a fallos; cubre campos dinámicos vía focusin. NO altera el value
                                           (salvo limpiar caracteres de control al pegar, preservando acentos).
                                           ═══════════════════════════════════════════════════════════════════ */
                                        (function opInitTextUX() {
                                            try {
                                                var SEL = 'textarea, input[type="text"], input:not([type])';
                                                function enhance(el) {
                                                    if (!el || el.getAttribute('data-op-textux')) return;
                                                    el.setAttribute('spellcheck', 'true');
                                                    el.setAttribute('lang', 'es');
                                                    el.setAttribute('autocorrect', 'on');
                                                    el.setAttribute('autocapitalize', 'sentences');
                                                    try { el.style.textTransform = 'none'; } catch (e) { } // anular mayúsculas sostenidas visuales
                                                    el.setAttribute('data-op-textux', '1');
                                                }
                                                function enhanceAll(scope) {
                                                    var n = (scope || document).querySelectorAll(SEL);
                                                    for (var i = 0; i < n.length; i++) enhance(n[i]);
                                                }
                                                // cubre campos dinámicos (modales/wizard) al enfocarlos
                                                document.addEventListener('focusin', function (e) {
                                                    if (e.target && e.target.matches && e.target.matches(SEL)) enhance(e.target);
                                                });
                                                setTimeout(enhanceAll, 400);
                                                // Pegado desde Word/portapapeles: limpiar SOLO caracteres de control y NBSP,
                                                // preservando acentos y el texto limpio (no se tocan letras ni tildes).
                                                document.addEventListener('paste', function (e) {
                                                    var el = e.target;
                                                    if (!el || !el.matches || !el.matches(SEL)) return;
                                                    setTimeout(function () {
                                                        try {
                                                            var v = el.value;
                                                            if (typeof v === 'string') {
                                                                var out = '';
                                                                for (var _c = 0; _c < v.length; _c++) {
                                                                    var cc = v.charCodeAt(_c);
                                                                    if (cc === 160) { out += ' '; }
                                                                    else if (cc < 32 && cc !== 9 && cc !== 10 && cc !== 13) { /* drop control */ }
                                                                    else { out += v.charAt(_c); }
                                                                }
                                                                if (out !== v) el.value = out;
                                                            }
                                                        } catch (err) { }
                                                    }, 0);
                                                });
                                            } catch (e) { /* PE tolerante a fallos */ }
                                        })();

                                        window.opShowBatchCreationModal = function () {
                                            var urlParams = new URLSearchParams(window.location.search);
                                            var estadoM = urlParams.get('estadoM') || '1';
                                            if (estadoM !== '1') {
                                                alert('Acceso Denegado: La memoria se encuentra finalizada o bloqueada y no permite cargues masivos.');
                                                return;
                                            }
                                            var modal = document.getElementById('op-batch-modal');
                                            if (modal) modal.remove();

                                            modal = document.createElement('div');
                                            modal.id = 'op-batch-modal';
                                            modal.className = 'modal fade show';
                                            modal.style.cssText = 'display:block !important; background:rgba(0,0,0,0.55); z-index:105000 !important;';

                                            modal.innerHTML = ''
                                                + '<div class="modal-dialog modal-lg" style="margin-top:40px !important; max-width:900px !important;">'
                                                + '  <div class="modal-content" style="border-radius:12px; border:1px solid var(--op-border-strong); box-shadow:0 15px 50px rgba(0,0,0,0.35);">'
                                                + '    <div class="modal-header" style="background:var(--op-surface-muted); border-bottom:1px solid var(--op-border-subtle);">'
                                                + '      <h5 class="modal-title font-weight-bold text-primary"><i class="fas fa-bolt mr-2 text-warning"></i> Workspace Cargue Masivo DHF (Multi-Etapa)</h5>'
                                                + '      <button type="button" class="close" id="op-batch-close-btn" onclick="document.getElementById(\'op-batch-modal\').remove();">&times;</button>'
                                                + '    </div>'
                                                + '    <div class="modal-body" style="padding:24px;">'
                                                + '      <!-- Stepper Visual -->'
                                                + '      <div class="op-wizard-stepper">'
                                                + '        <div class="text-center">'
                                                + '          <div class="op-wizard-step-node active" id="op-wiz-node-1">1</div>'
                                                + '          <div class="font-weight-bold mt-1" style="font-size:11px;">Etapas ISO</div>'
                                                + '        </div>'
                                                + '        <div class="text-center">'
                                                + '          <div class="op-wizard-step-node" id="op-wiz-node-2">2</div>'
                                                + '          <div class="font-weight-bold mt-1" style="font-size:11px;">Matriz Actividades</div>'
                                                + '        </div>'
                                                + '        <div class="text-center">'
                                                + '          <div class="op-wizard-step-node" id="op-wiz-node-3">3</div>'
                                                + '          <div class="font-weight-bold mt-1" style="font-size:11px;">Ejecución</div>'
                                                + '        </div>'
                                                + '      </div>'
                                                + '      <div id="op-wiz-step-content"></div>'
                                                + '    </div>'
                                                + '    <div class="modal-footer" style="background:var(--op-surface-muted); border-top:1px solid var(--op-border-subtle); justify-content:space-between;">'
                                                + '      <span id="op-batch-progress" style="font-size:12px; font-weight:bold; color:var(--op-text-muted);"></span>'
                                                + '      <div id="op-wiz-footer-btns"></div>'
                                                + '    </div>'
                                                + '  </div>'
                                                + '</div>';

                                            document.body.appendChild(modal);
                                            opRenderWizardStep(1);
                                        };

                                        // ─── PLANTILLA ISO 13485:2016 (catalogo `fase` real de la BD, fuente oficial validada) ───
                                        // Enriquece el Paso 2: agrupa las opciones REALES del select[name=numeral] bajo su clausula
                                        // 7.3.x, pre-marca defaults y pre-rellena la observacion con el texto oficial del catalogo.
                                        // NO define numerales: el numeral persistido SIEMPRE es el value real de la opcion.
                                        // 'fase' = texto exacto del catalogo (obj_fases[2]) usado para matchear por contencion.
                                        // sel = check por defecto; obl = obligatorio (checkbox deshabilitado dentro de su clausula).
                                        window.OP_TEMPLATE_ISO_13485 = [
                                            { etapa: '7.3.2', titulo: 'PLANIFICACIÓN DEL DISEÑO Y DESARROLLO', items: [
                                                { letra: '', fase: 'ESTABLECIMIENTO DE LOS OBJETIVOS DEL DISEÑO', sel: true, obl: false },
                                                { letra: 'A', fase: 'LAS ETAPAS DE DISEÑO Y DESARROLLO', sel: true, obl: false },
                                                { letra: 'B', fase: 'LAS REVISIONES NECESARIAS EN CADA ETAPA DE DISEÑO Y DESARROLLO', sel: true, obl: false },
                                                { letra: 'C', fase: 'LAS ACTIVIDADES DE VERIFICACIÓN, VALIDACIÓN Y TRANSFERENCIA DE DISEÑO QUE SON APROPIADAS EN CADA ETAPADE DISEÑO Y DESARROLLO', sel: true, obl: false },
                                                { letra: 'D-1', fase: 'RESPONSABILIDADES', sel: true, obl: false },
                                                { letra: 'D-2', fase: 'AUTORIDADES PARA EL DISEÑO Y DESARROLLO', sel: true, obl: false },
                                                { letra: 'E', fase: 'LOS MÉTODOS PARA ASEGURAR LA TRAZABILIDAD DE LAS SALIDAS DEL DISEÑO Y DESARROLLO A LAS ENTRADAS DE DISEÑO Y DESARROLLO', sel: true, obl: false },
                                                { letra: 'F', fase: 'LOS RECURSOS NECESARIOS, INCLUIDA LA COMPETENCIA NECESARIA DEL PERSONAL', sel: true, obl: false }
                                            ]},
                                            { etapa: '7.3.3', titulo: 'ENTRADAS DE DISEÑO Y DESARROLLO', items: [
                                                { letra: 'A', fase: 'REQUISITOS DE FUNCIONAMIENTO, DESEMPEÑO, USABILIDAD Y SEGURIDAD DE ACUERDO CON EL USO PREVISTO', sel: true, obl: false },
                                                { letra: 'B', fase: 'NORMAS Y REQUISITOS REGULATORIOS APLICABLES', sel: true, obl: false },
                                                { letra: 'C', fase: 'SALIDAS APLICABLES DE GESTIÓN DEL RIESGO', sel: true, obl: false },
                                                { letra: 'D', fase: 'SEGÚN SEA APROPIADO, LA INFORMACIÓN DERIVADA DE DISEÑOS SIMILARES PREVIOS', sel: false, obl: false },
                                                { letra: 'E', fase: 'OTROS REQUISITOS ESENCIALES PARA DISEÑO Y DESARROLLO DEL PRODUCTO Y DE LOS PROCESOS', sel: true, obl: false }
                                            ]},
                                            { etapa: '7.3.4', titulo: 'SALIDAS DE DISEÑO Y DESARROLLO', items: [
                                                { letra: 'A', fase: 'CUMPLIR LOS REQUISITOS PARA LAS ENTRADAS DE DISEÑO Y DESARROLLO', sel: true, obl: false },
                                                { letra: 'B', fase: 'SUMINISTRAR LA INFORMACIÓN APROPIADA PARA COMPRAS, PRODUCCIÓN Y PRESENTACIÓN DE SERVICIOS', sel: true, obl: false },
                                                { letra: 'C', fase: 'CONTENER O REFERENCIAR CRITERIOS DE ACEPTACIÓN DEL PRODUCTO', sel: true, obl: false },
                                                { letra: 'D', fase: 'ESPECIFICAR LAS CARACTERISTICAS DEL PRODUCTO QUE SON ESENCIALES PARA EL USO SEGURO Y APROPIADO', sel: true, obl: false }
                                            ]},
                                            { etapa: '7.3.5', titulo: 'REVISIÓN DEL DISEÑO Y DESARROLLO', items: [
                                                { letra: 'A', fase: 'EVALUAR LA CAPACIDAD DE LOS RESULTADOS DEL DISEÑO Y DESARROLLO PARA CUMPLIRLOS REQUISITOS', sel: true, obl: false },
                                                { letra: 'B', fase: 'IDENTIFICAR Y PROPONER LAS ACCIONES NECESARIAS', sel: true, obl: false }
                                            ]},
                                            { etapa: '7.3.6', titulo: 'VERIFICACIÓN DEL DISEÑO Y DESARROLLO', items: [
                                                { letra: '', fase: 'VERIFICACIÓN DEL DISEÑO Y DESARROLLO', sel: true, obl: true }
                                            ]},
                                            { etapa: '7.3.7', titulo: 'VALIDACIÓN DEL DISEÑO Y DESARROLLO', items: [
                                                { letra: '', fase: 'VALIDACIÓN DEL DISEÑO Y DESARROLLO', sel: true, obl: true }
                                            ]},
                                            { etapa: '7.3.8', titulo: 'TRANSFERENCIA DEL DISEÑO Y DESARROLLO', items: [
                                                { letra: '', fase: 'RESULTADOS Y CONCLUSIONES DE LA TRANSFERENCIA', sel: true, obl: false }
                                            ]},
                                            { etapa: '7.3.9', titulo: 'CONTROL DE DISEÑO Y CAMBIOS EN EL DESARROLLO', items: [
                                                { letra: 'A', fase: 'REVISAR', sel: false, obl: false },
                                                { letra: 'B', fase: 'VERIFICAR', sel: false, obl: false },
                                                { letra: 'C', fase: 'VALIDA; SEGUN SEA PROPIADO', sel: false, obl: false },
                                                { letra: 'D', fase: 'APROBAR', sel: false, obl: false }
                                            ]}
                                        ];
                                        // Normaliza texto para matching robusto: mayus, sin acentos, solo alfanumerico + espacios.
                                        window._opNorm = function (s) {
                                            var t = ('' + (s || '')).toUpperCase();
                                            var map = { 'Á': 'A', 'É': 'E', 'Í': 'I', 'Ó': 'O', 'Ú': 'U', 'Ü': 'U', 'Ñ': 'N' };
                                            t = t.replace(/[ÁÉÍÓÚÜÑ]/g, function (ch) { return map[ch] || ch; });
                                            return t.replace(/[^A-Z0-9]+/g, ' ').replace(/\s+/g, ' ').trim();
                                        };
                                        // Matchea el texto de una opcion real (letra + fase) a un item del template por contencion de
                                        // la fase normalizada. Orden 7.3.2->7.3.9 evita falsos positivos de fases cortas (REVISAR, etc.).
                                        window.opMatchTemplate = function (optionText) {
                                            var norm = window._opNorm(optionText);
                                            if (!norm) return null;
                                            for (var c = 0; c < window.OP_TEMPLATE_ISO_13485.length; c++) {
                                                var cl = window.OP_TEMPLATE_ISO_13485[c];
                                                for (var i = 0; i < cl.items.length; i++) {
                                                    var it = cl.items[i];
                                                    var fnorm = window._opNorm(it.fase);
                                                    if (fnorm && norm.indexOf(fnorm) !== -1) {
                                                        return { etapa: cl.etapa, tituloEtapa: cl.titulo, letra: it.letra, fase: it.fase, sel: it.sel, obl: it.obl };
                                                    }
                                                }
                                            }
                                            return null;
                                        };
                                        // El check padre (clausula) togglea todos sus hijos (incluidos los obligatorios, para permitir
                                        // excluir la clausula entera). Cada hijo sincroniza el estado visual del padre.
                                        window.opToggleClauseChildren = function (clauseChk) {
                                            var body = document.getElementById(clauseChk.getAttribute('data-body'));
                                            if (!body) return;
                                            body.querySelectorAll('.op-wiz-sub-chk').forEach(function (ch) { ch.checked = clauseChk.checked; });
                                            body.style.opacity = clauseChk.checked ? '1' : '0.5';
                                        };
                                        window.opSyncClauseParent = function (childChk) {
                                            var body = childChk.closest ? childChk.closest('.op-wiz-clause-body') : null;
                                            if (!body) return;
                                            var parent = document.getElementById(body.getAttribute('data-parent'));
                                            if (!parent) return;
                                            var all = body.querySelectorAll('.op-wiz-sub-chk');
                                            var anyChecked = false;
                                            all.forEach(function (ch) { if (ch.checked) anyChecked = true; });
                                            parent.checked = anyChecked;
                                            body.style.opacity = anyChecked ? '1' : '0.5';
                                        };

                                        // P1: detecta que sub-etapas (fases) YA tienen actividades en el proyecto actual, leyendo el
                                        // DOM real de la memoria (Tag_memoria): cada fase es una <table> con <thead th> = "letra fase"
                                        // y <tbody id="mycard-collapse-N"> con las actividades. Si el tbody contiene "AUTOR" -> hay
                                        // actividades -> esa fase esta cargada. Devuelve los textos de fase normalizados (para matchear
                                        // contra las opciones del select por _opNorm).
                                        window.opDetectLoadedFases = function () {
                                            var loaded = [];
                                            try {
                                                var tbs = document.querySelectorAll('tbody[id^="mycard-collapse-"]');
                                                for (var i = 0; i < tbs.length; i++) {
                                                    var tb = tbs[i];
                                                    if (!/AUTOR/i.test(tb.textContent || '')) continue;
                                                    var tbl = tb.closest ? tb.closest('table') : null;
                                                    var th = tbl ? tbl.querySelector('thead th') : null;
                                                    if (th) { var n = window._opNorm(th.textContent); if (n && loaded.indexOf(n) === -1) loaded.push(n); }
                                                }
                                            } catch (e) { }
                                            return loaded;
                                        };

                                        // Smart Card row para el Paso 2 del wizard (reutilizada por render inicial y "Agregar Actividad").
                                        // Conserva las clases que lee opExecuteBatchSubmit: .op-batch-title / .op-batch-doc / .op-batch-desc.
                                        function opWizRowHtml(titleVal) {
                                            var tv = (titleVal || '').replace(/"/g, '&quot;');
                                            return '<div class="op-wiz-act-row" style="border:1px solid #e2e8f0; border-radius:8px; padding:12px; background:#ffffff;">'
                                                + '  <div style="display:grid; grid-template-columns:1fr 220px 36px; gap:8px; align-items:center; width:100%;">'
                                                + '    <input type="text" class="form-control form-control-sm op-batch-title" placeholder="Nombre de la Actividad" spellcheck="true" lang="es" style="width:100%; box-sizing:border-box; font-weight:600;" value="' + tv + '">'
                                                + '    <select class="form-control form-control-sm op-batch-doc" style="width:100%; box-sizing:border-box;"><option value="none" selected>Ninguno (Solo Texto / Observación)</option><option value="docx">Documento Word (.docx) - Opcional</option><option value="docx_req">Documento Word (.docx) - Obligatorio</option><option value="xlsx">Hoja de Cálculo Excel (.xlsx)</option><option value="pptx">Presentación PowerPoint (.pptx)</option></select>'
                                                + '    <button type="button" class="btn btn-sm btn-outline-danger" title="Eliminar actividad" onclick="this.closest(\'.op-wiz-act-row\').remove()" style="width:36px; padding:0;">&times;</button>'
                                                + '  </div>'
                                                + '  <textarea class="form-control form-control-sm op-batch-desc" rows="2" placeholder="Descripción / Observación Técnica" spellcheck="true" lang="es" style="width:100%; box-sizing:border-box; margin-top:8px; min-height:55px; resize:vertical;">Actividad planificada, ejecutada y verificada de acuerdo con las especificaciones de la norma ISO 13485</textarea>'
                                                + '</div>';
                                        }

                                        function opRenderWizardStep(step) {
                                            window._opBatchWizardStep = step;
                                            var container = document.getElementById('op-wiz-step-content');
                                            var footerBtns = document.getElementById('op-wiz-footer-btns');
                                            if (!container || !footerBtns) return;

                                            for (var i = 1; i <= 3; i++) {
                                                var n = document.getElementById('op-wiz-node-' + i);
                                                if (n) {
                                                    n.classList.remove('active', 'completed');
                                                    if (i < step) n.classList.add('completed');
                                                    else if (i === step) n.classList.add('active');
                                                }
                                            }

                                            var realSelect = document.querySelector('#Ventana1 select[name="numeral"]') || document.querySelector('select[name="numeral"]');
                                            var availableStages = [];
                                            if (realSelect) {
                                                for (var s = 0; s < realSelect.options.length; s++) {
                                                    var opt = realSelect.options[s];
                                                    if (opt.value && !opt.disabled && opt.value !== '#' && opt.value !== '-') {
                                                        availableStages.push({ value: opt.value, text: opt.text });
                                                    }
                                                }
                                            }

                                            if (step === 1) {
                                                // P1: fases que ya tienen actividades -> deshabilitadas (no re-crear).
                                                var loaded = (typeof opDetectLoadedFases === 'function') ? opDetectLoadedFases() : [];
                                                var availableCount = 0;
                                                availableStages.forEach(function (stg) { if (loaded.indexOf(window._opNorm(stg.text)) === -1) availableCount++; });

                                                var html = '<div class="alert alert-info py-2" style="font-size:12px;"><i class="fas fa-info-circle mr-1"></i> Seleccioná las Etapas ISO 13485 <b>pendientes por inicializar</b>. Las que ya tienen actividades aparecen deshabilitadas.</div>';
                                                if (availableCount === 0) {
                                                    html += '<div class="alert alert-success py-2" style="font-size:12px;"><i class="fas fa-check-circle mr-1"></i> Esta memoria ya tiene todas las etapas ISO cargadas. No hay etapas pendientes por inicializar.</div>';
                                                }
                                                html += '<div class="d-flex align-items-center justify-content-between mb-3">'
                                                    + '  <label class="font-weight-bold m-0" style="font-size:13px;">Etapas ISO de este Proyecto:</label>'
                                                    + '  <button type="button" class="btn btn-sm btn-link text-primary font-weight-bold" onclick="opToggleSelectAllStages(true)"><i class="fas fa-check-square mr-1"></i> Seleccionar pendientes</button>'
                                                    + '</div>'
                                                    + '<div class="row" id="op-wiz-stages-list">';

                                                availableStages.forEach(function (stg, idx) {
                                                    var isLoaded = loaded.indexOf(window._opNorm(stg.text)) !== -1;
                                                    var checked = (!isLoaded && (window._opSelectedStages.indexOf(stg.value) !== -1 || window._opSelectedStages.length === 0)) ? 'checked' : '';
                                                    var dis = isLoaded ? ' disabled' : '';
                                                    var wrapStyle = isLoaded ? ' style="opacity:0.5;"' : '';
                                                    var badge = isLoaded ? ' <span class="text-muted font-weight-normal" style="font-size:10.5px;">(Ya cargada &#10003;)</span>' : '';
                                                    html += '<div class="col-md-6 mb-2">'
                                                        + '  <div class="p-2 border rounded bg-white d-flex align-items-center gap-2"' + wrapStyle + '>'
                                                        + '    <input type="checkbox" class="op-wiz-stage-chk" value="' + stg.value + '" data-text="' + stg.text.replace(/"/g, '&quot;') + '" id="chk_stg_' + idx + '" ' + checked + dis + '>'
                                                        + '    <label for="chk_stg_' + idx + '" class="m-0 font-weight-bold text-dark" style="font-size:12px; cursor:' + (isLoaded ? 'not-allowed' : 'pointer') + ';">' + stg.text + badge + '</label>'
                                                        + '  </div>'
                                                        + '</div>';
                                                });

                                                html += '</div>';
                                                container.innerHTML = html;

                                                var nextDis = (availableCount === 0) ? ' disabled' : '';
                                                footerBtns.innerHTML = '<button type="button" class="btn btn-primary btn-sm font-weight-bold" onclick="opBatchNextToStep2()"' + nextDis + '><i class="fas fa-arrow-right mr-1"></i> Siguiente: Configurar Actividades</button>';
                                            } else if (step === 2) {
                                                var chks = document.querySelectorAll('.op-wiz-stage-chk:checked');
                                                var selected = [];
                                                chks.forEach(function (c) {
                                                    selected.push({ value: c.value, text: c.getAttribute('data-text') });
                                                });
                                                if (selected.length === 0) {
                                                    alert('Debes seleccionar al menos una etapa ISO.');
                                                    opRenderWizardStep(1);
                                                    return;
                                                }
                                                window._opSelectedStagesList = selected;

                                                // Agrupar las opciones REALES por clausula 7.3.x via el template (match por texto).
                                                // Cada opcion conserva su value REAL como numeral. Las no matcheadas -> grupo "Otros".
                                                var groups = {}, order = [];
                                                window.OP_TEMPLATE_ISO_13485.forEach(function (cl) { groups[cl.etapa] = { etapa: cl.etapa, titulo: cl.titulo, rows: [] }; order.push(cl.etapa); });
                                                groups['OTROS'] = { etapa: 'OTROS', titulo: 'OTRAS SUB-ETAPAS (sin plantilla)', rows: [] };
                                                selected.forEach(function (stg) {
                                                    var m = opMatchTemplate(stg.text);
                                                    if (m) groups[m.etapa].rows.push({ value: stg.value, text: stg.text, tpl: m });
                                                    else groups['OTROS'].rows.push({ value: stg.value, text: stg.text, tpl: null });
                                                });

                                                var html = '<div class="alert alert-info py-2" style="font-size:12px;"><i class="fas fa-info-circle mr-1"></i> Plantilla ISO 13485 pre-cargada. Marca/desmarca sub-etapas y ajusta la observación técnica antes de generar. El numeral de cada actividad es el REAL del proyecto (nunca inventado).</div>'
                                                    + '<div style="max-height: 55vh; overflow-y: auto; padding-right: 4px;">';

                                                var allOrder = order.concat(['OTROS']);
                                                var rowSeq = 0;
                                                allOrder.forEach(function (etapaKey) {
                                                    var g = groups[etapaKey];
                                                    if (!g || g.rows.length === 0) return;
                                                    var safe = etapaKey.replace(/[^a-z0-9]/gi, '');
                                                    var bodyId = 'op-wiz-clause-body-' + safe;
                                                    var parentId = 'op-wiz-clause-chk-' + safe;
                                                    var anySel = g.rows.some(function (r) { return r.tpl ? r.tpl.sel : true; });
                                                    var titleHtml = (etapaKey === 'OTROS')
                                                        ? '<span class="t">' + g.titulo + '</span>'
                                                        : '<span class="num">' + g.etapa + '</span> <span class="t">' + g.titulo + '</span>';
                                                    html += '<div class="op-wiz-clause2">'
                                                        + '  <div class="op-wiz-clause2-head">'
                                                        + '    <input type="checkbox" id="' + parentId + '" data-body="' + bodyId + '" ' + (anySel ? 'checked' : '') + ' onchange="opToggleClauseChildren(this)">'
                                                        + '    <label for="' + parentId + '" style="cursor:pointer; margin:0; display:flex; gap:6px; align-items:baseline; flex-wrap:wrap;">' + titleHtml + '</label>'
                                                        + '    <span class="cnt">' + g.rows.length + '</span>'
                                                        + '  </div>'
                                                        + '  <div class="op-wiz-clause-body" id="' + bodyId + '" data-parent="' + parentId + '"' + (anySel ? '' : ' style="opacity:0.5;"') + '>';
                                                    g.rows.forEach(function (r) {
                                                        rowSeq++;
                                                        var sel = r.tpl ? r.tpl.sel : true;
                                                        var obl = r.tpl ? r.tpl.obl : false;
                                                        var faseTxt = r.text; // texto real de la opcion (letra + fase)
                                                        var descDefault = r.tpl ? r.tpl.fase : r.text; // observacion pre-rellenada (texto oficial del catalogo)
                                                        var chkId = 'op-wiz-sub-' + rowSeq;
                                                        var oblAttr = obl ? ' disabled' : '';
                                                        var oblTip = obl ? ' title="Requerido por ISO 13485 (evidencia de V&amp;V). Para excluirlo, desmarca la cláusula completa."' : '';
                                                        var oblBadge = obl ? ' <span class="badge badge-danger" style="font-size:9px;">Obligatorio</span>' : '';
                                                        html += '<div class="op-wiz-act-row op-wiz-sub-row" data-stage="' + r.value + '">'
                                                            + '  <div class="op-wiz-sub-top">'
                                                            + '    <input type="checkbox" class="op-wiz-sub-chk" id="' + chkId + '" ' + (sel ? 'checked' : '') + oblAttr + oblTip + ' onchange="opSyncClauseParent(this)">'
                                                            + '    <label for="' + chkId + '">' + faseTxt + oblBadge + '</label>'
                                                            + '  </div>'
                                                            + '  <div class="op-wiz-sub-ctl">'
                                                            + '    <textarea class="op-batch-desc" spellcheck="true" lang="es" placeholder="Observación técnica (editable)">' + (descDefault || '').replace(/</g, '&lt;').replace(/>/g, '&gt;') + '</textarea>'
                                                            + '    <select class="op-batch-doc"><option value="none" selected>Sin documento</option><option value="docx">+ Word (.docx)</option><option value="xlsx">+ Excel (.xlsx)</option><option value="pptx">+ PowerPoint (.pptx)</option></select>'
                                                            + '    <input type="hidden" class="op-batch-title" value="' + faseTxt.replace(/"/g, '&quot;') + '">'
                                                            + '  </div>'
                                                            + '</div>';
                                                    });
                                                    html += '  </div></div>';
                                                });

                                                html += '</div>';
                                                container.innerHTML = html;

                                                footerBtns.innerHTML = ''
                                                    + '<button type="button" class="btn btn-outline-secondary btn-sm font-weight-bold mr-2" onclick="opRenderWizardStep(1)"><i class="fas fa-arrow-left mr-1"></i> Volver a Etapas</button>'
                                                    + '<button type="button" class="btn btn-success btn-sm font-weight-bold" onclick="opExecuteBatchSubmit()"><i class="fas fa-bolt mr-1"></i> ⚡ Generar Actividades en Lote</button>';
                                            }
                                        }

                                        // FIX navegacion: opRenderWizardStep es local del IIFE; los onclick inline corren en
                                        // scope GLOBAL, por eso "Volver a Etapas" (onclick=opRenderWizardStep(1)) no hacia nada.
                                        // Se expone en window para que el boton de retroceso funcione.
                                        window.opRenderWizardStep = opRenderWizardStep;

                                        window.opToggleSelectAllStages = function (select) {
                                            var chks = document.querySelectorAll('.op-wiz-stage-chk');
                                            chks.forEach(function (c) { if (!c.disabled) c.checked = select; });
                                        };

                                        window.opBatchNextToStep2 = function () {
                                            var chks = document.querySelectorAll('.op-wiz-stage-chk:checked');
                                            if (chks.length === 0) {
                                                alert('Por favor selecciona al menos una etapa ISO.');
                                                return;
                                            }
                                            // Persistir la seleccion real del Paso 1 para conservarla al volver (opRenderWizardStep(1)).
                                            window._opSelectedStages = Array.prototype.map.call(chks, function (c) { return c.value; });
                                            opRenderWizardStep(2);
                                        };

                                        window.opAddRowToStageTable = function (btn) {
                                            var card = btn.closest ? btn.closest('.op-wizard-stage-card') : null;
                                            var cont = card ? card.querySelector('.op-wiz-stage-table') : null;
                                            if (!cont) return;
                                            var wrap = document.createElement('div');
                                            wrap.innerHTML = opWizRowHtml('');
                                            var row = wrap.firstElementChild;
                                            if (row) cont.appendChild(row);
                                        };

                                        window.opExecuteBatchSubmit = function () {
                                            var btnSubmit = document.querySelector('#op-wiz-footer-btns .btn-success');
                                            if (btnSubmit && btnSubmit.disabled) return;

                                            var itemsToCreate = []; // [{ stage, title, docType, desc }]
                                            // Recorrer cada sub-etapa (fila) del arbol; incluir solo si su checkbox esta MARCADO.
                                            // El numeral es el value REAL del select (data-stage de la fila), nunca inventado.
                                            var actRows = document.querySelectorAll('.op-wiz-act-row');
                                            actRows.forEach(function (r) {
                                                var chk = r.querySelector('.op-wiz-sub-chk');
                                                if (!chk || !chk.checked) return;
                                                var stgVal = r.getAttribute('data-stage');
                                                if (!stgVal) return;
                                                var titleInput = r.querySelector('.op-batch-title');
                                                var docSelect = r.querySelector('.op-batch-doc');
                                                var descInput = r.querySelector('.op-batch-desc');
                                                itemsToCreate.push({
                                                    stage: stgVal,
                                                    title: (titleInput && titleInput.value.trim()) || 'Actividad DHF',
                                                    docType: docSelect ? docSelect.value : 'none',
                                                    desc: descInput ? descInput.value.trim() : ''
                                                });
                                            });

                                            if (itemsToCreate.length === 0) {
                                                alert('Marca al menos una sub-etapa para generar sus actividades.');
                                                return;
                                            }

                                            opRenderWizardStep(3);

                                            var container = document.getElementById('op-wiz-step-content');
                                            var pBar = null;
                                            var logDiv = null;
                                            var footerBtns = document.getElementById('op-wiz-footer-btns');

                                            container.innerHTML = ''
                                                + '<div class="text-center p-4">'
                                                + '  <i class="fas fa-cog fa-spin fa-3x text-primary mb-3"></i>'
                                                + '  <h6 class="font-weight-bold text-dark">Generando Lote Multi-Etapa DHF...</h6>'
                                                + '  <p class="text-muted" style="font-size:12px;">Se están creando ' + itemsToCreate.length + ' actividades con sus respectivos documentos en el repositorio.</p>'
                                                + '  <div class="progress mb-3" style="height: 18px; border-radius:10px;">'
                                                + '    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" id="op-wiz-progress-bar" style="width: 0%;">0%</div>'
                                                + '  </div>'
                                                + '  <div id="op-wiz-status-log" class="text-left bg-light p-3 border rounded" style="font-size:11px; max-height:180px; overflow-y:auto; font-family:monospace;"></div>'
                                                + '</div>';

                                            footerBtns.innerHTML = '<button type="button" class="btn btn-secondary btn-sm font-weight-bold" disabled>Procesando...</button>';

                                            pBar = document.getElementById('op-wiz-progress-bar');
                                            logDiv = document.getElementById('op-wiz-status-log');

                                            var ipyInput = document.querySelector('input[name="ipy"]');
                                            var idUsuarioInput = document.querySelector('input[name="id_usuario"]');
                                            var estadoInput = document.querySelector('input[name="estado"]');

                                            var idProyecto = ipyInput ? ipyInput.value : '';
                                            var idUsuario = idUsuarioInput ? idUsuarioInput.value : '';
                                            var estadoM = estadoInput ? estadoInput.value : '1';
                                            var todayYMD = new Date().toISOString().substring(0, 10);

                                            var OO_API_KEY = 'opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0';
                                            var OO_SERVER = 'http://localhost:8080';

                                            var s = document.querySelector('script[data-token]');
                                            var token = s ? s.getAttribute('data-token') || '' : '';
                                            var headers = { 'Content-Type': 'application/json' };
                                            if (token) headers['Authorization'] = 'Bearer ' + token;
                                            else headers['X-Api-Key'] = OO_API_KEY;

                                            var index = 0;

                                            function appendLog(msg, isError) {
                                                if (!logDiv) return;
                                                var div = document.createElement('div');
                                                div.style.color = isError ? '#dc2626' : '#16a34a';
                                                div.innerHTML = '[' + new Date().toLocaleTimeString() + '] ' + msg;
                                                logDiv.appendChild(div);
                                                logDiv.scrollTop = logDiv.scrollHeight;
                                            }

                                            function createNext() {
                                                if (index >= itemsToCreate.length) {
                                                    if (pBar) {
                                                        pBar.style.width = '100%';
                                                        pBar.textContent = '100%';
                                                    }
                                                    appendLog('✔ ¡Lote multi-etapa completado exitosamente!');

                                                    if (typeof iziToast !== 'undefined') {
                                                        iziToast.success({
                                                            title: 'Éxito',
                                                            message: 'Se crearon ' + itemsToCreate.length + ' actividades correctamente.'
                                                        });
                                                    }
                                                    footerBtns.innerHTML = '<button type="button" class="btn btn-success btn-sm font-weight-bold" onclick="window.location.reload()"><i class="fas fa-sync-alt mr-1"></i> Finalizar y Recargar Pagina</button>';
                                                    return;
                                                }

                                                var item = itemsToCreate[index];
                                                var pct = Math.round(((index + 1) / itemsToCreate.length) * 100);
                                                if (pBar) {
                                                    pBar.style.width = pct + '%';
                                                    pBar.textContent = pct + '% (' + (index + 1) + '/' + itemsToCreate.length + ')';
                                                }

                                                appendLog('Creando (' + (index + 1) + '/' + itemsToCreate.length + '): "' + item.title + '" en etapa ' + item.stage + '...');

                                                // SPRINT 9 FIX #3: opción "Ninguno (Solo texto)" — sin documento OnlyOffice.
                                                // Se omite la llamada a /api/files/new y se postea solo la observación de texto.
                                                if (item.docType === 'none') {
                                                    var fdText = new URLSearchParams();
                                                    fdText.append('estado', estadoM);
                                                    fdText.append('ipy', idProyecto);
                                                    fdText.append('id_usuario', idUsuario);
                                                    fdText.append('fecha_reg', todayYMD);
                                                    fdText.append('numeral', item.stage);
                                                    // Tarea 3: SIN personas -> el servlet registra la actividad en estado 3 (FINALIZADO)
                                                    // (opc=9: Registrar_memoria_d(...,3) cuando participe==""). Nace formalmente completada.
                                                    fdText.append('observacion', item.desc || '');
                                                    fetch('Proyecto?opc=9', {
                                                        method: 'POST',
                                                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                                                        body: fdText.toString()
                                                    }).then(function () {
                                                        appendLog('✔ Creado (solo texto): "' + item.title + '"');
                                                        index++;
                                                        createNext();
                                                    }).catch(function (err) {
                                                        appendLog('✖ Error en "' + item.title + '": ' + err.message, true);
                                                        index++;
                                                        createNext();
                                                    });
                                                    return;
                                                }

                                                var ooTypeMap = { docx: 'document', xlsx: 'spreadsheet', pptx: 'presentation' };
                                                var type = ooTypeMap[item.docType] || 'document';
                                                var newFileUrl = OO_SERVER + '/api/files/new';
                                                if (type === 'spreadsheet') newFileUrl += '/spreadsheet';
                                                if (type === 'presentation') newFileUrl += '/presentation';

                                                fetch(newFileUrl, { method: 'POST', headers: headers })
                                                    .then(function (r) { return r.json(); })
                                                    .then(function (resp) {
                                                        if (!resp || !resp.data) throw new Error('Respuesta de OnlyOffice inválida');
                                                        var fileId = resp.data.fileId || resp.data.id;
                                                        var fileName = resp.data.originalFileName || (item.title + '.' + item.docType);

                                                        var formData = new URLSearchParams();
                                                        formData.append('estado', estadoM);
                                                        formData.append('ipy', idProyecto);
                                                        formData.append('id_usuario', idUsuario);
                                                        formData.append('fecha_reg', todayYMD);
                                                        formData.append('numeral', item.stage);
                                                        // Tarea 3: SIN personas -> actividad nace en estado 3 (FINALIZADO) via opc=9.
                                                        var ooRef = 'oo:' + fileId + ':' + fileName;
                                                        formData.append('observacion', item.desc ? (item.desc + '\n' + ooRef) : ooRef);

                                                        return fetch('Proyecto?opc=9', {
                                                            method: 'POST',
                                                            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                                                            body: formData.toString()
                                                        });
                                                    })
                                                    .then(function () {
                                                        appendLog('✔ Creado: "' + item.title + '"');
                                                        index++;
                                                        createNext();
                                                    })
                                                    .catch(function (err) {
                                                        appendLog('✖ Error en "' + item.title + '": ' + err.message, true);
                                                        index++;
                                                        createNext();
                                                    });
                                            }

                                            createNext();
                                        };

                                        // Observador global para detectar la apertura de ventanas/modales (Ventana1..Ventana8)
                                        // y desactivar los sticky headers mientras el modal de registro esté abierto.
                                        function checkOpenVentanas() {
                                            opSetupRegisterAvance();

                                            // Reparentar modales al body de forma dinámica para evitar que queden ocultos
                                            // por sus contenedores padres (.tab-pane) que tienen display: none !important en vista dividida.
                                            var ventanasToMove = document.querySelectorAll('[id^="Ventana"], .sweet-local');
                                            for (var j = 0; j < ventanasToMove.length; j++) {
                                                var el = ventanasToMove[j];
                                                if (el && el.parentNode !== document.body) {
                                                    document.body.appendChild(el);
                                                }
                                            }

                                            var anyOpen = false;
                                            var ventanas = document.querySelectorAll('[id^="Ventana"], .sweet-local, .modal.show');
                                            for (var i = 0; i < ventanas.length; i++) {
                                                var v = ventanas[i];
                                                var display = window.getComputedStyle(v).display;
                                                if (display !== 'none' && display !== '') {
                                                    anyOpen = true;
                                                    break;
                                                }
                                            }
                                            if (anyOpen) {
                                                document.body.classList.add('op-modal-open');
                                            } else {
                                                document.body.classList.remove('op-modal-open');
                                            }
                                        }

                                        // --- SPRINT 9 FIX #2: textarea + documento OnlyOffice OPCIONAL en "Registrar avance" ---
                                        // Inyecta un textarea de observación y un botón para crear el documento OnlyOffice
                                        // solo si el usuario lo pide. El bloque #oo-editor-block queda oculto por defecto.
                                        function opSetupRegisterAvance() {
                                            var block = document.getElementById('oo-editor-block');
                                            if (!block || document.getElementById('op-register-desc')) return;

                                            var ta = document.createElement('textarea');
                                            ta.className = 'form-control mb-3';
                                            ta.id = 'op-register-desc';
                                            ta.setAttribute('placeholder', 'Escribe tu observación o avance aquí...');
                                            ta.setAttribute('rows', '3');

                                            var btn = document.createElement('button');
                                            btn.type = 'button';
                                            btn.id = 'op-register-oo-toggle';
                                            btn.className = 'btn btn-outline-primary btn-sm mb-2';
                                            btn.innerHTML = '➕ Anexar/Crear documento OnlyOffice';

                                            block.parentNode.insertBefore(ta, block);
                                            block.parentNode.insertBefore(btn, block);
                                            block.style.display = 'none';

                                            btn.addEventListener('click', function () {
                                                block.style.display = '';
                                                btn.style.display = 'none';
                                                if (typeof window.ooCreateDoc === 'function') { window.ooCreateDoc('document'); }
                                            });
                                        }

                                        // Hook submit de "Registrar avance": combina el texto del textarea con el oo:ref
                                        // en #textInput. Sin documento creado (#textInput sin "oo:"), envia solo el texto.
                                        document.addEventListener('submit', function (e) {
                                            var form = e.target;
                                            if (!form || !form.querySelector) return;
                                            var descEl = form.querySelector('#op-register-desc');
                                            if (!descEl) return;
                                            var textInput = form.querySelector('#textInput') || document.getElementById('textInput');
                                            if (!textInput) return;
                                            var desc = (descEl.value || '').trim();
                                            var existing = (textInput.value || '').trim();
                                            var ooRef = (existing.indexOf('oo:') === 0) ? existing : '';
                                            textInput.value = ooRef ? (desc ? (desc + '\n' + ooRef) : ooRef) : desc;
                                        }, true);

                                        // --- SPRINT 10: ACTIVITY CARD ADAPTER ---
                                        // Tags legacy activity tables with a special class to enable
                                        // modern pure CSS card styling without modifying the DOM.
                                        // This guarantees 100% print/PDF compatibility and legibility.
                                        function opAdaptActivityCard() {
                                            var container = document.getElementById('Formulario') || document.querySelector('.main-content');
                                            if (!container) return;

                                            var tables = container.querySelectorAll('table.table-bordered');
                                            for (var t = 0; t < tables.length; t++) {
                                                var tbl = tables[t];

                                                // Skip already tagged, header tables (with img), or wizard tables
                                                if (tbl.classList.contains('op-activity-card-table')) continue;
                                                if (tbl.closest('.card-header')) continue;
                                                if (tbl.querySelector('img')) continue;
                                                if (tbl.classList.contains('op-wiz-stage-table')) continue;

                                                // Detection: must contain AUTOR: AND (ACTIVIDAD or ESTADO:)
                                                var textContent = (tbl.textContent || '').trim();
                                                if (textContent.indexOf('AUTOR:') === -1) continue;
                                                if (textContent.indexOf('ACTIVIDAD') === -1 && textContent.indexOf('ESTADO:') === -1) continue;

                                                tbl.classList.add('op-activity-card-table');
                                            }
                                        }

                                        // --- SPRINT 7: ORQUESTADOR ÚNICO DE INICIALIZACIÓN DE LA CAPA .op-* ---
                                        function opInit() {
                                            setTimeout(restoreContext, 100);
                                            setTimeout(opForceExpandAll, 150);
                                            setTimeout(opInitStickyHeader, 180);
                                            setTimeout(opInitSplitScreen, 250);
                                            setTimeout(opSetupRegisterAvance, 200);
                                            // Sprint 10: adapt activity tables to card layout
                                            setTimeout(opAdaptActivityCard, 280);

                                            // Re-inicializar al cambiar de tab
                                            document.addEventListener('click', function (e) {
                                                var tabEl = e.target.closest('a[data-toggle="tab"], .nav-link');
                                                if (tabEl) {
                                                    // SPRINT 10: Autosave active textareas before changing tab
                                                    var detailPanel = document.getElementById('op-detail-panel');
                                                    if (detailPanel) {
                                                        var activeTextareas = detailPanel.querySelectorAll('textarea[id^="op-detail-response-text-"]');
                                                        activeTextareas.forEach(function (ta) {
                                                            var ids = ta.id.replace('op-detail-response-text-', '').split('-');
                                                            var idx = parseInt(ids[0], 10);
                                                            var subIdx = parseInt(ids[1], 10);
                                                            opAutoSaveResponse(idx, subIdx);
                                                        });
                                                    }
                                                    setTimeout(function () {
                                                        opForceExpandAll();
                                                        opInitSplitScreen();
                                                        opAdaptActivityCard();
                                                    }, 300);
                                                }
                                            });

                                            // Intercept legacy modal triggers to move them to body before display
                                            if (typeof window.mostrarConvencion === 'function') {
                                                var originalMostrarConvencion = window.mostrarConvencion;
                                                window.mostrarConvencion = function (id) {
                                                    var modal = document.getElementById('Ventana' + id);
                                                    if (modal && modal.parentNode !== document.body) {
                                                        document.body.appendChild(modal);
                                                    }
                                                    originalMostrarConvencion(id);
                                                };
                                            }

                                            setInterval(checkOpenVentanas, 300);
                                        }

                                        // Restaurar cuando el DOM esté listo
                                        if (document.readyState === 'loading') {
                                            document.addEventListener('DOMContentLoaded', opInit);
                                        } else {
                                            opInit();
                                        }
                                    })();
                        </script>
    </body>

    </html>