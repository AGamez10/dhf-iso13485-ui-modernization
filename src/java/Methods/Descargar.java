package Methods;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Descargar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String ruta = request.getParameter("ruta_proyecto") != null ? request.getParameter("ruta_proyecto").toString() : "";
            String nombre_archivo = request.getParameter("file_name") != null ? request.getParameter("file_name").toString() : "";
            
            if (nombre_archivo == null || nombre_archivo.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Nombre de archivo no especificado.");
                return;
            }
            
            // Sanitizar nombre de archivo para evitar path traversal
            String cleanFileName = new File(nombre_archivo).getName();
            
            // Sanitizar ruta removiendo caracteres inválidos en sistemas de archivos Windows (*, ?, ", <, >, |, /, \)
            String cleanRuta = ruta != null ? ruta.replaceAll("[*?\"<>|/\\\\]", "").trim() : "";
            
            // Generar variantes candidatas para la carpeta del proyecto
            java.util.List<String> folderCandidates = new java.util.ArrayList<String>();
            if (!cleanRuta.isEmpty()) {
                folderCandidates.add(cleanRuta);
                // Si viene como "_20090601" (caso proyecto 1 con dummy /*/*/*/*/*/*)
                if (cleanRuta.startsWith("_")) {
                    folderCandidates.add("0001" + cleanRuta);
                }
            }
            if (ruta != null && !ruta.equals(cleanRuta) && !ruta.contains("*") && !ruta.contains("/")) {
                folderCandidates.add(ruta);
            }
            
            // Extraer posible sufijo de fecha (ej: 20090601 de /*/*/*/*/*/*_20090601)
            String dateSuffix = "";
            if (ruta != null && ruta.contains("_")) {
                String afterUnderscore = ruta.substring(ruta.lastIndexOf('_') + 1).trim();
                if (afterUnderscore.matches("\\d{8}")) {
                    dateSuffix = afterUnderscore;
                    if (!folderCandidates.contains("0001_" + dateSuffix)) {
                        folderCandidates.add("0001_" + dateSuffix);
                    }
                }
            }
            
            // Raíces base donde se almacenan los adjuntos en producción (\\172.16.2.117\h) y en red/localhost
            String[] baseRoots = new String[]{
                // Destino canónico en producción (recurso compartido \\172.16.2.117\h)
                "\\\\172.16.2.117\\h\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos",
                "\\\\172.16.2.117\\h\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos_proyectos",
                "\\\\172.16.2.117\\h\\Dis_Desarrollo\\Adjuntos",
                "\\\\172.16.2.117\\h\\Adjuntos",
                "\\\\172.16.2.117\\h",
                // Dominio Kerberos SSO de 172.16.2.117 (ptfsdev01)
                "\\\\ptfsdev01\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos",
                "\\\\ptfsdev01\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos_proyectos",
                "\\\\ptfsdev01\\h\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos",
                "\\\\ptfsdev01\\h",
                // Unidades mapeadas en localhost / servidor
                "H:\\Dis_Desarrollo\\Adjuntos",
                "H:\\Dis_Desarrollo\\Adjuntos_proyectos",
                "H:\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos",
                "H:\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos_proyectos",
                "H:\\Adjuntos",
                "H:\\"
            };
            
            File f = null;
            
            // PASO 1: Búsqueda directa por combinación de carpetas candidatas
            for (String base : baseRoots) {
                File baseDir = new File(base);
                if (!baseDir.exists()) {
                    continue;
                }
                for (String folder : folderCandidates) {
                    if (folder == null || folder.isEmpty()) continue;
                    File candidate = new File(baseDir, folder + File.separator + cleanFileName);
                    if (candidate.exists() && candidate.isFile()) {
                        f = candidate;
                        break;
                    }
                }
                if (f != null) break;
                
                // Archivo directo en la raíz de la base
                File directFile = new File(baseDir, cleanFileName);
                if (directFile.exists() && directFile.isFile()) {
                    f = directFile;
                    break;
                }
            }
            
            // PASO 2: Búsqueda de respaldo en subdirectorios de proyectos
            if (f == null) {
                for (String base : baseRoots) {
                    File baseDir = new File(base);
                    if (!baseDir.exists() || !baseDir.isDirectory()) {
                        continue;
                    }
                    File[] subDirs = baseDir.listFiles();
                    if (subDirs == null) continue;
                    
                    for (File sub : subDirs) {
                        if (!sub.isDirectory()) continue;
                        
                        File testFile = new File(sub, cleanFileName);
                        if (testFile.exists() && testFile.isFile()) {
                            f = testFile;
                            break;
                        }
                        
                        // Revisar 1 nivel interno (subcarpetas por etapa como 7.3.2)
                        File[] subSubDirs = sub.listFiles();
                        if (subSubDirs != null) {
                            for (File sub2 : subSubDirs) {
                                if (!sub2.isDirectory()) continue;
                                File testFile2 = new File(sub2, cleanFileName);
                                if (testFile2.exists() && testFile2.isFile()) {
                                    f = testFile2;
                                    break;
                                }
                            }
                        }
                        if (f != null) break;
                    }
                    if (f != null) break;
                }
            }
            
            if (f == null || !f.exists()) {
                response.setContentType("text/html;charset=UTF-8");
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().println("<div style='font-family:Segoe UI,Roboto,Arial,sans-serif;padding:40px;max-width:650px;margin:40px auto;border:1px solid #e2e8f0;border-radius:12px;background:#ffffff;box-shadow:0 4px 16px rgba(0,0,0,0.06);text-align:center;'>");
                response.getWriter().println("<h3 style='color:#dc2626;margin-top:0;'><i class='fas fa-exclamation-triangle'></i> Archivo Histórico no Encontrado</h3>");
                response.getWriter().println("<p style='font-size:14px;color:#1e293b;'>El archivo <b>" + cleanFileName + "</b> no fue localizado en el almacenamiento compartido.</p>");
                response.getWriter().println("<div style='background:#f8fafc;border:1px solid #cbd5e1;border-radius:8px;padding:12px;text-align:left;font-size:12px;color:#475569;margin:20px 0;'>");
                response.getWriter().println("<b>Ruta principal esperada en producción:</b><br /><code>\\\\172.16.2.117\\h\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos\\" + (!cleanRuta.isEmpty() ? cleanRuta : ruta) + "\\" + cleanFileName + "</code><br /><br />");
                response.getWriter().println("<b>Nota de conexión en localhost:</b> Si su equipo local no tiene autenticación SMB activa a <code>\\\\172.16.2.117\\h</code> o a la unidad <code>H:\\</code>, verifique sus credenciales de red corporativas.");
                response.getWriter().println("</div>");
                response.getWriter().println("</div>");
                return;
            }
            
            String ext = cleanFileName.lastIndexOf('.') > 0 ? cleanFileName.substring(cleanFileName.lastIndexOf('.') + 1).toLowerCase() : "";
            if ("pdf".equals(ext)) response.setContentType("application/pdf");
            else if ("xlsx".equals(ext) || "xls".equals(ext)) response.setContentType("application/vnd.ms-excel");
            else if ("docx".equals(ext) || "doc".equals(ext)) response.setContentType("application/msword");
            else if ("pptx".equals(ext) || "ppt".equals(ext)) response.setContentType("application/vnd.ms-powerpoint");
            else if ("png".equals(ext)) response.setContentType("image/png");
            else if ("jpg".equals(ext) || "jpeg".equals(ext)) response.setContentType("image/jpeg");
            else response.setContentType("application/octet-stream");
            
            response.setContentLengthLong(f.length());
            response.setHeader("Content-Disposition", "attachment; filename=\"" + cleanFileName + "\"");
            
            InputStream in = new FileInputStream(f);
            ServletOutputStream outs = response.getOutputStream();
            byte[] buffer = new byte[8192];
            int bytesRead;
            try {
                while ((bytesRead = in.read(buffer)) != -1) {
                    outs.write(buffer, 0, bytesRead);
                }
                outs.flush();
            } finally {
                try { outs.close(); } catch (Exception e) {}
                try { in.close(); } catch (Exception e) {}
            }
        } finally {
            //out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
