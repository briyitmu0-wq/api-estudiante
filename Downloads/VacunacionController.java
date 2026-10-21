package com.sistema_de_vacunacion.Delta.Vacunacion;

import com.sistema_de_vacunacion.Delta.Vacunacion.VacunacionDTO.RegistrarVacunacionRequest;
import com.sistema_de_vacunacion.Delta.Vacunacion.VacunacionDTO.VacunacionResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Endpoints de vacunación, siguiendo el mismo estilo de rutas por rol que
 * ya se usa en el resto del backend (/api/personal-salud/..., /api/ciudadanos/...).
 * El control de rol (PERSONAL_SALUD / CIUDADANO / ADMINISTRADOR) se aplicará
 * con @PreAuthorize una vez esté montado SecurityConfig + JwtUtils; por ahora
 * queda indicado en el comentario de cada método.
 */
@RestController
@RequiredArgsConstructor
public class VacunacionController {

    private final VacunacionService vacunacionService;

    // POST /api/personal-salud/vacunaciones          -> rol PERSONAL_SALUD
    // Registrar aplicación de una vacuna (pantalla "Registrar vacunación")
    @PostMapping("/api/personal-salud/vacunaciones")
    public ResponseEntity<VacunacionResponse> registrarAplicacion(
            @Valid @RequestBody RegistrarVacunacionRequest request) {
        VacunacionResponse response = vacunacionService.registrarAplicacion(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    // GET /api/ciudadanos/{numeroDocumento}/vacunas-aplicadas -> rol CIUDADANO
    // Pantalla "Vacunas aplicadas" del carné del ciudadano
    @GetMapping("/api/ciudadanos/{numeroDocumento}/vacunas-aplicadas")
    public ResponseEntity<List<VacunacionResponse>> vacunasAplicadas(
            @PathVariable String numeroDocumento) {
        return ResponseEntity.ok(vacunacionService.obtenerVacunasAplicadas(numeroDocumento));
    }

    // GET /api/personal-salud/ciudadanos/{idCiudadano}/historial-clinico -> rol PERSONAL_SALUD
    // Pantalla "Historial clínico" (incluye quién aplicó cada dosis)
    @GetMapping("/api/personal-salud/ciudadanos/{idCiudadano}/historial-clinico")
    public ResponseEntity<List<VacunacionResponse>> historialClinico(
            @PathVariable Integer idCiudadano) {
        return ResponseEntity.ok(vacunacionService.obtenerHistorialClinico(idCiudadano));
    }

    // GET /api/personal-salud/{idPersonalSalud}/vacunaciones -> rol PERSONAL_SALUD | ADMINISTRADOR
    // Aplicaciones registradas por un miembro puntual del personal de salud
    @GetMapping("/api/personal-salud/{idPersonalSalud}/vacunaciones")
    public ResponseEntity<List<VacunacionResponse>> aplicacionesPorPersonalSalud(
            @PathVariable Integer idPersonalSalud) {
        return ResponseEntity.ok(vacunacionService.obtenerAplicacionesPorPersonalSalud(idPersonalSalud));
    }

    // GET /api/vacunaciones/{id} -> autenticado
    @GetMapping("/api/vacunaciones/{id}")
    public ResponseEntity<VacunacionResponse> obtenerPorId(@PathVariable Integer id) {
        return ResponseEntity.ok(vacunacionService.obtenerPorId(id));
    }
}
