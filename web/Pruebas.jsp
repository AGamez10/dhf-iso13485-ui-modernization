<%@taglib uri="/WEB-INF/Tlds/Alertas.tld" prefix="Alertas" %>
<%@taglib uri="/WEB-INF/Tlds/Menu.tld" prefix="Menu" %>
<%@taglib uri="/WEB-INF/Tlds/Pruebas.tld" prefix="Pruebas" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pruebas Memorias | A-D&D</title>
        <link rel="shortcut icon" href="Interfaz/Contenido/Img/favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/fontawesome/css/all.min.css">

        <!-- CSS Libraries -->
        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/jqvmap/dist/jqvmap.min.css">
        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/summernote/summernote-bs4.css">
        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/owlcarousel2/dist/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/owlcarousel2/dist/assets/owl.theme.default.min.css">

        <!-- Template CSS -->
        <link rel="stylesheet" href="Interfaz/Contenido/assets/css/style.css">
        <link rel="stylesheet" href="Interfaz/Contenido/assets/css/components.css">
        <!-- Start GA -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>

        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/datatables/datatables.min.css">
        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/datatables/Select-1.2.4/css/select.bootstrap4.min.css">
        <link rel="stylesheet" href="Interfaz/Contenido/assets/css/main.css">
        <link href="Interfaz/Contenido/assets/css/proyectos.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/select2/dist/css/select2.min.css" >
        <link rel="stylesheet" href="Interfaz/Contenido/assets/modules/bootstrap-daterangepicker/daterangepicker.css">

        <link href="Interfaz/Contenido/froala/CSS/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
        <link href="Interfaz/Contenido/froala/CSS/file.min.css" rel="stylesheet" type="text/css" />
        <link href="Interfaz/Contenido/froala/CSS/image.min.css" rel="stylesheet" type="text/css" />

    </head>
    <body>

        <jsp:include page="Contenedor_head.jsp"></jsp:include>
            <div id="app">
                <div class="main-wrapper main-wrapper-1">
                <Menu:Menu/>
                <div class="main-content" style="min-height: 694px;">
                    <Pruebas:Pruebas/>
                </div>
            </div>
        </div>

        <Alertas:Alertas/>     

        <!--        <script type = "text/javascript" >
                    history.pushState(null, null, 'Pruebas_Memorias.jsp');
                    window.addEventListener('popstate', function (event) {
                        history.pushState(null, null, 'Pruebas_Memorias.jsp');
                    });
                </script>-->

        <script type="text/javascript">
            function reinicializarTooltips() {
                if (typeof $ !== 'undefined' && typeof $.fn.tooltip !== 'undefined') {
                    $('[data-toggle="tooltip"]').tooltip();
                } else {
                    console.error("jQuery o Bootstrap no están cargados");
                }
            }

            $(document).ready(function () {
                var table = $('#table-1').DataTable();
                reinicializarTooltips();
                table.on('draw', function () {
                    reinicializarTooltips();
                });
            });


            function mostrarConvencion(id) {
                if (document.getElementById("Ventana" + id).style.display === "none") {
                    document.getElementById("Ventana" + id).style.display = "block";
                } else if (document.getElementById("Ventana" + id).style.display === "block") {
                    document.getElementById("Ventana" + id).style.display = "none";
                }
            }

            function ActivarPruebas(proyecto, estadoM, pruebas) {
                swal({
                    title: "Desbloquear asignacion de pruebas",
                    text: "Al desbloquear esta opción le permite asignar pruebas al proyecto...!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "orange",
                    confirmButtonText: "Aceptar",
                    cancelButtonText: "Cancelar",
                    closeOnConfirm: false,
                },
                        function () {
                            location.href = 'Proyecto?opc=21&ipy=' + proyecto + '&estadoM=' + estadoM + '&TempPRU=1&idPru=' + pruebas + '&estado=1';
                        });
            }

            function InactivarPruebas(proyecto, estadoM, pruebas) {
                swal({
                    title: "Bloquear asignacion de pruebas",
                    text: "Al bloquear la opción esta ya no le permitira asignar pruebas al proyecto...!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "orange",
                    confirmButtonText: "Aceptar",
                    cancelButtonText: "Cancelar",
                    closeOnConfirm: false,
                },
                        function () {
                            location.href = 'Proyecto?opc=21&ipy=' + proyecto + '&estadoM=' + estadoM + '&TempPRU=1&idPru=' + pruebas + '&estado=0';
                        });
            }


        </script>

        <script src="Interfaz/Contenido/assets/modules/jquery.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- Template JS File -->
        <script src="Interfaz/Contenido/assets/modules/popper.js"></script>
        <script src="Interfaz/Contenido/assets/modules/tooltip.js"></script>
        <!--<link rel="stylesheet" href="Interfaz/Contenido/assets/modules/bootstrap/css/bootstrap.min.css">-->
        <script src="Interfaz/Contenido/assets/modules/bootstrap/js/bootstrap.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/moment.min.js"></script>
        <script src="Interfaz/Contenido/assets/js/stisla.js"></script>

        <!-- JS Libraies -->
        <script src="Interfaz/Contenido/assets/modules/jquery.sparkline.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/chart.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/owlcarousel2/dist/owl.carousel.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/summernote/summernote-bs4.js"></script>
        <!-- Page Specific JS File -->
        <script src="Interfaz/Contenido/assets/js/page/index.js"></script>
        <!-- Template JS File -->
        <script src="Interfaz/Contenido/assets/js/scripts.js"></script>
        <script src="Interfaz/Contenido/assets/js/custom.js"></script>

        <script src="Interfaz/Contenido/assets/modules/datatables/datatables.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/datatables/Select-1.2.4/js/dataTables.select.min.js"></script>
        <script src="Interfaz/Contenido/assets/js/page/modules-datatables.js"></script>
        <script src="Interfaz/Contenido/assets/modules/izitoast/js/iziToast.min.js"></script>
        <script src="Interfaz/Contenido/assets/js/page/modules-toastr.js"></script>

        <script src="Interfaz/Contenido/assets/modules/select2/dist/js/select2.full.min.js"></script>
        <script src="Interfaz/Contenido/assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script type="text/javascript" src="Interfaz/Contenido/froala/JS/froala_editor.pkgd.min.js"></script>
        <script type="text/javascript" src="Interfaz/Contenido/froala/JS/file.min.js"></script>
        <script type="text/javascript" src="Interfaz/Contenido/froala/JS/image.min.js"></script>
        <script type="text/javascript" src="Interfaz/Contenido/froala/JS/languages-es.js"></script>

        <script type="text/javascript" src="Interfaz/Contenido/froala/JS/froala-file-manager.js"></script>
        <script type="text/javascript" src="Interfaz/Contenido/froala/JS/froala-image-editor.js"></script>

        <script>
            // ── Pruebas: inicializar editores OnlyOffice ──
            document.addEventListener('DOMContentLoaded', function () {
                if (document.getElementById('oo-block-P') && typeof ooInitEditor === 'function') {
                    ooInitEditor({ containerId: 'oo-block-P', inputId: 'textInput', autoLoad: true });
                }
                if (document.getElementById('oo-block-PM') && typeof ooInitEditor === 'function') {
                    ooInitEditor({ containerId: 'oo-block-PM', inputId: 'textInputM', autoLoad: true });
                }
            });
        </script>



        <script>
            function uploadFiles() {
                // Obtener la última fecha de subida del storage
                let lastUploadTime = localStorage.getItem('lastUploadTime') || new Date().toISOString();

                // Guardar el valor actual de lastUploadTime como valor anterior
                localStorage.setItem('previousUploadTime', lastUploadTime);

                // Guardar la fecha y hora actual como nueva última subida
                lastUploadTime = new Date().toISOString();
                localStorage.setItem('lastUploadTime', lastUploadTime);

                // Obtener archivos en el intervalo de tiempo
                let filesToUpload = []; // Aquí puedes agregar lógica para llenar este array con los archivos que desees subir

                var xhr = new XMLHttpRequest();
                var flmngrBase = window.location.protocol + '//' + window.location.hostname;
                xhr.open("POST", flmngrBase + "/Archivo_DYD/flmngr/envio.php", true);
                xhr.onerror = function () { try { console.error('flmngr no disponible en ' + flmngrBase); } catch (e) { } };
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        alert("Archivos subidos correctamente.");
                    }
                };

                // Enviar los datos en formato JSON
                xhr.send(JSON.stringify({
                    files: filesToUpload,
                    lastUploadTime: lastUploadTime,
                    previousUploadTime: localStorage.getItem('previousUploadTime')
                }));
            }

            // Aquí puedes llamar a uploadFiles() cuando lo necesites, por ejemplo, en un botón
            // document.getElementById('uploadButton').addEventListener('click', uploadFiles);
        </script>


    </body>
</html>
