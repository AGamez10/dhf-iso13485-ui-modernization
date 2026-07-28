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
                --op-border-subtle: #E9ECEF;
                --op-border-strong: #CED4DA;
                --op-border-active: #0284C7;

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
                background: #f1f5f9;
                color: #0369a1;
                border: 1px solid #cbd5e1;
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
                background: #e2e8f0;
                color: #0284c7;
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
                background: #ffffff !important;
                border-radius: 8px !important;
                border: 1px solid #e4e6fc !important;
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
                background: #ffffff !important;
                border-radius: 8px !important;
                border: 1px solid #e4e6fc !important;
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
                border: 1px solid #e4e6fc !important;
                transition: transform 0.15s ease, box-shadow 0.15s ease !important;
                margin-bottom: var(--space-20) !important;
                background: #ffffff !important;
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

        <!-- Integración Global del SDK Office Platform -->
        <% Object documentObj=session.getAttribute("Documento"); Object usuarioObj=session.getAttribute("Usuario"); if
            (documentObj !=null && usuarioObj !=null) { String cedulaStr=documentObj.toString(); String
            nombreStr=usuarioObj.toString(); String token=Methods.OfficePlatformResolver.resolveToken(cedulaStr,
            nombreStr); %>
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

                            // 2. Transición suave de Modales de Historia (TempM=3) y Adjuntos (TempM=7) a Columna 3 (Inspector Drawer)
                            document.addEventListener('click', function (e) {
                                var historyBtn = e.target.closest('a[href*="TempM=3"], a[href*="TempM=7"]');
                                if (!historyBtn) return;

                                var href = historyBtn.getAttribute('href');
                                if (!href || href === '#') return;

                                // Si existe un contenedor de Inspector (Columna 3)
                                var inspector = document.getElementById('op-inspector-drawer');
                                if (!inspector) {
                                    // Crear la Columna 3 si no existe en el DOM actual
                                    inspector = document.createElement('div');
                                    inspector.id = 'op-inspector-drawer';
                                    inspector.className = 'op-col-inspector active';

                                    var cardBody = document.querySelector('.card-body');
                                    if (cardBody) {
                                        cardBody.classList.add('op-workspace-3col');
                                        cardBody.appendChild(inspector);
                                    }
                                }

                                if (inspector) {
                                    e.preventDefault();
                                    inspector.className = 'op-col-inspector active';
                                    inspector.innerHTML = '<div class="text-center p-4"><i class="fas fa-spinner fa-spin fa-2x text-primary"></i><p class="mt-2 text-muted">Cargando inspección...</p></div>';

                                    fetch(href, { headers: { 'X-Requested-With': 'XMLHttpRequest' } })
                                        .then(function (resp) { return resp.text(); })
                                        .then(function (html) {
                                            var parser = new DOMParser();
                                            var doc = parser.parseFromString(html, 'text/html');
                                            var modal = doc.querySelector('.modal-body, #Formulario, .card');
                                            var content = modal ? modal.innerHTML : html;

                                            inspector.innerHTML = ''
                                                + '<div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">'
                                                + '  <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-search-plus mr-1"></i> Inspección de Evidencia</h6>'
                                                + '  <button type="button" class="close" onclick="document.getElementById(\'op-inspector-drawer\').classList.remove(\'active\')">&times;</button>'
                                                + '</div>'
                                                + '<div class="op-inspector-body">' + content + '</div>';

                                            // Ejecutar scanner para botones OnlyOffice dentro del Inspector
                                            ooFormatTextNodes();
                                        })
                                        .catch(function () {
                                            inspector.innerHTML = '<div class="alert alert-danger">Error al cargar inspección. Por favor intenta de nuevo.</div>';
                                        });
                                }
                            }, false);
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
            <% } %>
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

            // Restaurar cuando el DOM esté listo
            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', function () {
                    setTimeout(restoreContext, 100);
                    setTimeout(opInitSmartCollapse, 150);
                    setTimeout(opInitStickyHeader, 180);
                });
            } else {
                setTimeout(restoreContext, 100);
                setTimeout(opInitSmartCollapse, 150);
                setTimeout(opInitStickyHeader, 180);
            }
        })();
    </script>
    </body>

    </html>