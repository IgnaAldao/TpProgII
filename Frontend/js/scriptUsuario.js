async function loadClienteData() {
    const clienteId = localStorage.getItem('clienteId');
    const token = localStorage.getItem('token');

    if (clienteId && token) {
        const response = await fetch(`https://localhost:7167/api/cliente/${clienteId}`, {
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });

        if (response.ok) {
            const cliente = await response.json();
            document.getElementById('nombre').value = cliente.nombre;
            document.getElementById('apellido').value = cliente.apellido;
            document.getElementById('email').value = cliente.email;
            document.getElementById('telefono').value = cliente.telefono;

        } else {
            console.error("No se pudo cargar los datos del cliente.");
        }
    }
}


// Llama a la función cuando la página se carga
document.addEventListener('DOMContentLoaded', loadClienteData);

document.addEventListener('DOMContentLoaded', function () {
    // Comprobar si existe un token almacenado
    const token = localStorage.getItem('token');
    
    if (token) {
        // Si hay un token, mostrar el contenido principal y ocultar el formulario de inicio de sesión
        document.getElementById('navbar').style.display = 'block';
        llenarPeliculas();}
});


document.getElementById('updateClienteButton').addEventListener('click', async function () {
    const form = document.getElementById('form-cliente')

    if (!form.checkValidity()) {
        form.reportValidity();
        return;
    }

    const clienteId = localStorage.getItem('clienteId');
    const token = localStorage.getItem('token');
    
    const clienteData = {
        nombre: document.getElementById('nombre').value,
        apellido: document.getElementById('apellido').value,
        email: document.getElementById('email').value,
        telefono: document.getElementById('telefono').value,
    };

    const response = await fetch(`https://localhost:7167/api/cliente/${clienteId}`, {
        method: 'PUT',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(clienteData)
    });

    if (response.ok) {
        alert("Cliente actualizado exitosamente!");
        loadClienteData();
    } else {
        alert("Error al actualizar los datos del cliente.");
    }
});

async function llenarPeliculas() {
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

function logout() {
    // Eliminar el token del localStorage
    localStorage.removeItem("token");
    localStorage.removeItem("clienteId");
    localStorage.removeItem("rol");

    window.location.href = "../index.html";
}

document.getElementById("logoutButton").addEventListener("click", logout);
