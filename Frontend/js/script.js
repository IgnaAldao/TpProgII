function filtrar(genero) {
    // Obtener todos los elementos con clase "item"
    let items = document.querySelectorAll('.item');
    
    // Mostrar u ocultar elementos según el género seleccionado
    items.forEach(item => {
        if (genero === 'todas' || item.classList.contains(genero)) {
            item.style.display = 'block'; // Mostrar el elemento
        } else {
            item.style.display = 'none'; // Ocultar el elemento
        }
    });
}

//Genera token para autenticacion
document.getElementById('loginButton').addEventListener('click', async function () {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    const response = await fetch('https://localhost:7167/auth/login', { 
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email, password })
    });

    if (response.ok) {
        const data = await response.json();
        localStorage.setItem('token', data.token);
        localStorage.setItem('clienteId', data.clienteId);
        localStorage.setItem('rol', data.rol);
        document.getElementById('loginMessage').innerText = 'Inicio de sesión exitoso. Redirigiendo...';
        // Mostrar el contenido principal y ocultar el formulario de inicio de sesión
        document.getElementById('mainContent').style.display = 'block';
        document.getElementById('navbar').style.display = 'block';
        document.getElementById('loginForm').style.display = 'none';
        document.getElementById('nav-inicio').style.display = 'none';
        llenarPeliculas()
    } else {
        const error = await response.json();
        document.getElementById('loginMessage').innerText = error.message || 'Error en el inicio de sesión.';
    }
});

document.addEventListener('DOMContentLoaded', function () {
    // Comprobar si existe un token almacenado
    const token = localStorage.getItem('token');
    
    if (token) {
        // Si hay un token, mostrar el contenido principal y ocultar el formulario de inicio de sesión
        document.getElementById('mainContent').style.display = 'block';
        document.getElementById('navbar').style.display = 'block';
        document.getElementById('loginForm').style.display = 'none';
        document.getElementById('nav-inicio').style.display = 'none';
        //llenarPeliculas();
    } else {
        // Si no hay token, mostrar el formulario de inicio de sesión
        document.getElementById('loginForm').style.display = 'flex';
    }
});

// Función para cerrar sesión
function logout() {
    // Eliminar el token del localStorage
    localStorage.removeItem("token");
    localStorage.removeItem("clienteId");
    localStorage.removeItem("rol");

    // Ocultar el contenido principal y mostrar el formulario de inicio de sesión
    document.getElementById("mainContent").style.display = "none";
    document.getElementById("loginForm").style.display = "block";

    location.reload(); // Para recargar la página y mostrar el formulario
}

// Agregar el evento al botón de cerrar sesión
document.getElementById("logoutButton").addEventListener("click", logout);

/* async function llenarPeliculas() {
    try {
        const response = await fetch('https://localhost:7167/api/pelicula');
        if (!response.ok) throw new Error("Error al obtener las películas");

        const peliculas = await response.json();
        const dropdownMenu = document.getElementById("dropdown-peliculas");

        // Limpiar el menú de películas
        dropdownMenu.innerHTML = '';

        // Añadir cada película como un elemento del dropdown
        peliculas.forEach(pelicula => {
            const item = document.createElement("li");
            item.innerHTML = `<a class="dropdown-item" href="#">${pelicula.titulo}</a>`;
            dropdownMenu.appendChild(item);
        });
    } catch (error) {
        console.error("Error al cargar películas:", error);
    }
}
    */



