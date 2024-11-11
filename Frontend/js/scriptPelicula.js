document.addEventListener('DOMContentLoaded', function() {
    // Cargar las películas y géneros al entrar
    cargarPeliculas();
    cargarGeneros();
    if(localStorage.getItem("rol") == "ResponsableWEB"){
        let btnAgregar = document.getElementById("btn-agregar")
        btnAgregar.disabled = false
    }  

    // Event listener para aplicar filtros
    const filtroForm = document.querySelector('form');
    filtroForm.addEventListener('submit', function(event) {
        event.preventDefault();
        aplicarFiltro();
    });
    document.getElementById('modalAgregarPelicula').addEventListener('show.bs.modal', cargarClasificacionesAgregar);

});

document.addEventListener('DOMContentLoaded', function () {
    // Comprobar si existe un token almacenado
    const token = localStorage.getItem('token');
    
    if (token) {
        document.getElementById('navbar').style.display = 'block';
    }
});

function logout() {
    // Eliminar el token del localStorage
    localStorage.removeItem("token");
    localStorage.removeItem("clienteId");
    localStorage.removeItem("rol");

    window.location.href = "../index.html";
}

// Agregar el evento al botón de cerrar sesión
document.getElementById("logoutButton").addEventListener("click", logout);

// Función para cargar los géneros al entrar
function cargarGeneros() {
    fetch('https://localhost:7167/api/Genero')
        .then(response => response.json())
        .then(generos => {
            const generoSelect = document.getElementById('genero');
            generos.forEach(genero => {
                const option = document.createElement('option');
                option.value = genero.descripcion;  // Aquí usa el ID del género
                option.textContent = genero.descripcion;
                generoSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error al cargar los géneros:', error));
}

// Función para cargar las películas al entrar
function cargarPeliculas() {
    fetch('https://localhost:7167/api/Pelicula')
        .then(response => response.json())
        .then(peliculas => {
            mostrarPeliculas(peliculas);
        })
        .catch(error => console.error('Error al cargar las películas:', error));
}

// Función para aplicar filtros
function aplicarFiltro() {
    const nombre = document.getElementById('nombre').value;
    const genero = document.getElementById('genero').value;

    // Construir la URL con los parámetros de los filtros
    let url = 'https://localhost:7167/api/Pelicula/by-filters?';
    if (nombre) {
        url += `titulo=${encodeURIComponent(nombre)}&`;  // Aquí cambiamos 'nombre' por 'titulo' si así lo requiere la API
    }
    if (genero) {
        url += `genero=${encodeURIComponent(genero)}&`;
    }

    // Eliminar el último ampersand (&)
    url = url.slice(0, -1);

    // Verificar la URL antes de hacer la solicitud
    console.log('URL de solicitud:', url);

    fetch(url)
        .then(response => response.json())
        .then(peliculas => {
            console.log('Películas recibidas:', peliculas);  // Verifica las películas que recibes
            mostrarPeliculas(peliculas);
        })
        .catch(error => console.error('Error al filtrar las películas:', error));
}

function mostrarPeliculas(peliculas) {
    const tbody = document.querySelector('table tbody');
    tbody.innerHTML = ''; // Limpiar las filas existentes

    if (peliculas && peliculas.length > 0) {
        peliculas.forEach(pelicula => {
            const row = document.createElement('tr');
            
            const nombreCell = document.createElement('td');
            nombreCell.textContent = pelicula.titulo;
            row.appendChild(nombreCell);
            
            const generoCell = document.createElement('td');
            generoCell.textContent = pelicula.genero;
            row.appendChild(generoCell);

            const duracionCell = document.createElement('td');
            duracionCell.textContent = pelicula.duracion;
            row.appendChild(duracionCell);

            const clasificacionCell = document.createElement('td');
            clasificacionCell.textContent = pelicula.clasificacion;
            row.appendChild(clasificacionCell);

            // Celda para los botones
            const actionCell = document.createElement('td');
            
            // Botón Modificar
            const modifyButton = document.createElement('button');
            if(localStorage.getItem("rol") != "ResponsableWEB"){
                modifyButton.disabled = 'true'
            }
            modifyButton.textContent = 'Modificar';
            modifyButton.classList.add('btn', 'btn-warning', 'me-2');
            modifyButton.onclick = () => modificarPelicula(pelicula.idPelicula);
            actionCell.appendChild(modifyButton);

            // Botón Eliminar
            const deleteButton = document.createElement('button');
            if(localStorage.getItem("rol") != "ResponsableWEB"){
                deleteButton.disabled = 'true'
            }
            deleteButton.textContent = 'Eliminar';
            deleteButton.classList.add('btn', 'btn-danger');
            deleteButton.onclick = () => eliminarPelicula(pelicula.idPelicula);
            actionCell.appendChild(deleteButton);

            row.appendChild(actionCell);

            tbody.appendChild(row);
        });
    } else {
        // Si no se encontraron películas, mostrar un mensaje en la tabla
        const row = document.createElement('tr');
        const cell = document.createElement('td');
        cell.colSpan = 5;
        cell.textContent = 'No se encontraron películas con esos filtros.';
        row.appendChild(cell);
        tbody.appendChild(row);
    }
}

// Función para cargar los géneros en el select del modal de modificación
function cargarGenerosModificar(generoSeleccionado) {
    fetch('https://localhost:7167/api/Genero')
        .then(response => response.json())
        .then(generos => {
            const generoSelect = document.getElementById('generoModificar');
            generoSelect.innerHTML = '<option value="" selected>Seleccione un género</option>';

            generos.forEach(genero => {
                const option = document.createElement('option');
                option.value = genero.idGenero;  // Usa el ID del género
                option.textContent = genero.descripcion;
                if (genero.idGenero === generoSeleccionado) {
                    option.selected = true;
                }
                generoSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error al cargar los géneros:', error));
}

// Función para modificar una película
function modificarPelicula(id) {
    fetch(`https://localhost:7167/api/Pelicula/${id}`)
        .then(response => response.json())
        .then(pelicula => {
            document.getElementById('titulo').value = pelicula.titulo;
            document.getElementById('duracion').value = pelicula.duracion;

            // Cargar el género correspondiente
            cargarGenerosModificar(pelicula.idGenero);
            
            // Cargar la clasificación correspondiente
            cargarClasificacionesModificar(pelicula.idClasificacion);

            document.getElementById('guardarCambios').dataset.id = id;
            new bootstrap.Modal(document.getElementById('modalModificarPelicula')).show();
        })
        .catch(error => console.error('Error al cargar los datos de la película:', error));
}


// Modificar los datos de la película
document.getElementById('guardarCambios').addEventListener('click', function() {
    const id = this.dataset.id; 
    const pelicula = {
        titulo: document.getElementById('titulo').value,
        idGenero: parseInt(document.getElementById('generoModificar').value),  // Aquí pasamos el ID del género seleccionado
        duracion: parseInt(document.getElementById('duracion').value),
        idClasificacion: parseInt(document.getElementById('clasificacion').value)
    };
    console.log(pelicula)
    if(validarDatos(pelicula)){
        console.log(pelicula)
        fetch(`https://localhost:7167/api/Pelicula/${id}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(pelicula)
    })
    .then(response => {
        if (response.ok) {
            alert('Película modificada exitosamente.');
            new bootstrap.Modal(document.getElementById('modalModificarPelicula')).hide();
            cargarPeliculas(); 
        } else {
            return response.text().then(text => {
                console.log('Respuesta del servidor:', text);  // Ver la respuesta completa
                throw new Error(text);
            });
        }
    })
    .catch(error => alert('Error al modificar la película: ' + error.message));
    }
    else alert("INGRESE TODOS LOS DATOS!!")
});


// Función para eliminar una película
function eliminarPelicula(id) {
    if (confirm('¿Estás seguro de que deseas eliminar esta película?')) {
        fetch(`https://localhost:7167/api/Pelicula/${id}`, {
            method: 'DELETE'
        })
        .then(response => {
            if (response.ok) {
                alert('Película eliminada correctamente');
                cargarPeliculas(); 
            } else {
                alert('Error al eliminar la película');
            }
        })
        .catch(error => console.error('Error al eliminar la película:', error));
    }
}


// Cargar los géneros en el modal de agregar película
function cargarGenerosAgregar() {
    fetch('https://localhost:7167/api/Genero')
        .then(response => response.json())
        .then(generos => {
            const generoSelect = document.getElementById('generoAgregar');
            generoSelect.innerHTML = '<option value="" selected>Seleccione un género</option>';
            generos.forEach(genero => {
                const option = document.createElement('option');
                option.value = genero.idGenero; // Usa el ID del género
                option.textContent = genero.descripcion;
                generoSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error al cargar los géneros:', error));
}

// Evento para guardar la nueva película
document.getElementById('guardarNuevaPelicula').addEventListener('click', function() {
    const nuevaPelicula = {
        titulo: document.getElementById('tituloAgregar').value,
        idGenero: parseInt(document.getElementById('generoAgregar').value),
        duracion: parseInt(document.getElementById('duracionAgregar').value),
        idClasificacion: parseInt(document.getElementById('clasificacionAgregar').value)
    };
    if(validarDatos(nuevaPelicula)){fetch('https://localhost:7167/api/Pelicula', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(nuevaPelicula)
    })
    .then(response => {
        if (response.ok) {
            alert('Película agregada exitosamente.');
            new bootstrap.Modal(document.getElementById('modalAgregarPelicula')).hide();
            cargarPeliculas(); // Actualizar la lista de películas
        } else {
            return response.text().then(text => { throw new Error(text); });
        }
    })
    .catch(error => alert('Error al agregar la película: ' + error.message));
    }
    else alert("INGRESE TODOS LOS DATOS!!")
});

// Llamar a cargarGenerosAgregar cuando el modal se muestra
document.getElementById('modalAgregarPelicula').addEventListener('show.bs.modal', cargarGenerosAgregar);

function validarDatos(pelicula) {
    if (
        pelicula.titulo === "" || 
        pelicula.idGenero == null || 
        pelicula.idGenero === "" || 
        Number.isNaN(pelicula.idGenero) ||
        pelicula.duracion == null || 
        Number.isNaN(pelicula.duracion) || 
        pelicula.idClasificacion == null || 
        pelicula.idClasificacion === "" || 
        Number.isNaN(pelicula.idClasificacion)
    ) {
        return false;
    }
    return true;
}


function cargarClasificacionesAgregar() {
    fetch('https://localhost:7167/clasificaciones')
        .then(response => response.json())
        .then(clasificaciones => {
            const clasificacionSelect = document.getElementById('clasificacionAgregar');
            clasificacionSelect.innerHTML = '<option value="" selected>Seleccione una clasificación</option>';
            clasificaciones.forEach(clasificacion => {
                const option = document.createElement('option');
                option.value = clasificacion.idClasificacion; // Usa el ID de la clasificación
                option.textContent = clasificacion.descripcion;
                clasificacionSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error al cargar las clasificaciones:', error));
}

function cargarClasificacionesModificar(clasificacionSeleccionada) {
    fetch('https://localhost:7167/clasificaciones')
        .then(response => response.json())
        .then(clasificaciones => {
            const clasificacionSelect = document.getElementById('clasificacion');
            clasificacionSelect.innerHTML = '<option value="" selected>Seleccione una clasificación</option>';
            clasificaciones.forEach(clasificacion => {
                const option = document.createElement('option');
                option.value = clasificacion.idClasificacion; // Usa el ID de la clasificación
                option.textContent = clasificacion.descripcion;
                if (clasificacion.idClasificacion === clasificacionSeleccionada) {
                    option.selected = true; // Selecciona la clasificación actual de la película
                }
                clasificacionSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error al cargar las clasificaciones:', error));
}