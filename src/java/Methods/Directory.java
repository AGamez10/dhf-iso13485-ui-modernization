package Methods;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.File;

public class Directory {

    // Raices candidatas de almacenamiento de adjuntos, en orden de preferencia (red -> Kerberos ->
    // unidad mapeada). NO altera el algoritmo de descarga de Descargar.java; esto solo resuelve la
    // carpeta base para CREAR el arbol del proyecto, con fallback seguro al entorno local de desarrollo.
    private static final String[] CANDIDATE_ROOTS = {
        "\\\\172.16.2.117\\h\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos_proyectos\\",
        "\\\\ptfsdev01\\Sistemas de informacion\\Dis_Desarrollo\\Adjuntos_proyectos\\",
        "H:\\Dis_Desarrollo\\Adjuntos_proyectos\\"
    };
    private static final String LOCAL_FALLBACK = "C:\\xampp\\htdocs\\Archivo_DYD\\flmngr\\files\\";

    // Resuelve la ruta base con cascada: (a) System property/env DYD_STORAGE_PATH ->
    // (b/c/d) primera raiz de red/Kerberos/mapeada que exista y sea alcanzable ->
    // (e) fallback local de desarrollo. Cualquier raiz inaccesible se salta sin fallar.
    private String resolveBasePath() {
        String override = System.getProperty("DYD_STORAGE_PATH");
        if (override == null || override.trim().isEmpty()) {
            override = System.getenv("DYD_STORAGE_PATH");
        }
        if (override != null && !override.trim().isEmpty()) {
            return override.trim();
        }
        for (int i = 0; i < CANDIDATE_ROOTS.length; i++) {
            String root = CANDIDATE_ROOTS[i];
            try {
                File f = new File(root);
                if (f.exists() && f.isDirectory()) {
                    return root;
                }
            } catch (Exception ignore) {
                // Raiz de red inaccesible (host caido, sin permisos, timeout): probar la siguiente.
            }
        }
        return LOCAL_FALLBACK;
    }

    public void crearCarpeta(String nombreCarpeta) {
        String basePath = resolveBasePath();
        try {
            Path path = Paths.get(basePath, nombreCarpeta);
            Files.createDirectories(path);
            System.out.println("Carpeta creada exitosamente: " + path.toString());
        } catch (Exception e) {
            // Blindaje: NO interrumpir la creacion del proyecto en Proyecto.java. Se loguea y continua.
            System.err.println("Error creando la carpeta de adjuntos (base=" + basePath + "): " + e.getMessage());
        }
    }

}
