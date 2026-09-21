package Filtros;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Filtro de control de acceso: exige sesion valida (atributo "Usuario") para las vistas
 * protegidas. Excluye el login, el proceso de sesion, los recursos estaticos y el motor de
 * descargas para NO interferir con flujos existentes. Solo se aplica al dispatcher REQUEST, por
 * lo que los jsp:include internos (p.ej. Contenedor_head.jsp) no se filtran por separado.
 *
 * @author DevSecOps
 */
public class SessionFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Sin configuracion adicional.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String ctx = req.getContextPath();
        String uri = req.getRequestURI();
        // Ruta relativa al context path para comparar de forma robusta (independiente del despliegue).
        String path = (ctx != null && !ctx.isEmpty() && uri.startsWith(ctx)) ? uri.substring(ctx.length()) : uri;
        String lower = path.toLowerCase();

        if (isExcluded(lower)) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("Usuario") == null) {
            resp.sendRedirect(ctx + "/index.jsp?alerta=sesion_invalida");
            return;
        }
        chain.doFilter(request, response);
    }

    // Rutas que NO requieren sesion: login, proceso de sesion, descargas y recursos estaticos.
    private boolean isExcluded(String path) {
        if (path.equals("/") || path.equals("/index.jsp") || path.equals("/salir.jsp")) {
            return true; // pagina de login o logout
        }
        if (path.startsWith("/sesion")) {
            return true; // proceso de login (servlet Sesion)
        }
        if (path.startsWith("/descargar")) {
            return true; // motor de descarga de adjuntos: no interferir
        }
        if (path.startsWith("/interfaz/") || path.contains("/assets/")) {
            return true; // recursos estaticos por carpeta
        }
        if (path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png")
                || path.endsWith(".jpg") || path.endsWith(".jpeg") || path.endsWith(".gif")
                || path.endsWith(".ico") || path.endsWith(".woff") || path.endsWith(".woff2")) {
            return true; // recursos estaticos por extension
        }
        return false;
    }

    @Override
    public void destroy() {
        // Sin recursos que liberar.
    }
}
