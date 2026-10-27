<script>
  import { onMount } from 'svelte';
  import Header from '#lib/components/Header.svelte';
  import Card from '#lib/components/Card.svelte';
  import {
    obtenerEstudiantes,
    obtenerEstudiantePorId,
    crearEstudiante,
    actualizarEstudiante,
    eliminarEstudiante
  } from '#lib/services/api_estudiante.js';

    /** @type {any[]} */
  let estudiantes = [];
  let nombre = '';
  let grado = '';
  let promedio = '';
  let mensaje = '';
  let cargando = false;
  let idEditando = null;

  async function cargarEstudiantes() {
    cargando = true;
    try {
      estudiantes = await obtenerEstudiantes();
    } catch (error) {
      mensaje = 'No se pudo cargar la lista: ' + error.message;
    }
    cargando = false;
  }

  onMount(cargarEstudiantes);

  function limpiarFormulario() {
    nombre = '';
    grado = '';
    promedio = '';
    idEditando = null;
  }

  async function guardarEstudiante(evento) {
    evento.preventDefault();

    const datos = {
      nombre: nombre,
      grado: grado,
      promedio: Number(promedio)
    };

    try {
      if (idEditando === null) {
        await crearEstudiante(datos);
        mensaje = 'Estudiante registrado correctamente';
      } else {
        await actualizarEstudiante(idEditando, datos);
        mensaje = 'Estudiante actualizado correctamente';
      }
      limpiarFormulario();
      await cargarEstudiantes();
    } catch (error) {
      mensaje = 'No se pudo guardar: ' + error.message;
    }
  }

  async function prepararEdicion(id) {
    try {
      const estudiante = await obtenerEstudiantePorId(id);
      idEditando = estudiante.id;
      nombre = estudiante.nombre;
      grado = estudiante.grado;
      promedio = estudiante.promedio;
      mensaje = '';
    } catch (error) {
      mensaje = 'No se pudo cargar el estudiante: ' + error.message;
    }
  }

  async function borrarEstudiante(estudiante) {
    const seguro = confirm('¿Eliminar a ' + estudiante.nombre + '?');
    if (!seguro) {
      return;
    }

    try {
      const respuesta = await eliminarEstudiante(estudiante.id);
      mensaje = respuesta.mensaje;
      if (idEditando === estudiante.id) {
        limpiarFormulario();
      }
      await cargarEstudiantes();
    } catch (error) {
      mensaje = 'No se pudo eliminar: ' + error.message;
    }
  }
</script>

<Header titulo="Módulo de Estudiantes" subtitulo="Registrar, consultar, editar y eliminar" />

<Card>
  <h2>{idEditando === null ? 'Registrar estudiante' : 'Editar estudiante'}</h2>

  <form on:submit={guardarEstudiante}>
    <div class="campo">
      <label for="nombre">Nombre</label>
      <input id="nombre" type="text" placeholder="Juan Pérez" bind:value={nombre} required />
    </div>

    <div class="campo">
      <label for="grado">Grado</label>
      <input id="grado" type="text" placeholder="10A" bind:value={grado} required />
    </div>

    <div class="campo">
      <label for="promedio">Promedio</label>
      <input id="promedio" type="number" step="0.1" min="0" max="5" placeholder="4.5" bind:value={promedio} required />
    </div>

    <div class="botones">
      <button type="submit" class="btn btn-primario">
        {idEditando === null ? 'Registrar' : 'Guardar cambios'}
      </button>

      {#if idEditando !== null}
        <button type="button" class="btn btn-gris" on:click={limpiarFormulario}>Cancelar</button>
      {/if}
    </div>
  </form>

  {#if mensaje}
    <p class="mensaje">{mensaje}</p>
  {/if}
</Card>

<Card>
  <h2>Lista de estudiantes</h2>

  {#if cargando}
    <p>Cargando...</p>
  {:else if estudiantes.length === 0}
    <p>No hay estudiantes registrados.</p>
  {:else}
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Nombre</th>
          <th>Grado</th>
          <th>Promedio</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each estudiantes as estudiante (estudiante.id)}
          <tr>
            <td>{estudiante.id}</td>
            <td>{estudiante.nombre}</td>
            <td>{estudiante.grado}</td>
            <td>{estudiante.promedio}</td>
            <td>
              <div class="acciones">
                <button class="btn btn-editar" on:click={() => prepararEdicion(estudiante.id)}>Editar</button>
                <button class="btn btn-borrar" on:click={() => borrarEstudiante(estudiante)}>Eliminar</button>
              </div>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  {/if}
</Card>

<style>
  h2 {
    margin-top: 0;
    color: #1e3a8a;
  }

  .campo {
    display: flex;
    flex-direction: column;
    margin-bottom: 14px;
  }

  label {
    font-weight: bold;
    margin-bottom: 6px;
  }

  input {
    padding: 10px;
    border: 1px solid #cbd5e1;
    border-radius: 6px;
    font-size: 1rem;
  }

  input:focus {
    outline: none;
    border-color: #1e3a8a;
  }

  .botones {
    display: flex;
    gap: 10px;
  }

  .btn {
    padding: 10px 16px;
    border: none;
    border-radius: 6px;
    color: white;
    font-size: 0.95rem;
    cursor: pointer;
  }

  .btn-primario {
    background-color: #1e3a8a;
  }

  .btn-primario:hover {
    background-color: #1d4ed8;
  }

  .btn-gris {
    background-color: #6b7280;
  }

  .btn-gris:hover {
    background-color: #4b5563;
  }

  .btn-editar {
    background-color: #f59e0b;
  }

  .btn-editar:hover {
    background-color: #d97706;
  }

  .btn-borrar {
    background-color: #dc2626;
  }

  .btn-borrar:hover {
    background-color: #b91c1c;
  }

  .mensaje {
    margin-top: 14px;
    padding: 10px;
    background-color: #dbeafe;
    border-radius: 6px;
    color: #1e3a8a;
  }

  table {
    width: 100%;
    border-collapse: collapse;
  }

  th,
  td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #e5e7eb;
  }

  th {
    background-color: #f3f4f6;
  }

  tr:hover td {
    background-color: #f9fafb;
  }

  .acciones {
    display: flex;
    gap: 8px;
  }
</style>
