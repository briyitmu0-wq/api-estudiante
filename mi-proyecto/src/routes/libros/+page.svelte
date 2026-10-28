<script>
  import { onMount } from 'svelte';
  import Header from '#lib/components/Header.svelte';
  import Card from '#lib/components/Card.svelte';
  import {
    obtenerLibros,
    obtenerLibroPorId,
    crearLibro,
    actualizarLibro,
    eliminarLibro
  } from '#lib/services/api_libro.js';

  /** @type {any[]} */
  let libros = [];
  let titulo = '';
  let autor = '';
  let genero = '';
  let mensaje = '';
  let cargando = false;
  let idEditando = null;

  async function cargarLibros() {
    cargando = true;
    try {
      libros = await obtenerLibros();
    } catch (error) {
      mensaje = 'No se pudo cargar la lista: ' + error.message;
    }
    cargando = false;
  }

  onMount(cargarLibros);

  function limpiarFormulario() {
    titulo = '';
    autor = '';
    genero = '';
    idEditando = null;
  }

  async function guardarLibro(evento) {
    evento.preventDefault();

    const datos = {
      titulo: titulo,
      autor: autor,
      genero: genero
    };

    try {
      if (idEditando === null) {
        await crearLibro(datos);
        mensaje = 'Libro registrado correctamente';
      } else {
        await actualizarLibro(idEditando, datos);
        mensaje = 'Libro actualizado correctamente';
      }
      limpiarFormulario();
      await cargarLibros();
    } catch (error) {
      mensaje = 'No se pudo guardar: ' + error.message;
    }
  }

  async function prepararEdicion(id) {
    try {
      const libro = await obtenerLibroPorId(id);
      idEditando = libro.id;
      titulo = libro.titulo;
      autor = libro.autor;
      genero = libro.genero;
      mensaje = '';
    } catch (error) {
      mensaje = 'No se pudo cargar el libro: ' + error.message;
    }
  }

  async function borrarLibro(libro) {
    const seguro = confirm('¿Eliminar el libro ' + libro.titulo + '?');
    if (!seguro) {
      return;
    }

    try {
      const respuesta = await eliminarLibro(libro.id);
      mensaje = respuesta.mensaje;
      if (idEditando === libro.id) {
        limpiarFormulario();
      }
      await cargarLibros();
    } catch (error) {
      mensaje = 'No se pudo eliminar: ' + error.message;
    }
  }
</script>

<Header titulo="Módulo de Libros" subtitulo="Registrar, consultar, editar y eliminar" />

<Card>
  <h2>{idEditando === null ? 'Registrar libro' : 'Editar libro'}</h2>

  <form on:submit={guardarLibro}>
    <div class="campo">
      <label for="titulo">Título</label>
      <input id="titulo" type="text" placeholder="Cien años de soledad" bind:value={titulo} required />
    </div>

    <div class="campo">
      <label for="autor">Autor</label>
      <input id="autor" type="text" placeholder="Gabriel García Márquez" bind:value={autor} required />
    </div>

    <div class="campo">
      <label for="genero">Género</label>
      <input id="genero" type="text" placeholder="Realismo mágico" bind:value={genero} required />
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
  <h2>Lista de libros</h2>

  {#if cargando}
    <p>Cargando...</p>
  {:else if libros.length === 0}
    <p>No hay libros registrados.</p>
  {:else}
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Título</th>
          <th>Autor</th>
          <th>Género</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each libros as libro (libro.id)}
          <tr>
            <td>{libro.id}</td>
            <td>{libro.titulo}</td>
            <td>{libro.autor}</td>
            <td>{libro.genero}</td>
            <td>
              <div class="acciones">
                <button class="btn btn-editar" on:click={() => prepararEdicion(libro.id)}>Editar</button>
                <button class="btn btn-borrar" on:click={() => borrarLibro(libro)}>Eliminar</button>
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