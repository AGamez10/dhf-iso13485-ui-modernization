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
               Las actividades finalizadas se muestran completas igual que
               las activas. No se ocultan filas con CSS.
               ═══════════════════════════════════════════════════════════════ */
            /* Indicador visual sutil para actividades finalizadas (solo borde) */
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
            .sweet-local[id^="Ventana"],
            [id^="Ventana"],
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
                from { opacity: 0; transform: translateY(6px); }
                to   { opacity: 1; transform: translateY(0); }
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

            /* Hide all other elements of card-body / Formulario in split mode to avoid visual mix-up */
            body.op-split-mode .card-body > *:not(#op-view-toolbar):not(#op-split-workspace),
            body.op-split-mode #Formulario > *:not(#op-view-toolbar):not(#op-split-workspace) {
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
            .op-seg-btn + .op-seg-btn { border-left: 1px solid var(--op-border-strong); }
            .op-seg-btn.op-active {
                background: var(--op-surface-card);
                color: var(--op-text-primary);
                box-shadow: inset 0 -2px 0 var(--op-border-active);
            }
            .op-toolbar-actions { display: inline-flex; align-items: center; gap: 10px; }
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
            .op-action-primary:hover { filter: brightness(0.95); }
            .op-action-tertiary {
                border: none;
                background: transparent;
                color: var(--op-text-secondary);
                padding: 7px 10px;
                font-size: 13px;
                font-weight: 600;
                cursor: pointer;
            }
            .op-action-tertiary:hover { color: var(--op-text-primary); }
            .op-activity-card { display: flex !important; align-items: flex-start; }
            .op-status-dot {
                display: inline-block;
                width: 5px; height: 5px;
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
            .op-detail-content-wrapper table.table-bordered {
                border: none !important;
                box-shadow: none !important;
                background: transparent !important;
            }
            .op-detail-content-wrapper table.table-bordered td,
            .op-detail-content-wrapper table.table-bordered th {
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

            /* H-d: impresión — lo que se ve es lo que sale */
            @media print {
                @page { size: A4; margin: 1.5cm; }
                body { background: #ffffff !important; }
                .navbar, .navbar-bg, .main-sidebar, #sidebar-wrapper,
                #op-view-toolbar, #myTab, #op-split-workspace,
                #myTab2Content .card-header-action,
                #myTab2Content a[href*="TempM="],
                #myTab2Content a[href*="opc=22"],
                #myTab2Content a[href*="opc=13"],
                #myTab2Content input[type="submit"],
                .op-collapse-toggle-btn, .op-editor-overlay, .iziToast, .sweet-overlay {
                    display: none !important;
                }
                /* siempre imprimir el documento continuo, sin importar el modo en pantalla */
                #myTab2Content { display: block !important; }
                .main-content { padding: 0 !important; }
                .card, .card-body { box-shadow: none !important; border: none !important; margin: 0 !important; }
                /* expandir actividades colapsadas por smart collapse: el auditor necesita el registro completo */
                .main-content table.table-bordered.op-activity-collapsed tbody tr { display: table-row !important; }
                /* que una actividad no se parta entre paginas */
                #myTab2Content table.table-bordered { page-break-inside: avoid !important; box-shadow: none !important; }
                thead { display: table-header-group !important; }
                /* conservar color de estados en papel (con print-color-adjust) */
                * { -webkit-print-color-adjust: exact !important; print-color-adjust: exact !important; }
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
                box-shadow: 0 2px 4px rgba(0,0,0,0.02);
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
            .op-wizard-stage-card {
                background: #ffffff;
                border: 1px solid var(--op-border-subtle);
                border-radius: var(--op-radius-md);
                padding: 14px;
                margin-bottom: 14px;
            }
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

        <!-- Integración Global del SDK Office Platform -->
        <% 
            Object documentObj = session.getAttribute("Documento"); 
            Object usuarioObj = session.getAttribute("Usuario");
            Object idUsuarioObj = session.getAttribute("Id_usuario");
            
            String cedulaStr = "";
            if (documentObj != null && !documentObj.toString().trim().isEmpty()) {
                cedulaStr = documentObj.toString().trim();
            } else if (idUsuarioObj != null && !idUsuarioObj.toString().trim().isEmpty()) {
                cedulaStr = "usr_" + idUsuarioObj.toString().trim();
            } else if (usuarioObj != null && !usuarioObj.toString().trim().isEmpty()) {
                cedulaStr = "usr_" + usuarioObj.toString().trim().replaceAll("[^a-zA-Z0-9]", "_");
            } else {
                cedulaStr = "sess_" + session.getId();
            }
            
            String nombreStr = (usuarioObj != null && !usuarioObj.toString().trim().isEmpty()) 
                    ? usuarioObj.toString().trim() 
                    : "Usuario";
                    
            String token = Methods.OfficePlatformResolver.resolveToken(cedulaStr, nombreStr);
        %>
        <%-- Contenedor oculto para el widget OnlyOffice en paginas que no tienen
             el suyo propio (evita "Container not found"). Se omite en OfficePlatform.jsp,
             que ya tiene su propio #office-platform visible. --%>
        <% if (request.getRequestURI() == null
               || !request.getRequestURI().toLowerCase().contains("officeplatform")) { %>
            <div id="office-platform" style="display: none;"></div>
        <% } %>
        <script src="http://localhost:8080/office-platform-widget.js?v=<%= System.currentTimeMillis() %>"
            data-api-key="opk_GYJwuySqt4GxHjriA5EsFmU7LF2agmBjp5AMc30BGB0" data-container="office-platform"
            data-server="http://localhost:8080" data-token="<%= token %>">
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
                        if (fid && typeof OfficePlatform !== 'undefined' && typeof OfficePlatform.openEditor === 'function') {
                            e.preventDefault();
                            e.stopPropagation();
                            OfficePlatform.openEditor({ fileId: parseInt(fid, 10) });
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
                    // AUTOMATIC DOM SCANNER
                    // Convierte cualquier texto tipo oo:129:Nueva hoja de cálculo.xlsx
                    // en un botón estético que abre el editor OnlyOffice al hacer clic.
                    // ═══════════════════════════════════════════════════════════════
                    function ooFormatTextNodes() {
                        var walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
                        var node;
                        var nodesToReplace = [];
                        while (node = walker.nextNode()) {
                            if (node.nodeValue && node.nodeValue.indexOf('oo:') !== -1) {
                                var parent = node.parentNode;
                                if (parent && !parent.closest('script, style, textarea, input, .oo-toolbar, .oo-formatted')) {
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

                                return '<a href="http://localhost:8080/api/files/' + fileId + '/download" data-file-id="' + fileId + '" class="btn btn-sm ' + btnStyle + ' oo-formatted" style="margin:2px 4px; font-weight:600; text-transform:none;" title="Abrir en OnlyOffice Pantalla Completa"><i class="far ' + iconClass + ' mr-1"></i> ' + fileName + '</a>';
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
            document.addEventListener('DOMContentLoaded', function() { opForceExpandAll(); });
            window.addEventListener('load', function() { opForceExpandAll(); });

            // MutationObserver: reacciona a cualquier cambio de clase en el DOM
            // (ej: Bootstrap agrega/quita .show cuando el usuario cambia de tab)
            var opExpandObserver = new MutationObserver(function(mutations) {
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
            window.addEventListener('load', function() {
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

                var formulario = document.getElementById('Formulario') || document.querySelector('.main-content') || document.body;
                if (!formulario) return;

                var cardBody = formulario.querySelector('.card-body') || formulario;
                if (!cardBody) return;

                // Cleanup existing workspace if present
                var existingWorkspace = document.getElementById('op-split-workspace');
                if (existingWorkspace) {
                    existingWorkspace.remove();
                    _opPlaceholders.forEach(function(pl) { if(pl) pl.remove(); });
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
                        
                        var paneTables = pane.querySelectorAll('table.table-bordered');
                        var secActivities = [];
                        
                        for (var i = 0; i < paneTables.length; i++) {
                            var elem = paneTables[i];
                            if (elem.closest('.card-header') || elem.id === 'op-view-toolbar' || elem.querySelector('img')) continue;
                            var textContent = (elem.textContent || elem.innerText || '').trim();
                            if (textContent.indexOf('AUTOR:') !== -1 || textContent.indexOf('ACTIVIDAD') !== -1 || textContent.indexOf('ESTADO:') !== -1 || textContent.indexOf('RESPUESTAS') !== -1) {
                                var globalIndex = activityElements.length;
                                activityElements.push(elem);
                                
                                var actTitle = 'Actividad DHF ' + (secActivities.length + 1);
                                // EJE G FIX G6: el textContent de una <table> concatena TODAS las celdas
                                // sin separador (por eso el titulo se pegaba con "AUTOR:"). Leemos cada
                                // celda por separado y tomamos la primera que parece titulo de actividad
                                // y que NO sea el metadato AUTOR. textContent por-celda funciona aunque la
                                // tabla este oculta (a diferencia de innerText, que devuelve '' si display:none).
                                var _cells = elem.querySelectorAll('td, th');
                                for (var _ci = 0; _ci < _cells.length; _ci++) {
                                    var _ct = (_cells[_ci].textContent || '').trim();
                                    if (!_ct || _ct.indexOf('AUTOR') !== -1) continue;
                                    if (/^(ACTIVIDAD\s*\d+|7\.3\.\d|[A-Z]\s*[-–]\s)/i.test(_ct)) { actTitle = _ct.substring(0, 70); break; }
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
                    var flatActivities = [];
                    for (var i = 0; i < allTables.length; i++) {
                        var elem = allTables[i];
                        if (elem.closest('.card-header') || elem.id === 'op-view-toolbar' || elem.querySelector('img')) continue;
                        var textContent = (elem.textContent || elem.innerText || '').trim();
                        if (textContent.indexOf('AUTOR:') !== -1 || textContent.indexOf('ACTIVIDAD') !== -1 || textContent.indexOf('ESTADO:') !== -1 || textContent.indexOf('RESPUESTAS') !== -1) {
                            var globalIndex = activityElements.length;
                            activityElements.push(elem);
                            
                            var actTitle = 'Actividad DHF ' + (flatActivities.length + 1);
                            var firstRow = elem.querySelector('tr');
                            if (firstRow) actTitle = (firstRow.textContent || '').trim().substring(0, 60);
                            
                            flatActivities.push({
                                element: elem,
                                title: actTitle,
                                globalIndex: globalIndex,
                                sectionTitle: 'Memoria DHF'
                            });
                        }
                    }
                    if (flatActivities.length > 0) {
                        sections.push({
                            id: 'section_main',
                            title: 'Memoria DHF',
                            activities: flatActivities
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
                sections.forEach(function(sec) {
                    sec.activities.forEach(function(act) {
                        _opActivitiesList[act.globalIndex] = act;
                    });
                });

                // Insert enterprise view mode toolbar
                var targetContainer = cardBody.querySelector('.contenedor') || cardBody.querySelector('.row') || cardBody.firstElementChild || cardBody;
                var existingToolbar = document.getElementById('op-view-toolbar');
                if (existingToolbar) existingToolbar.remove();

                var toolbar = document.createElement('div');
                toolbar.id = 'op-view-toolbar';
                toolbar.className = 'op-view-toolbar mb-4 d-flex align-items-center justify-content-between flex-wrap gap-2';
                toolbar.style.cssText = 'background: #ffffff !important; padding: 12px 20px !important; border-radius: 10px !important; border: 1px solid var(--op-border-strong) !important; box-shadow: 0 4px 12px rgba(0,0,0,0.05) !important; margin-bottom: 24px !important; width: 100% !important; display: flex !important; justify-content: space-between !important; align-items: center !important; position: relative !important; z-index: 10 !important;';

                toolbar.innerHTML = ''
                    + '<div class="op-seg-control" role="group">'
                    + '  <button type="button" class="op-seg-btn op-active" id="op-btn-full-doc" title="Vista de lectura continua (0 clics)"><i class="fas fa-file-alt mr-1"></i> Documento continuo</button>'
                    + '  <button type="button" class="op-seg-btn" id="op-btn-split" title="Vista de gestion dividida (estilo IDE / Notion)"><i class="fas fa-columns mr-1"></i> Vista dividida</button>'
                    + '</div>'
                    + '<div class="op-toolbar-actions">'
                    + '  <button type="button" class="op-action-tertiary" id="op-btn-batch-modal" onclick="if(typeof opShowBatchCreationModal===\'function\')opShowBatchCreationModal();"><i class="fas fa-bolt mr-1"></i> Cargue masivo</button>'
                    + '  <button type="button" class="op-action-primary" id="op-btn-save-all" onclick="alert(\'Memoria guardada correctamente.\');"><i class="fas fa-save mr-1"></i> Guardar memoria</button>'
                    + '</div>';

                // SPRINT 9 FIX: el toolbar va como hijo DIRECTO de #Formulario. Si queda
                // dentro del .row/.card-body legacy, la regla body.op-split-mode #Formulario
                // > *:not(#op-view-toolbar) oculta ese .row y se lleva el toolbar con él.
                formulario.insertBefore(toolbar, formulario.firstChild);

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
                    + '<div class="op-progress-label">' + _opFinalized + ' / ' + activityElements.length + ' actividades finalizadas</div>';
                masterPanel.appendChild(masterHeader);

                // Render Sections Tree in Master Panel
                sections.forEach(function(sec) {
                    var secCard = document.createElement('div');
                    secCard.className = 'op-tree-section';
                    secCard.innerHTML = ''
                        + '<div class="op-tree-section-header" onclick="this.parentNode.classList.toggle(\'collapsed\')">'
                        + '  <span class="text-truncate" style="max-width:220px;" title="' + sec.title + '"><i class="fas fa-folder-open text-warning mr-1"></i> ' + sec.title + '</span>'
                        + '  <span class="d-flex align-items-center gap-1">'
                        + '    <span class="badge badge-light border" style="font-size:10px;">' + sec.activities.length + '</span>'
                        + '    <i class="fas fa-chevron-down op-tree-icon"></i>'
                        + '  </span>'
                        + '</div>';
                    
                    var secBody = document.createElement('div');
                    secBody.className = 'op-tree-section-body';
                    
                    sec.activities.forEach(function(act) {
                        var card = document.createElement('div');
                        card.className = 'op-activity-card p-2 mb-1';
                        card.setAttribute('data-activity-index', act.globalIndex);
                        card.style.cssText = 'background:#ffffff; border:1px solid #e2e8f0; border-radius:6px; cursor:pointer; font-size:12px; font-weight:600; color:#334155; transition:all 0.15s;';
                        // EJE G: estado real leido de act.element (no solo color → tambien en title, WCAG)
                        var _stTok = 'muted', _stLbl = 'Sin iniciar';
                        if (act.element.querySelector('.text-success')) { _stTok = 'finalizado'; _stLbl = 'Finalizada'; }
                        else if (act.element.querySelector('.text-warning')) { _stTok = 'revision'; _stLbl = 'En revisión'; }
                        else if (/EN PROCESO|PROCESO/i.test(act.element.textContent || '')) { _stTok = 'proceso'; _stLbl = 'En proceso'; }
                        card.setAttribute('title', act.title + ' — ' + _stLbl);
                        card.innerHTML = '<span class="op-status-dot" style="background:var(--op-status-' + _stTok + '-dot, var(--op-text-muted));"></span>'
                            + '<span class="op-activity-card-title">' + act.title + '</span>';
                        secBody.appendChild(card);
                    });
                    
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

                var firstElem = activityElements[0];
                // SPRINT 9 FIX: el workspace va como hijo DIRECTO de #Formulario (no dentro
                // del .card-body, que está anidado en el .row que se oculta en split). Así el
                // :not(#op-split-workspace) lo protege y su ancestro no colapsa a 0x0.
                formulario.appendChild(workspace);

                var currentMode = sessionStorage.getItem('op_view_mode') || 'full';

                function applyViewMode(mode) {
                    currentMode = mode;
                    sessionStorage.setItem('op_view_mode', mode);

                    var btnFull = document.getElementById('op-btn-full-doc');
                    var btnSplit = document.getElementById('op-btn-split');

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

                        // Un-hide all tab-panes and activity tables
                        for (var x = 0; x < activityElements.length; x++) {
                            activityElements[x].style.display = '';
                        }
                        for (var tp = 0; tp < tabPanes.length; tp++) {
                            tabPanes[tp].style.display = 'block';
                            tabPanes[tp].style.removeProperty('display');
                            tabPanes[tp].style.opacity = '1';
                        }
                        var allEditors = cardBody.querySelectorAll('.op-fast-editor-block');
                        for (var e = 0; e < allEditors.length; e++) { allEditors[e].style.display = 'block'; }
                    } else if (mode === 'split') {
                        if (btnSplit) btnSplit.classList.add('op-active');
                        if (btnFull) btnFull.classList.remove('op-active');
                        
                        document.body.classList.add('op-split-mode');
                        document.body.classList.remove('op-fullview-mode');

                        // Hide all original activities
                        for (var y = 0; y < activityElements.length; y++) {
                            activityElements[y].style.display = 'none';
                        }
                        // Ocultar de forma estricta todos los tab-panes para que no se mezclen
                        for (var tps = 0; tps < tabPanes.length; tps++) {
                            tabPanes[tps].style.setProperty('display', 'none', 'important');
                        }
                        var allEditorsSplit = cardBody.querySelectorAll('.op-fast-editor-block');
                        for (var es = 0; es < allEditorsSplit.length; es++) { allEditorsSplit[es].style.display = 'none'; }
                        
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

            // Render selected activity in Detail Panel (Cross-Section & Interactive)
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

                var meta = _opActivitiesList[index] || {};
                var title = meta.title || ('Actividad DHF ' + (index + 1));
                var sectionTitle = meta.sectionTitle || 'Etapa ISO';

                var prevDisabled = index === 0 ? 'disabled' : '';
                var nextDisabled = index === (activityElements.length - 1) ? 'disabled' : '';

                // Build Detail Panel HTML
                detailPanel.innerHTML = ''
                    + '<div class="op-detail-breadcrumb">'
                    + '  <i class="fas fa-layer-group text-primary"></i>'
                    + '  <span>' + sectionTitle + '</span>'
                    + '  <i class="fas fa-chevron-right text-muted mx-1" style="font-size:10px;"></i>'
                    + '  <span class="font-weight-bold text-dark">' + title + '</span>'
                    + '</div>'
                    + '<div class="d-flex align-items-center justify-content-between pb-3 mb-4 border-bottom">'
                    + '  <div>'
                    + '    <span class="badge badge-primary px-2 py-1 mb-1">DHF ISO 13485</span>'
                    + '    <h5 class="m-0 font-weight-bold text-dark">' + title + '</h5>'
                    + '  </div>'
                    + '  <div class="d-flex align-items-center gap-2">'
                    + '    <button type="button" class="btn btn-sm btn-outline-primary font-weight-bold" onclick="opOpenRegisterForActivity(' + index + ')"><i class="fas fa-edit"></i> Registrar Avance</button>'
                    + '    <span class="text-muted font-weight-bold ml-3" style="font-size:12px;">Actividad ' + (index + 1) + ' de ' + activityElements.length + '</span>'
                    + '  </div>'
                    + '</div>'
                    + '<div class="op-detail-content-wrapper mb-4"></div>'
                    + '<div class="op-onlyoffice-embedded-container" id="op-onlyoffice-embedded-' + index + '" style="margin-top:20px;"></div>'
                    + '<div class="op-detail-nav-footer">'
                    + '  <button type="button" class="btn btn-sm btn-outline-secondary font-weight-bold" ' + prevDisabled + ' onclick="opShowActivityDetail(' + (index - 1) + ', _opActivityElements, document.getElementById(\'op-detail-panel\'), document.getElementById(\'op-master-panel\'))"><i class="fas fa-arrow-left mr-1"></i> Anterior Actividad</button>'
                    + '  <span class="text-muted font-weight-bold" style="font-size:12px;">' + (index + 1) + ' / ' + activityElements.length + '</span>'
                    + '  <button type="button" class="btn btn-sm btn-outline-primary font-weight-bold" ' + nextDisabled + ' onclick="opShowActivityDetail(' + (index + 1) + ', _opActivityElements, document.getElementById(\'op-detail-panel\'), document.getElementById(\'op-master-panel\'))">Siguiente Actividad <i class="fas fa-arrow-right ml-1"></i></button>'
                    + '</div>';

                window._opActivityElements = activityElements;

                // Move real node into detail wrapper
                detailPanel.querySelector('.op-detail-content-wrapper').appendChild(realNode);

                // G-c FIX G3: etiquetar los iconos de control legacy (historial/adjuntos/compartir)
                // de forma ADITIVA — se agrega un <span> junto al icono sin tocar el innerHTML del
                // <a> (eso mataria los handlers legacy emitidos por Tag_memoria).
                (function () {
                    var lblMap = [
                        { sel: '.fa-history', txt: 'Historial' },
                        { sel: '.fa-paperclip', txt: 'Adjuntos' },
                        { sel: '.fa-envelope', txt: 'Compartir' }
                    ];
                    for (var mi = 0; mi < lblMap.length; mi++) {
                        var icons = realNode.querySelectorAll(lblMap[mi].sel);
                        for (var i = 0; i < icons.length; i++) {
                            var ctrl = icons[i].closest('a, button');
                            if (!ctrl || ctrl.querySelector('.op-icon-label')) continue;
                            var span = document.createElement('span');
                            span.className = 'op-icon-label';
                            span.textContent = lblMap[mi].txt;
                            ctrl.appendChild(span);
                        }
                    }
                })();

                // Detect OnlyOffice file link
                var fileLink = realNode.querySelector('a[href*="/api/files/"]');
                var ooContainer = document.getElementById('op-onlyoffice-embedded-' + index);
                if (fileLink && ooContainer) {
                    var href = fileLink.getAttribute('href');
                    var match = href.match(/\/api\/files\/(\d+)\/download/);
                    if (match && match[1]) {
                        var fileId = match[1];
                        ooContainer.innerHTML = ''
                            + '<div class="font-weight-bold text-dark mb-2" style="font-size:13px;"><i class="fas fa-file-alt text-primary mr-1"></i> Documento OnlyOffice Asociado:</div>'
                            + '<div id="op-oo-frame-wrapper-' + index + '" style="height:550px; border:1px solid #cbd5e1; border-radius:10px; overflow:hidden;"></div>';
                        
                        setTimeout(function() {
                            if (typeof window.ooInitEditor === 'function') {
                                window.ooInitEditor({
                                    containerId: 'op-oo-frame-wrapper-' + index,
                                    inputId: 'textInput',
                                    existingFileId: parseInt(fileId, 10),
                                    autoLoad: true
                                });
                            }
                        }, 200);
                    }
                } else if (ooContainer) {
                    ooContainer.innerHTML = ''
                        + '<div class="alert alert-light border p-3" style="border-radius:10px;">'
                        + '  <div class="font-weight-bold text-muted mb-2" style="font-size:12px;"><i class="fas fa-file-medical text-info mr-1"></i> Esta actividad no cuenta con un archivo OnlyOffice asociado. ¿Deseas iniciar uno?</div>'
                        + '  <div class="d-flex gap-2">'
                        + '    <button type="button" class="btn btn-sm btn-outline-primary" onclick="opCreateOnlyOfficeForSelected(' + index + ', \'document\')"><i class="far fa-file-word mr-1"></i> Documento Word</button>'
                        + '    <button type="button" class="btn btn-sm btn-outline-success" onclick="opCreateOnlyOfficeForSelected(' + index + ', \'spreadsheet\')"><i class="far fa-file-excel mr-1"></i> Planilla Excel</button>'
                        + '    <button type="button" class="btn btn-sm btn-outline-warning text-dark" onclick="opCreateOnlyOfficeForSelected(' + index + ', \'presentation\')"><i class="far fa-file-powerpoint mr-1"></i> Presentación PPT</button>'
                        + '  </div>'
                        + '</div>';
                }

                detailPanel.scrollTop = 0;
                sessionStorage.setItem('op_split_selected', index);
            }

            // Abrir el modal "Registrar avance" configurado para esta actividad
            window.opOpenRegisterForActivity = function(index) {
                var realSelect = document.querySelector('#Ventana1 select[name="numeral"]') || document.querySelector('select[name="numeral"]');
                var activityEl = _opPlaceholders[index] ? _opPlaceholders[index].nextElementSibling : null;
                if (!activityEl) return;
                
                // Tratar de buscar el valor del numeral/etapa en la tabla
                var firstRow = activityEl.querySelector('tr');
                var text = firstRow ? (firstRow.textContent || '').trim() : '';
                
                // Mostrar Ventana1
                if (typeof mostrarConvencion === 'function') {
                    mostrarConvencion(1);

                    // SPRINT 9: reiniciar el modal a "Solo Texto" por defecto al abrir
                    var ta = document.getElementById("op-register-desc");
                    if (ta) ta.value = "";
                    var block = document.getElementById("oo-editor-block");
                    if (block) block.style.display = "none";
                    var btnToggle = document.getElementById("op-register-oo-toggle");
                    if (btnToggle) btnToggle.style.display = "";
                    window._ooCurrentFileId = null;
                    var textInput = document.getElementById("textInput");
                    if (textInput) textInput.value = "";
                    var container = document.getElementById("oo-editor-container");
                    if (container) container.innerHTML = "<div id='oo-editor-loading' style='display:flex;align-items:center;justify-content:center;height:100%;color:#aaa;font-size:14px;gap:10px;'><i class='fas fa-spinner fa-spin'> Cargando editor...";

                    // Buscar coincidencia en el select
                    if (realSelect && text) {
                        for (var i = 0; i < realSelect.options.length; i++) {
                            var opt = realSelect.options[i];
                            if (opt.text && text.indexOf(opt.text) !== -1) {
                                realSelect.selectedIndex = i;
                                $(realSelect).trigger('change');
                                break;
                            }
                        }
                    }
                }
            };

            // Crear documento OnlyOffice directamente en la actividad seleccionada
            window.opCreateOnlyOfficeForSelected = function(index, type) {
                opOpenRegisterForActivity(index);
                setTimeout(function() {
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

            window.opShowBatchCreationModal = function() {
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
                    var html = '<div class="alert alert-info py-2" style="font-size:12px;"><i class="fas fa-info-circle mr-1"></i> Selecciona las Etapas ISO 13485 sobre las que deseas crear un lote de actividades.</div>'
                        + '<div class="d-flex align-items-center justify-content-between mb-3">'
                        + '  <label class="font-weight-bold m-0" style="font-size:13px;">Etapas ISO Disponibles en este Proyecto:</label>'
                        + '  <button type="button" class="btn btn-sm btn-link text-primary font-weight-bold" onclick="opToggleSelectAllStages(true)"><i class="fas fa-check-square mr-1"></i> Seleccionar Todas</button>'
                        + '</div>'
                        + '<div class="row" id="op-wiz-stages-list">';

                    availableStages.forEach(function(stg, idx) {
                        var checked = (window._opSelectedStages.indexOf(stg.value) !== -1 || window._opSelectedStages.length === 0) ? 'checked' : '';
                        html += '<div class="col-md-6 mb-2">'
                            + '  <div class="p-2 border rounded bg-white d-flex align-items-center gap-2">'
                            + '    <input type="checkbox" class="op-wiz-stage-chk" value="' + stg.value + '" data-text="' + stg.text.replace(/"/g, '&quot;') + '" id="chk_stg_' + idx + '" ' + checked + '>'
                            + '    <label for="chk_stg_' + idx + '" class="m-0 font-weight-bold text-dark" style="font-size:12px; cursor:pointer;">' + stg.text + '</label>'
                            + '  </div>'
                            + '</div>';
                    });

                    html += '</div>';
                    container.innerHTML = html;

                    footerBtns.innerHTML = '<button type="button" class="btn btn-primary btn-sm font-weight-bold" onclick="opBatchNextToStep2()"><i class="fas fa-arrow-right mr-1"></i> Siguiente: Configurar Actividades</button>';
                } else if (step === 2) {
                    var chks = document.querySelectorAll('.op-wiz-stage-chk:checked');
                    var selected = [];
                    chks.forEach(function(c) {
                        selected.push({ value: c.value, text: c.getAttribute('data-text') });
                    });
                    if (selected.length === 0) {
                        alert('Debes seleccionar al menos una etapa ISO.');
                        opRenderWizardStep(1);
                        return;
                    }
                    window._opSelectedStagesList = selected;

                    var html = '<div class="alert alert-info py-2" style="font-size:12px;"><i class="fas fa-info-circle mr-1"></i> Define las actividades y el tipo de documento OnlyOffice que se generará para cada Etapa ISO seleccionada.</div>'
                        + '<div style="max-height: 50vh; overflow-y: auto; padding-right: 4px;">';

                    selected.forEach(function(stg) {
                        html += '<div class="op-wizard-stage-card">'
                            + '  <div class="font-weight-bold text-primary mb-2" style="font-size:13px;"><i class="fas fa-folder text-warning mr-1"></i> ' + stg.text + '</div>'
                            + '  <table class="table table-sm table-bordered op-wiz-stage-table" data-stage="' + stg.value + '" style="font-size:12px;">'
                            + '    <thead class="bg-light"><tr><th>#</th><th>Nombre de la Actividad</th><th>Tipo de Documento OnlyOffice</th><th>Observación</th><th>Acción</th></tr></thead>'
                            + '    <tbody>'
                            + '      <tr>'
                            + '        <td>1</td>'
                            + '        <td><input type="text" class="form-control form-control-sm op-batch-title" placeholder="Ej. Matriz de Requisitos" value="Documento Técnico de ' + stg.text.substring(0, 25) + '"></td>'
                            + '        <td><select class="form-control form-control-sm op-batch-doc"><option value="docx">Documento Word (.docx)</option><option value="xlsx">Hoja de Cálculo Excel (.xlsx)</option><option value="pptx">Presentación PowerPoint (.pptx)</option><option value="none">Ninguno (Solo texto)</option></select></td>'
                            + '        <td><textarea class="form-control form-control-sm op-batch-desc" rows="1" placeholder="Observación (opcional)" style="resize:vertical; min-height:31px;"></textarea></td>'
                            + '        <td class="text-center"><button type="button" class="btn btn-sm btn-outline-danger" onclick="this.closest(\'tr\').remove()">&times;</button></td>'
                            + '      </tr>'
                            + '    </tbody>'
                            + '  </table>'
                            + '  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="opAddRowToStageTable(this)"><i class="fas fa-plus mr-1"></i> Agregar Actividad a esta Etapa</button>'
                            + '</div>';
                    });

                    html += '</div>';
                    container.innerHTML = html;

                    footerBtns.innerHTML = ''
                        + '<button type="button" class="btn btn-outline-secondary btn-sm font-weight-bold mr-2" onclick="opRenderWizardStep(1)"><i class="fas fa-arrow-left mr-1"></i> Volver a Etapas</button>'
                        + '<button type="button" class="btn btn-success btn-sm font-weight-bold" onclick="opExecuteBatchSubmit()"><i class="fas fa-bolt mr-1"></i> ⚡ Generar Memoria Completa en Lote</button>';
                }
            }

            window.opToggleSelectAllStages = function(select) {
                var chks = document.querySelectorAll('.op-wiz-stage-chk');
                chks.forEach(function(c) { c.checked = select; });
            };

            window.opBatchNextToStep2 = function() {
                var chks = document.querySelectorAll('.op-wiz-stage-chk:checked');
                if (chks.length === 0) {
                    alert('Por favor selecciona al menos una etapa ISO.');
                    return;
                }
                opRenderWizardStep(2);
            };

            window.opAddRowToStageTable = function(btn) {
                var table = btn.parentNode.querySelector('.op-wiz-stage-table');
                if (!table) return;
                var tbody = table.querySelector('tbody');
                var count = tbody.querySelectorAll('tr').length + 1;
                var tr = document.createElement('tr');
                tr.innerHTML = '<td>' + count + '</td><td><input type="text" class="form-control form-control-sm op-batch-title" placeholder="Nombre de actividad ' + count + '"></td><td><select class="form-control form-control-sm op-batch-doc"><option value="docx">Documento Word (.docx)</option><option value="xlsx">Hoja de Cálculo Excel (.xlsx)</option><option value="pptx">Presentación PowerPoint (.pptx)</option><option value="none">Ninguno (Solo texto)</option></select></td><td><textarea class="form-control form-control-sm op-batch-desc" rows="1" placeholder="Observación (opcional)" style="resize:vertical; min-height:31px;"></textarea></td><td class="text-center"><button type="button" class="btn btn-sm btn-outline-danger" onclick="this.closest(\'tr\').remove()">&times;</button></td>';
                tbody.appendChild(tr);
            };

            window.opExecuteBatchSubmit = function() {
                var btnSubmit = document.querySelector('#op-wiz-footer-btns .btn-success');
                if (btnSubmit && btnSubmit.disabled) return;

                var itemsToCreate = []; // [{ stage, title, docType }]
                var stageTables = document.querySelectorAll('.op-wiz-stage-table');

                stageTables.forEach(function(tbl) {
                    var stgVal = tbl.getAttribute('data-stage');
                    var rows = tbl.querySelectorAll('tbody tr');
                    rows.forEach(function(r) {
                        var titleInput = r.querySelector('.op-batch-title');
                        var docSelect = r.querySelector('.op-batch-doc');
                        var descInput = r.querySelector('.op-batch-desc');
                        if (titleInput && titleInput.value.trim()) {
                            itemsToCreate.push({
                                stage: stgVal,
                                title: titleInput.value.trim(),
                                docType: docSelect ? docSelect.value : 'docx',
                                desc: descInput ? descInput.value.trim() : ''
                            });
                        }
                    });
                });

                if (itemsToCreate.length === 0) {
                    alert('Por favor ingresa al menos una actividad válida para generar.');
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
                        fdText.append('personas', '[' + idUsuario + ']');
                        fdText.append('observacion', item.desc || '');
                        fetch('Proyecto?opc=9', {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                            body: fdText.toString()
                        }).then(function() {
                            appendLog('✔ Creado (solo texto): "' + item.title + '"');
                            index++;
                            createNext();
                        }).catch(function(err) {
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
                        .then(function(r) { return r.json(); })
                        .then(function(resp) {
                            if (!resp || !resp.data) throw new Error('Respuesta de OnlyOffice inválida');
                            var fileId = resp.data.fileId || resp.data.id;
                            var fileName = resp.data.originalFileName || (item.title + '.' + item.docType);

                            var formData = new URLSearchParams();
                            formData.append('estado', estadoM);
                            formData.append('ipy', idProyecto);
                            formData.append('id_usuario', idUsuario);
                            formData.append('fecha_reg', todayYMD);
                            formData.append('numeral', item.stage);
                            formData.append('personas', '[' + idUsuario + ']');
                            var ooRef = 'oo:' + fileId + ':' + fileName;
                            formData.append('observacion', item.desc ? (item.desc + '\n' + ooRef) : ooRef);

                            return fetch('Proyecto?opc=9', {
                                method: 'POST',
                                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                                body: formData.toString()
                            });
                        })
                        .then(function() {
                            appendLog('✔ Creado: "' + item.title + '"');
                            index++;
                            createNext();
                        })
                        .catch(function(err) {
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

            // --- SPRINT 7: ORQUESTADOR ÚNICO DE INICIALIZACIÓN DE LA CAPA .op-* ---
            function opInit() {
                setTimeout(restoreContext, 100);
                setTimeout(opForceExpandAll, 150);
                setTimeout(opInitStickyHeader, 180);
                setTimeout(opInitSplitScreen, 250);
                setTimeout(opSetupRegisterAvance, 200);

                // Re-inicializar al cambiar de tab
                document.addEventListener('click', function(e) {
                    var tabEl = e.target.closest('a[data-toggle="tab"], .nav-link');
                    if (tabEl) {
                        setTimeout(function() {
                            opForceExpandAll();
                            opInitSplitScreen();
                        }, 300);
                    }
                });

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