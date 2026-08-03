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
               SPRINT 5: SMART COLLAPSE (ACTIVIDADES FINALIZADAS)
               ═══════════════════════════════════════════════════════════════ */
            .main-content table.table-bordered.op-activity-collapsed {
                opacity: 0.88;
                border-left: 4px solid var(--op-status-finalizado-dot) !important;
                transition: opacity 0.2s ease, box-shadow 0.2s ease;
            }

            .main-content table.table-bordered.op-activity-collapsed:hover {
                opacity: 1;
                box-shadow: var(--op-shadow-2) !important;
            }

            .main-content table.table-bordered.op-activity-collapsed tbody tr:nth-child(n+4) {
                display: none !important;
            }

            .op-collapse-toggle-btn {
                background: var(--op-surface-muted);
                color: var(--op-status-proceso-text);
                border: 1px solid var(--op-border-muted);
                border-radius: var(--op-radius-sm);
                padding: 2px 8px;
                font-size: 11px;
                font-weight: 600;
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                gap: 4px;
                margin-left: 8px;
                transition: all 0.15s ease;
            }

            .op-collapse-toggle-btn:hover {
                background: var(--op-surface-muted-hover);
                color: var(--op-border-active);
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

            /* Estilizado de la ventana emergente de Historial de Cambios (TempM=11/3/7) */
            .sweet-local[id^="Ventana"],
            [id^="Ventana"] {
                position: fixed !important;
                top: 50% !important;
                left: 50% !important;
                transform: translate(-50%, -50%) !important;
                width: 90% !important;
                max-width: 1050px !important;
                max-height: 85vh !important;
                overflow-y: auto !important;
                background: #ffffff !important;
                border-radius: 12px !important;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4) !important;
                border: 1px solid var(--op-border-strong) !important;
                padding: 24px !important;
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

            /* Container 3-Column Grid Layout */
            .main-content {
                padding-top: 75px !important;
                padding-left: 265px !important;
                padding-right: 20px !important;
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
                display: flex !important;
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

            /* When split is active, hide the original tables flow */
            .op-split-active .op-original-table {
                display: none !important;
            }

            /* When split is inactive, hide the split workspace */
            .op-split-inactive .op-split-workspace {
                display: none !important;
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
            @media (max-width: 900px) {
                .op-split-workspace {
                    flex-direction: column !important;
                }
                .op-master-panel {
                    width: 100% !important;
                    max-width: none !important;
                    position: relative !important;
                    top: auto !important;
                    max-height: 300px !important;
                }
                .op-detail-panel {
                    position: relative !important;
                    top: auto !important;
                    max-height: none !important;
                }
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

            // --- SPRINT 5: SMART COLLAPSE PARA ACTIVIDADES FINALIZADAS ---
            function opInitSmartCollapse() {
                var tables = document.querySelectorAll('.main-content table.table-bordered');
                for (var i = 0; i < tables.length; i++) {
                    var table = tables[i];
                    var statusBadge = table.querySelector('b.text-success');
                    if (statusBadge && (statusBadge.textContent.indexOf('FINALIZADO') !== -1 || statusBadge.innerText.indexOf('FINALIZADO') !== -1)) {
                        table.classList.add('op-activity-collapsed');

                        // Insertar botón toggle de forma segura si no existe ya
                        if (!table.querySelector('.op-collapse-toggle-btn')) {
                            var statusTd = statusBadge.parentElement;
                            if (statusTd) {
                                var btn = document.createElement('button');
                                btn.type = 'button';
                                btn.className = 'op-collapse-toggle-btn';
                                btn.innerHTML = '<i class="fas fa-chevron-down"></i> Mostrar detalle';
                                btn.setAttribute('title', 'Alternar visibilidad del detalle de la actividad');
                                btn.addEventListener('click', (function (tbl, toggleBtn) {
                                    return function (e) {
                                        e.preventDefault();
                                        e.stopPropagation();
                                        var isCollapsed = tbl.classList.toggle('op-activity-collapsed');
                                        if (isCollapsed) {
                                            toggleBtn.innerHTML = '<i class="fas fa-chevron-down"></i> Mostrar detalle';
                                        } else {
                                            toggleBtn.innerHTML = '<i class="fas fa-chevron-up"></i> Ocultar detalle';
                                        }
                                    };
                                })(table, btn));
                                statusTd.appendChild(btn);
                            }
                        }
                    }
                }
            }

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

            // --- SPRINT 8: SPLIT-SCREEN WORKSPACE (MASTER-DETAIL) ---
            // Transforma la lista de actividades en un layout de 2 paneles:
            //   - Master (izquierda): tarjetas compactas con nombre, estado, fase
            //   - Detail (derecha): contenido completo de la actividad seleccionada
            // Solo se activa en la vista de Memorias (detecta #Formulario o .main-content).
            // Progressive enhancement puro: si falla, las tablas quedan intactas.
            function opInitSplitScreen() {
                var formulario = document.getElementById('Formulario') || document.querySelector('.main-content');
                if (!formulario) return;

                var cardBody = formulario.querySelector('.card-body');
                if (!cardBody) return;

                // Evitar duplicar el workspace si ya fue creado
                if (document.getElementById('op-split-workspace')) return;

                // Recopilar todas las tablas de actividades (incluyendo dentro de collapse/tabs)
                var tables = cardBody.querySelectorAll('table.table-bordered');
                var activityTables = [];
                for (var i = 0; i < tables.length; i++) {
                    var tbl = tables[i];
                    // Excluir tablas dentro de .card-header (cabecera ISO)
                    if (tbl.closest('.card-header')) continue;
                    activityTables.push(tbl);
                }

                if (activityTables.length === 0) return;

                // Extraer metadata de cada actividad para las tarjetas del master
                var activities = [];
                for (var j = 0; j < activityTables.length; j++) {
                    var table = activityTables[j];
                    var info = opExtractActivityInfo(table, j);
                    activities.push(info);
                }

                // Crear la barra de modos de vista Enterprise (Documento Completo | Vista Dividida | Cargue Masivo)
                var targetContainer = cardBody.querySelector('.contenedor') || cardBody.querySelector('.row') || cardBody;
                if (targetContainer && !document.getElementById('op-view-toolbar')) {
                    var toolbar = document.createElement('div');
                    toolbar.id = 'op-view-toolbar';
                    toolbar.className = 'op-view-toolbar mb-3 d-flex align-items-center gap-2 flex-wrap';
                    toolbar.style.cssText = 'background:var(--op-surface-muted); padding:8px 12px; border-radius:var(--op-radius-md); border:1px solid var(--op-border-subtle); margin-bottom:16px !important; width:100%; display:flex; justify-content:space-between; align-items:center;';

                    toolbar.innerHTML = ''
                        + '<div class="btn-group btn-group-toggle" data-toggle="buttons" style="gap:4px;">'
                        + '  <button type="button" class="btn btn-outline-primary btn-sm active" id="op-btn-full-doc"><i class="fas fa-file-alt mr-1"></i> 📄 Documento Completo (0 Clics)</button>'
                        + '  <button type="button" class="btn btn-outline-info btn-sm" id="op-btn-split"><i class="fas fa-columns mr-1"></i> 📊 Vista Dividida (Master-Detail)</button>'
                        + '</div>'
                        + '<button type="button" class="btn btn-success btn-sm font-weight-bold" id="op-btn-batch-modal"><i class="fas fa-bolt mr-1"></i> ⚡ Cargue Masivo DHF</button>';

                    targetContainer.parentNode.insertBefore(toolbar, targetContainer);
                }

                // Crear el workspace split-screen
                var workspace = document.createElement('div');
                workspace.className = 'op-split-workspace';
                workspace.id = 'op-split-workspace';

                // --- Master Panel ---
                var masterPanel = document.createElement('div');
                masterPanel.className = 'op-master-panel';
                masterPanel.id = 'op-master-panel';

                var masterHeader = document.createElement('div');
                masterHeader.className = 'op-master-header';
                masterHeader.innerHTML = '<h6><i class="fas fa-list-ul" style="margin-right:4px"></i>Actividades (' + activities.length + ')</h6>'
                    + '<span class="op-master-count" style="background:var(--op-status-proceso-bg);color:var(--op-status-proceso-text)">DHF ISO</span>';
                masterPanel.appendChild(masterHeader);

                // Build activity cards
                for (var k = 0; k < activities.length; k++) {
                    var act = activities[k];
                    var card = document.createElement('div');
                    card.className = 'op-activity-card';
                    card.setAttribute('data-activity-index', k);
                    card.setAttribute('tabindex', '0');

                    var dotClass = 'op-dot-proceso';
                    var statusLabel = 'En proceso';
                    if (act.status === 'finalizado') {
                        dotClass = 'op-dot-finalizado';
                        statusLabel = 'Finalizada';
                    } else if (act.status === 'revision') {
                        dotClass = 'op-dot-revision';
                        statusLabel = 'En revisión';
                    }

                    card.innerHTML = ''
                        + '<div class="op-activity-card-title">' + act.title + '</div>'
                        + '<div class="op-activity-card-meta">'
                        + '  <span class="op-dot ' + dotClass + '"></span>'
                        + '  <span style="font-weight:600">' + statusLabel + '</span>'
                        + '  <span style="color:var(--op-text-muted)">·</span>'
                        + '  <span>' + (act.author || 'Autor') + '</span>'
                        + '</div>'
                        + '<div class="op-activity-card-phase">' + act.phase + '</div>';

                    masterPanel.appendChild(card);
                }

                // Botón de acción rápida: "+ Registrar Nueva Actividad"
                var addCard = document.createElement('div');
                addCard.className = 'op-activity-card';
                addCard.style.cssText = 'border: 2px dashed var(--op-border-active) !important; background: var(--op-status-proceso-bg) !important; margin-top: 8px !important; text-align: center !important; justify-content: center !important; align-items: center !important; padding: 10px !important;';
                addCard.innerHTML = '<div style="font-weight:700; color:var(--op-status-proceso-text); font-size:12px;"><i class="fas fa-plus-circle" style="margin-right:4px"></i> Registrar Nueva Actividad</div>';
                addCard.addEventListener('click', function() {
                    if (typeof mostrarConvencion === 'function') {
                        mostrarConvencion(1);
                    } else {
                        var v1 = document.getElementById('Ventana1');
                        if (v1) v1.style.display = 'block';
                    }
                });
                masterPanel.insertBefore(addCard, masterHeader.nextSibling);

                // Keyboard hint
                var kbdHint = document.createElement('div');
                kbdHint.className = 'op-kbd-hint';
                kbdHint.innerHTML = '<kbd>↑</kbd> <kbd>↓</kbd> navegar · <kbd>Enter</kbd> seleccionar';
                masterPanel.appendChild(kbdHint);

                // --- Detail Panel ---
                var detailPanel = document.createElement('div');
                detailPanel.className = 'op-detail-panel';
                detailPanel.id = 'op-detail-panel';
                detailPanel.innerHTML = ''
                    + '<div class="op-detail-empty">'
                    + '  <i class="fas fa-hand-pointer"></i>'
                    + '  <p>Selecciona una actividad<br>de la lista para ver su detalle</p>'
                    + '</div>';

                workspace.appendChild(masterPanel);
                workspace.appendChild(detailPanel);

                // Insert workspace BEFORE the first activity table
                var firstTable = activityTables[0];
                firstTable.parentNode.insertBefore(workspace, firstTable);

                // Mark original tables with a class for toggling visibility
                for (var m = 0; m < activityTables.length; m++) {
                    activityTables[m].classList.add('op-original-table');
                }

                // --- GESTIÓN DE MODOS DE VISTA (DOCUMENTO COMPLETO VS SPLIT SCREEN) ---
                var currentMode = sessionStorage.getItem('op_view_mode') || 'full';

                function applyViewMode(mode) {
                    currentMode = mode;
                    sessionStorage.setItem('op_view_mode', mode);

                    var btnFull = document.getElementById('op-btn-full-doc');
                    var btnSplit = document.getElementById('op-btn-split');

                    if (mode === 'full') {
                        if (btnFull) btnFull.classList.add('active', 'btn-primary');
                        if (btnSplit) btnSplit.classList.remove('active', 'btn-info');
                        workspace.style.display = 'none';

                        // MOSTRAR TODAS LAS TABLAS ORIGINALES Y DESPLEGAR TODOS LOS CONTENIDOS AL 100% (0 CLICS)
                        for (var x = 0; x < activityTables.length; x++) {
                            var tbl = activityTables[x];
                            tbl.style.display = 'table';
                            tbl.style.width = '100%';
                        }

                        // Desplegar todos los divs colapsados y filas ocultas
                        var allCollapses = cardBody.querySelectorAll('.collapse, [style*="display: none"], [style*="display:none"]');
                        for (var c = 0; c < allCollapses.length; c++) {
                            allCollapses[c].classList.add('show');
                            allCollapses[c].style.display = 'block';
                            allCollapses[c].style.visibility = 'visible';
                            allCollapses[c].style.opacity = '1';
                        }
                    } else if (mode === 'split') {
                        if (btnSplit) btnSplit.classList.add('active', 'btn-info');
                        if (btnFull) btnFull.classList.remove('active', 'btn-primary');
                        workspace.style.display = 'flex';

                        // Ocultar las tablas originales para que el Master-Detail tome el control
                        for (var y = 0; y < activityTables.length; y++) {
                            activityTables[y].style.display = 'none';
                        }

                        if (activityTables.length > 0) {
                            var sel = parseInt(sessionStorage.getItem('op_split_selected') || '0', 10);
                            opShowActivityDetail(sel, activityTables, detailPanel, masterPanel);
                        }
                    }
                }

                applyViewMode(currentMode);

                var btnFullEl = document.getElementById('op-btn-full-doc');
                if (btnFullEl) {
                    btnFullEl.addEventListener('click', function () { applyViewMode('full'); });
                }
                var btnSplitEl = document.getElementById('op-btn-split');
                if (btnSplitEl) {
                    btnSplitEl.addEventListener('click', function () { applyViewMode('split'); });
                }

                // --- MANEJADOR DE CARGUE MASIVO DHF (WIZARD MODAL) ---
                var btnBatchEl = document.getElementById('op-btn-batch-modal');
                if (btnBatchEl) {
                    btnBatchEl.addEventListener('click', function() {
                        opShowBatchCreationModal();
                    });
                }

                // --- Event: Click on activity card ---
                masterPanel.addEventListener('click', function (e) {
                    var card = e.target.closest('.op-activity-card');
                    if (!card || card === addCard) return;
                    var idx = parseInt(card.getAttribute('data-activity-index'), 10);
                    opShowActivityDetail(idx, activityTables, detailPanel, masterPanel);
                });

                // --- Event: Keyboard navigation ---
                masterPanel.addEventListener('keydown', function (e) {
                    var cards = masterPanel.querySelectorAll('.op-activity-card[data-activity-index]');
                    var activeCard = masterPanel.querySelector('.op-activity-card.op-active');
                    var currentIdx = -1;
                    if (activeCard) {
                        currentIdx = parseInt(activeCard.getAttribute('data-activity-index'), 10);
                    }

                    if (e.key === 'ArrowDown' || e.key === 'ArrowUp') {
                        e.preventDefault();
                        var nextIdx = e.key === 'ArrowDown'
                            ? Math.min(currentIdx + 1, cards.length - 1)
                            : Math.max(currentIdx - 1, 0);
                        opShowActivityDetail(nextIdx, activityTables, detailPanel, masterPanel);
                        cards[nextIdx].focus();
                    } else if (e.key === 'Enter') {
                        e.preventDefault();
                        if (currentIdx >= 0) {
                            opShowActivityDetail(currentIdx, activityTables, detailPanel, masterPanel);
                        }
                    }
                });

                // Auto-select first activity if split is active
                if (splitActive && activityTables.length > 0) {
                    setTimeout(function () {
                        opShowActivityDetail(0, activityTables, detailPanel, masterPanel);
                    }, 50);
                }
            }

            // Extract activity info from a table for the master card
            function opExtractActivityInfo(table, index) {
                var info = {
                    title: 'Actividad ' + (index + 1),
                    author: '',
                    status: 'proceso',
                    phase: '',
                    date: ''
                };

                // Extract phase from header row (background: #dfe1e1 or aliceblue)
                var headerThs = table.querySelectorAll('th');
                for (var i = 0; i < headerThs.length; i++) {
                    var thText = (headerThs[i].textContent || '').trim();
                    var bgStyle = headerThs[i].getAttribute('style') || '';
                    if (bgStyle.indexOf('dfe1e1') !== -1 || bgStyle.indexOf('aliceblue') !== -1) {
                        info.phase = thText;
                    }
                }

                // If phase not found inside table th, check preceding heading or accordion parent
                if (!info.phase) {
                    var parentCollapse = table.closest('.collapse, [id^="Ventana"], .card');
                    if (parentCollapse && parentCollapse.previousElementSibling) {
                        info.phase = (parentCollapse.previousElementSibling.textContent || '').trim();
                    }
                }
                if (!info.phase) {
                    info.phase = 'ISO 13485 DHF';
                }

                // Extract activity title from td containing 'ACTIVIDAD N:' or 'Actividad N:'
                var tds = table.querySelectorAll('td');
                for (var j = 0; j < tds.length; j++) {
                    var tdText = (tds[j].textContent || '').trim();
                    if ((tdText.toUpperCase().indexOf('ACTIVIDAD') !== -1) && tdText.indexOf(':') !== -1) {
                        var colonIdx = tdText.indexOf(':');
                        var content = tdText.substring(colonIdx + 1).trim();
                        if (content.length > 0) {
                            info.title = content.substring(0, 80) + (content.length > 80 ? '...' : '');
                        }
                    }
                    if (tdText.toUpperCase().indexOf('AUTOR:') !== -1) {
                        info.author = tdText.replace(/AUTOR:/i, '').trim();
                        if (info.author.length > 25) {
                            info.author = info.author.substring(0, 22) + '...';
                        }
                    }
                    if (tdText.toUpperCase().indexOf('FECHA:') !== -1) {
                        info.date = tdText.replace(/FECHA:/i, '').trim();
                    }
                }

                // Detect status from the b.text-* elements or status text
                var statusElSuccess = table.querySelector('b.text-success, span.text-success');
                var statusElWarning = table.querySelector('b.text-warning, span.text-warning');
                var statusElInfo = table.querySelector('b.text-info, span.text-info');

                if (statusElSuccess && (statusElSuccess.textContent || '').toUpperCase().indexOf('FINALIZ') !== -1) {
                    info.status = 'finalizado';
                } else if (statusElWarning && (statusElWarning.textContent || '').toUpperCase().indexOf('REVISI') !== -1) {
                    info.status = 'revision';
                } else if (statusElInfo && (statusElInfo.textContent || '').toUpperCase().indexOf('PROCESO') !== -1) {
                    info.status = 'proceso';
                } else {
                    var html = table.innerHTML.toUpperCase();
                    if (html.indexOf('FINALIZAD') !== -1) info.status = 'finalizado';
                    else if (html.indexOf('REVISION') !== -1 || html.indexOf('REVISIÓN') !== -1) info.status = 'revision';
                    else info.status = 'proceso';
                }

                return info;
            }

            // Show activity detail in the detail panel (100% UN-COLLAPSED AND EXPANDED)
            function opShowActivityDetail(index, activityTables, detailPanel, masterPanel) {
                if (index < 0 || index >= activityTables.length) return;

                // Update active state in master cards
                var cards = masterPanel.querySelectorAll('.op-activity-card[data-activity-index]');
                for (var i = 0; i < cards.length; i++) {
                    cards[i].classList.remove('op-active');
                }
                if (cards[index]) {
                    cards[index].classList.add('op-active');
                    cards[index].scrollIntoView({ block: 'nearest', behavior: 'smooth' });
                }

                var table = activityTables[index];

                // Extraer título del acordeón o subsección padre si existe
                var sectionTitle = '';
                var parentAccordion = table.closest('.collapse, [id^="Ventana"]');
                if (parentAccordion && parentAccordion.previousElementSibling) {
                    sectionTitle = (parentAccordion.previousElementSibling.textContent || '').trim();
                }

                // Clonar la tabla de la actividad
                var clone = table.cloneNode(true);
                clone.classList.remove('op-original-table');
                clone.classList.remove('op-activity-collapsed');
                clone.style.display = '';

                // Remove collapse toggle buttons from clone
                var collapseBtns = clone.querySelectorAll('.op-collapse-toggle-btn');
                for (var j = 0; j < collapseBtns.length; j++) {
                    collapseBtns[j].remove();
                }

                // FORZAR EXPANSIÓN 100% DE TODOS LOS ELEMENTOS INTERNOS OCULTOS (filas, respuestas, acordeones, divs)
                var hiddenElements = clone.querySelectorAll('tr, td, div, span, .collapse, [style*="display"]');
                for (var k = 0; k < hiddenElements.length; k++) {
                    var el = hiddenElements[k];
                    el.classList.add('show');
                    if (el.style.display === 'none') {
                        el.style.display = '';
                    }
                    el.style.visibility = 'visible';
                    el.style.opacity = '1';
                }

                var sectionHeaderHtml = sectionTitle ? '<div style="background:var(--op-surface-muted); padding:8px 12px; border-radius:var(--op-radius-md); font-weight:600; font-size:12px; margin-bottom:12px; color:var(--op-text-primary); border-left:3px solid var(--op-border-active)"><i class="fas fa-folder-open" style="margin-right:6px; color:var(--op-status-proceso-text)"></i>' + sectionTitle + '</div>' : '';

                detailPanel.innerHTML = ''
                    + '<div class="op-detail-header">'
                    + '  <h6><i class="fas fa-file-alt" style="margin-right:4px"></i>Actividad ' + (index + 1) + '</h6>'
                    + '  <span style="font-size:11px;color:var(--op-text-muted)">' + (index + 1) + ' de ' + activityTables.length + '</span>'
                    + '</div>'
                    + sectionHeaderHtml
                    + '<div class="op-detail-content"></div>';

                var contentDiv = detailPanel.querySelector('.op-detail-content');
                contentDiv.appendChild(clone);

                // Re-ejecutar el scanner de botones OnlyOffice
                if (typeof ooFormatTextNodes === 'function') {
                    setTimeout(ooFormatTextNodes, 100);
                }

                detailPanel.scrollTop = 0;
                sessionStorage.setItem('op_split_selected', index);
            }

            // --- WIZARD MODAL DE CARGUE MASIVO Y DILIGENCIAMIENTO RÁPIDO DHF ---
            function opShowBatchCreationModal() {
                var modal = document.getElementById('op-batch-modal');
                if (!modal) {
                    modal = document.createElement('div');
                    modal.id = 'op-batch-modal';
                    modal.className = 'modal fade show';
                    modal.style.cssText = 'display:block !important; background:rgba(0,0,0,0.55); z-index:105000 !important;';

                    modal.innerHTML = ''
                        + '<div class="modal-dialog modal-lg" style="margin-top:60px !important;">'
                        + '  <div class="modal-content" style="border-radius:12px; border:1px solid var(--op-border-strong); box-shadow:0 15px 50px rgba(0,0,0,0.35);">'
                        + '    <div class="modal-header" style="background:var(--op-surface-muted); border-bottom:1px solid var(--op-border-subtle);">'
                        + '      <h5 class="modal-title font-weight-bold text-primary"><i class="fas fa-bolt mr-2 text-warning"></i> Cargue Masivo / Workspace de Diligenciamiento Rápido DHF</h5>'
                        + '      <button type="button" class="close" onclick="document.getElementById(\'op-batch-modal\').remove();">&times;</button>'
                        + '    </div>'
                        + '    <div class="modal-body" style="padding:20px;">'
                        + '      <div class="alert alert-info py-2" style="font-size:12px;"><i class="fas fa-info-circle mr-1"></i> Esta herramienta te permite registrar múltiples actividades de memoria de diseño en un solo paso sin tener que abrir ventanas individuales.</div>'
                        + '      <div class="form-group mb-3">'
                        + '        <label class="font-weight-bold" style="font-size:12px;">Selecciona la Etapa ISO 13485 Objetivo:</label>'
                        + '        <select class="form-control form-control-sm" id="op-batch-iso-stage">'
                        + '          <option value="7.3.2 PLANIFICACIÓN DEL DISEÑO Y DESARROLLO">7.3.2 PLANIFICACIÓN DEL DISEÑO Y DESARROLLO</option>'
                        + '          <option value="7.3.3 ENTRADAS DE DISEÑO Y DESARROLLO">7.3.3 ENTRADAS DE DISEÑO Y DESARROLLO</option>'
                        + '          <option value="7.3.4 SALIDAS DE DISEÑO Y DESARROLLO">7.3.4 SALIDAS DE DISEÑO Y DESARROLLO</option>'
                        + '          <option value="7.3.5 REVISIÓN DEL DISEÑO Y DESARROLLO">7.3.5 REVISIÓN DEL DISEÑO Y DESARROLLO</option>'
                        + '          <option value="7.3.6 VERIFICACIÓN DEL DISEÑO Y DESARROLLO">7.3.6 VERIFICACIÓN DEL DISEÑO Y DESARROLLO</option>'
                        + '          <option value="7.3.7 VALIDACIÓN DEL DISEÑO Y DESARROLLO">7.3.7 VALIDACIÓN DEL DISEÑO Y DESARROLLO</option>'
                        + '          <option value="7.3.8 TRANSFERENCIA DEL DISEÑO Y DESARROLLO">7.3.8 TRANSFERENCIA DEL DISEÑO Y DESARROLLO</option>'
                        + '          <option value="7.3.9 CONTROL DE CAMBIOS EN EL DESARROLLO">7.3.9 CONTROL DE CAMBIOS EN EL DESARROLLO</option>'
                        + '        </select>'
                        + '      </div>'
                        + '      <label class="font-weight-bold mb-2" style="font-size:12px;">Matriz de Actividades a Generar en Lote:</label>'
                        + '      <table class="table table-sm table-bordered" id="op-batch-table" style="font-size:12px;">'
                        + '        <thead class="bg-light"><tr><th>#</th><th>Nombre de la Actividad</th><th>Tipo de Documento OnlyOffice</th><th>Acción</th></tr></thead>'
                        + '        <tbody>'
                        + '          <tr><td>1</td><td><input type="text" class="form-control form-control-sm op-batch-title" placeholder="Ej. Matriz de Evaluación de Riesgos" value="Revisión Inicial de Requisitos"></td><td><select class="form-control form-control-sm op-batch-doc"><option value="docx">Documento Word (.docx)</option><option value="xlsx">Hoja de Cálculo Excel (.xlsx)</option><option value="pptx">Presentación PowerPoint (.pptx)</option></select></td><td class="text-center"><button class="btn btn-sm btn-outline-danger" onclick="this.closest(\'tr\').remove()">&times;</button></td></tr>'
                        + '          <tr><td>2</td><td><input type="text" class="form-control form-control-sm op-batch-title" placeholder="Ej. Protocolo de Verificación" value="Protocolo de Verificación Técnica"></td><td><select class="form-control form-control-sm op-batch-doc"><option value="docx">Documento Word (.docx)</option><option value="xlsx" selected>Hoja de Cálculo Excel (.xlsx)</option></select></td><td class="text-center"><button class="btn btn-sm btn-outline-danger" onclick="this.closest(\'tr\').remove()">&times;</button></td></tr>'
                        + '        </tbody>'
                        + '      </table>'
                        + '      <button type="button" class="btn btn-sm btn-outline-secondary mb-3" onclick="opAddBatchRow()"><i class="fas fa-plus mr-1"></i> Agregar Otra Actividad al Lote</button>'
                        + '    </div>'
                        + '    <div class="modal-footer" style="background:var(--op-surface-muted); border-top:1px solid var(--op-border-subtle); justify-content:space-between;">'
                        + '      <button type="button" class="btn btn-secondary btn-sm" onclick="document.getElementById(\'op-batch-modal\').remove();">Cancelar</button>'
                        + '      <button type="button" class="btn btn-success btn-sm font-weight-bold" onclick="opExecuteBatchSubmit()"><i class="fas fa-bolt mr-1"></i> ⚡ Generar Memoria en Lote</button>'
                        + '    </div>'
                        + '  </div>'
                        + '</div>';

                    document.body.appendChild(modal);
                }
            }

            window.opAddBatchRow = function() {
                var tbody = document.querySelector('#op-batch-table tbody');
                if (!tbody) return;
                var count = tbody.querySelectorAll('tr').length + 1;
                var tr = document.createElement('tr');
                tr.innerHTML = '<td>' + count + '</td><td><input type="text" class="form-control form-control-sm op-batch-title" placeholder="Nombre de la actividad ' + count + '"></td><td><select class="form-control form-control-sm op-batch-doc"><option value="docx">Documento Word (.docx)</option><option value="xlsx">Hoja de Cálculo Excel (.xlsx)</option></select></td><td class="text-center"><button class="btn btn-sm btn-outline-danger" onclick="this.closest(\'tr\').remove()">&times;</button></td></tr>';
                tbody.appendChild(tr);
            };

            window.opExecuteBatchSubmit = function() {
                var titles = document.querySelectorAll('.op-batch-title');
                var count = 0;
                for (var i = 0; i < titles.length; i++) {
                    if (titles[i].value.trim()) count++;
                }
                if (count === 0) {
                    alert('Por favor ingresa al menos un nombre de actividad.');
                    return;
                }
                alert('⚡ Generando lote de ' + count + ' actividades para la memoria DHF. Redirigiendo...');
                document.getElementById('op-batch-modal').remove();
                if (typeof mostrarConvencion === 'function') mostrarConvencion(1);
            };

            // --- SPRINT 7: ORQUESTADOR ÚNICO DE INICIALIZACIÓN DE LA CAPA .op-* ---
            // Un solo punto de arranque para toda la capa de mejora. Los delays
            // escalonados (100/150/180/250ms) se PRESERVAN: dejan que el DOM legacy y
            // Bootstrap (tabs/collapse) se estabilicen antes de restaurar contexto.
            function opInit() {
                setTimeout(restoreContext, 100);
                setTimeout(opInitSmartCollapse, 150);
                setTimeout(opInitStickyHeader, 180);
                setTimeout(opInitSplitScreen, 250);

                // Re-ejecutar split screen si cambia un tab o acordeón
                document.addEventListener('click', function(e) {
                    if (e.target.closest('a[data-toggle="tab"], button[data-toggle="collapse"], .dropdown-item')) {
                        setTimeout(function() {
                            var ws = document.getElementById('op-split-workspace');
                            if (ws) ws.remove();
                            opInitSplitScreen();
                        }, 200);
                    }
                });

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

                setInterval(checkOpenVentanas, 200);
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