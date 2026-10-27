<nav class="navbar">
  <span class="navbar-logo">Gestión Escolar</span>
  <div class="navbar-links">
    <a href="/">Inicio</a>
    <a href="/estudiantes">Estudiantes</a>
    <a href="/libros">Libros</a>
    <a href="/prestamos">Préstamos</a>
  </div>
</nav>

<style>
  .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #1e3a8a;
    color: white;
    padding: 14px 24px;
  }
  .navbar-logo {
    font-weight: bold;
    font-size: 1.2rem;
  }
  .navbar-links {
    display: flex;
    gap: 18px;
  }
  .navbar-links a {
    color: white;
    text-decoration: none;
  }
  .navbar-links a:hover {
    text-decoration: underline;
  }
</style>