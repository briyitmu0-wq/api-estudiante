const URL_BASE = 'https://api-estudiante-1.onrender.com/api/estudiantes/';
async function procesarRespuesta(respuesta) {
  if (!respuesta.ok) {
    throw new Error('Error ' + respuesta.status + ': ' + respuesta.statusText);
  }
  return await respuesta.json();
}

export async function obtenerEstudiantes() {
  const respuesta = await fetch(URL_BASE);
  return await procesarRespuesta(respuesta);
}

export async function obtenerEstudiantePorId(id) {
  const respuesta = await fetch(URL_BASE + id);
  return await procesarRespuesta(respuesta);
}

export async function crearEstudiante(estudiante) {
  const respuesta = await fetch(URL_BASE, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(estudiante)
  });
  return await procesarRespuesta(respuesta);
}

export async function actualizarEstudiante(id, estudiante) {
  const respuesta = await fetch(URL_BASE + id, {
    method: 'PUT',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(estudiante)
  });
  return await procesarRespuesta(respuesta);
}

export async function eliminarEstudiante(id) {
  const respuesta = await fetch(URL_BASE + id, {
    method: 'DELETE'
  });
  return await procesarRespuesta(respuesta);
}