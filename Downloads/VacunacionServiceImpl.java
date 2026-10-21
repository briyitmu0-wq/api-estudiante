package com.sistema_de_vacunacion.Delta.Vacunacion;

import com.sistema_de_vacunacion.Delta.Vacunacion.VacunacionDTO.RegistrarVacunacionRequest;
import com.sistema_de_vacunacion.Delta.Vacunacion.VacunacionDTO.VacunacionResponse;
import com.sistema_de_vacunacion.Delta.usuario.Ciudadano;
import com.sistema_de_vacunacion.Delta.usuario.CiudadanoRepository;
import com.sistema_de_vacunacion.Delta.usuario.PersonalSalud;
import com.sistema_de_vacunacion.Delta.usuario.PersonalSaludRepository;
import com.sistema_de_vacunacion.Delta.vacuna.InventarioLote;
import com.sistema_de_vacunacion.Delta.vacuna.InventarioLoteRepository;
import com.sistema_de_vacunacion.Delta.vacuna.Vacuna;
import com.sistema_de_vacunacion.Delta.vacuna.VacunaRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * OJO: este servicio asume que ya existen, con estos nombres, las clases
 * Ciudadano, CiudadanoRepository, PersonalSalud, PersonalSaludRepository
 * (paquete usuario) y Vacuna, VacunaRepository, InventarioLote,
 * InventarioLoteRepository (paquete vacuna). Si tus compañeros los llamaron
 * distinto, solo hay que ajustar estos imports.
 */
@Service
@RequiredArgsConstructor
public class VacunacionServiceImpl implements VacunacionService {

    private final VacunacionRepository vacunacionRepository;
    private final CiudadanoRepository ciudadanoRepository;
    private final PersonalSaludRepository personalSaludRepository;
    private final VacunaRepository vacunaRepository;
    private final InventarioLoteRepository inventarioLoteRepository;

    @Override
    @Transactional
    public VacunacionResponse registrarAplicacion(RegistrarVacunacionRequest request) {

        Ciudadano ciudadano = ciudadanoRepository.findByNumeroDocumento(request.numeroDocumentoCiudadano())
                .orElseThrow(() -> new EntityNotFoundException(
                        "No se encontró un ciudadano con documento " + request.numeroDocumentoCiudadano()));

        PersonalSalud personalSalud = personalSaludRepository.findById(request.idPersonalSalud())
                .orElseThrow(() -> new EntityNotFoundException("No se encontró el personal de salud indicado"));

        Vacuna vacuna = vacunaRepository.findById(request.idVacuna())
                .orElseThrow(() -> new EntityNotFoundException("No se encontró la vacuna indicada"));

        InventarioLote lote = inventarioLoteRepository
                .findByNumeroLoteAndVacuna_Id(request.numeroLote(), vacuna.getId())
                .orElseThrow(() -> new EntityNotFoundException(
                        "El lote " + request.numeroLote() + " no existe para esta vacuna"));

        descontarInventario(lote);

        Vacunacion vacunacion = Vacunacion.builder()
                .fechaAplicacion(request.fechaAplicacion())
                .dosis(request.dosis())
                .observaciones(request.observaciones())
                .reaccionAdversa(request.reaccionAdversa())
                .ciudadano(ciudadano)
                .personalSalud(personalSalud)
                .vacuna(vacuna)
                .build();

        Vacunacion guardada = vacunacionRepository.save(vacunacion);

        return toResponse(guardada, lote.getNumeroLote());
    }

    /** Descuenta una unidad del lote aplicado. Lanza error si no hay stock. */
    private void descontarInventario(InventarioLote lote) {
        int stockDisponible = lote.getStockActual();
        if (stockDisponible <= 0) {
            throw new IllegalStateException("No hay stock disponible en el lote " + lote.getNumeroLote());
        }
        lote.setStockActual(stockDisponible - 1);
        inventarioLoteRepository.save(lote);
    }

    @Override
    public List<VacunacionResponse> obtenerVacunasAplicadas(String numeroDocumentoCiudadano) {
        return vacunacionRepository
                .findByCiudadano_NumeroDocumentoOrderByFechaAplicacionDesc(numeroDocumentoCiudadano)
                .stream()
                .map(v -> toResponse(v, null))
                .toList();
    }

    @Override
    public List<VacunacionResponse> obtenerHistorialClinico(Integer idCiudadano) {
        return vacunacionRepository.findByCiudadano_IdOrderByFechaAplicacionDesc(idCiudadano)
                .stream()
                .map(v -> toResponse(v, null))
                .toList();
    }

    @Override
    public List<VacunacionResponse> obtenerAplicacionesPorPersonalSalud(Integer idPersonalSalud) {
        return vacunacionRepository.findByPersonalSalud_IdOrderByFechaAplicacionDesc(idPersonalSalud)
                .stream()
                .map(v -> toResponse(v, null))
                .toList();
    }

    @Override
    public VacunacionResponse obtenerPorId(Integer id) {
        Vacunacion vacunacion = vacunacionRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("No se encontró la vacunación con id " + id));
        return toResponse(vacunacion, null);
    }

    /**
     * numeroLote solo se conoce en el momento del registro (no se persiste
     * en la tabla vacunacion), por eso se pasa aparte y puede venir null en
     * las consultas de listado/historial.
     */
    private VacunacionResponse toResponse(Vacunacion v, String numeroLote) {
        return new VacunacionResponse(
                v.getId(),
                v.getFechaAplicacion(),
                v.getDosis(),
                numeroLote,
                v.getObservaciones(),
                v.isReaccionAdversa(),
                v.getVacuna().getId(),
                v.getVacuna().getNombre(),
                v.getVacuna().getCodigo(),
                v.getCiudadano().getId(),
                v.getCiudadano().getNumeroDocumento(),
                v.getCiudadano().getNombre() + " " + v.getCiudadano().getApellido(),
                v.getPersonalSalud().getId(),
                v.getPersonalSalud().getNombre() + " " + v.getPersonalSalud().getApellido()
        );
    }
}
