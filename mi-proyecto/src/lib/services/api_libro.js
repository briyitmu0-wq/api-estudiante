// Dirección base de la API de libros
const URL_BASE = '/api/libros/';

// Función auxiliar: revisa la respuesta y la convierte a objeto JavaScript
async function procesarRespuesta(respuesta) {
  if (!respuesta.ok) {
    throw new Error('Error ' + respuesta.status + ': ' + respuesta.statusText);
  }
  return await respuesta.json();
}

// GET /api/libros/  -> lista de todos los libros
export async function obtenerLibros() {
  const respuesta = await fetch(URL_BASE);
  return await procesarRespuesta(respuesta);
}

// GET /api/libros/{id}  -> un libro
export async function obtenerLibroPorId(id) {
  const respuesta = await fetch(URL_BASE + id);
  return await procesarRespuesta(respuesta);
}

// POST /api/libros/  -> crea un libro
export async function crearLibro(libro) {
  const respuesta = await fetch(URL_BASE, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(libro)
  });
  return await procesarRespuesta(respuesta);
}

// PUT /api/libros/{id}  -> actualiza un libro
export async function actualizarLibro(id, libro) {
  const respuesta = await fetch(URL_BASE + id, {
    method: 'PUT',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(libro)
  });
  return await procesarRespuesta(respuesta);
}

// DELETE /api/libros/{id}  -> elimina un libro
export async function eliminarLibro(id) {
  const respuesta = await fetch(URL_BASE + id, {
    method: 'DELETE'
  });
  return await procesarRespuesta(respuesta);
}