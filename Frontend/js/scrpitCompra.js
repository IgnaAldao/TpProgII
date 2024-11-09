let funcionSeleccionada = null;
let nombrepelicula = null
let formasPago = [];
let promociones = [];

document.addEventListener('DOMContentLoaded', function () {
    // Comprobar si existe un token almacenado
    const token = localStorage.getItem('token');
    llenarPeliculas()
    obtenerPromociones()
    obtenerFormasPago()
    
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

async function llenarPeliculas() {
    try {
        const response = await fetch('https://localhost:7167/api/pelicula');
        if (!response.ok) throw new Error("Error al obtener las películas");

        const peliculas = await response.json();
        const dropdownMenu = document.getElementById("dropdown-peliculas");

        // Limpiar el menú de películas
        dropdownMenu.innerHTML = '';

        // Añadir la opción predeterminada
        const defaultOption = document.createElement("option");
        defaultOption.value = ""; // Valor vacío para indicar que no se ha seleccionado ninguna película
        defaultOption.textContent = "Seleccione una película";
        defaultOption.disabled = true; // Para que no se pueda seleccionar nuevamente una vez seleccionada otra opción
        defaultOption.selected = true; // Para que venga seleccionada por defecto
        dropdownMenu.appendChild(defaultOption);

        // Añadir cada película como una opción del dropdown
        peliculas.forEach(pelicula => {
            const option = document.createElement("option");
            option.value = pelicula.idPelicula; // Utiliza el identificador de la película
            option.textContent = pelicula.titulo;
            dropdownMenu.appendChild(option);
        });

        // Añadir evento para detectar cambio en la selección
        dropdownMenu.addEventListener("change", () => {
            const peliculaSeleccionada = peliculas.find(pelicula => pelicula.idPelicula == dropdownMenu.value);
            if (peliculaSeleccionada) {
                seleccionarPelicula(peliculaSeleccionada);
            }
        });

    } catch (error) {
        console.error("Error al cargar películas:", error);
    }
}

function seleccionarPelicula(pelicula) {
    if (pelicula) {
        console.log(`Película seleccionada: ${pelicula.titulo}`);
        nombrepelicula = pelicula.titulo
        // También podrías actualizar algún elemento del DOM para mostrar la película seleccionada
        const peliculaSeleccionada = document.getElementById('pelicula-seleccionada');
        if (peliculaSeleccionada) {
            peliculaSeleccionada.textContent = `Película seleccionada: ${pelicula.titulo}`;
        }
        llenarFunciones(pelicula.idPelicula);
    }
}

async function llenarFunciones(peliculaId) {
    try {
        console.log(`Obteniendo funciones para la película con ID: ${peliculaId}`);

        const response = await fetch(`https://localhost:7167/api/funcion/${peliculaId}`);
        if (!response.ok) throw new Error("Error al obtener las funciones de la película");

        const funciones = await response.json();
        const tablaFuncionesBody = document.querySelector("#tabla-funciones tbody");

        // Limpiar la tabla de funciones
        tablaFuncionesBody.innerHTML = '';

        if (funciones.length === 0) {
            // Si no hay funciones disponibles
            const row = document.createElement("tr");
            const cell = document.createElement("td");
            cell.colSpan = 5;
            cell.textContent = "No hay funciones disponibles para esta película.";
            cell.style.textAlign = "center";
            row.appendChild(cell);
            tablaFuncionesBody.appendChild(row);
        } else {
            // Añadir cada función como una fila de la tabla
            funciones.forEach(funcion => {
                const row = document.createElement("tr");

                const cellId = document.createElement("td");
                cellId.textContent = funcion.idFuncion;

                const cellFecha = document.createElement("td");
                const fechaObj = new Date(funcion.fecha);
                const fechaFormateada = fechaObj.toISOString().split('T')[0].replace(/-/g, '/'); // Formato aaaa/MM/dd
                cellFecha.textContent = fechaFormateada;

                const cellHora = document.createElement("td");
                cellHora.textContent = funcion.hora + "hs.";

                const cellSala = document.createElement("td");
                cellSala.textContent = funcion.idSala;

                const cellPrecio = document.createElement("td");
                cellPrecio.textContent = `$${funcion.precioBase}`;

                row.appendChild(cellId);
                row.appendChild(cellFecha);
                row.appendChild(cellHora);
                row.appendChild(cellSala);
                row.appendChild(cellPrecio);

                // Añadir evento de doble clic para mostrar el modal de venta de entradas
                row.addEventListener("dblclick", () => {
                    mostrarModalVenta(funcion);
                });

                tablaFuncionesBody.appendChild(row);
            });
        }
    } catch (error) {
        console.error("Error al cargar las funciones:", error);
    }
}

function mostrarModalVenta(funcion) {
    funcionSeleccionada = funcion

    // Mostrar los detalles de la función en el modal
    const detallesFuncion = document.getElementById('detalles-funcion');

    // Crear la tabla de precios y promociones
    const tablaBody = document.querySelector("#venta-info table tbody");
    tablaBody.innerHTML = ''; // Limpiar el contenido previo

    promociones.forEach(promocion => {  
        // Calcular el precio con el descuento aplicado
        const descuento = (promocion.descuento / 100);
        const precioConDescuento = (funcion.precioBase * (1 - descuento)).toFixed(2);

        // Crear una fila para la promoción
        const row = document.createElement("tr");

        const cellPrecio = document.createElement("td");
        cellPrecio.textContent = promocion.descrpcion;

        const cellValor = document.createElement("td");
        cellValor.textContent = `$${precioConDescuento}`;

        const cellCantidad = document.createElement("td");
        const selectCantidad = document.createElement("select");
        selectCantidad.className = "form-select cantidad-entradas";
        for (let i = 0; i <= 6; i++) {
            const option = document.createElement("option");
            option.value = i;
            option.textContent = i;
            selectCantidad.appendChild(option);
        }
        cellCantidad.appendChild(selectCantidad);

        row.appendChild(cellPrecio);
        row.appendChild(cellValor);
        row.appendChild(cellCantidad);

        tablaBody.appendChild(row);
    });

    // Mostrar el modal
    const ventaModal = new bootstrap.Modal(document.getElementById('ventaModal'));
    ventaModal.show();
}


function procesarVenta() {
    // Obtener todas las cantidades seleccionadas
    const cantidades = document.querySelectorAll('.cantidad-entradas');
    let totalEntradas = 0;
    let totalCompra = 0;

    cantidades.forEach((select, index) => {
        const cantidad = parseInt(select.value);
        if (cantidad > 0) {
            totalEntradas += cantidad;
            const precioValor = promociones[index].descuento / 100;
            const precioConDescuento = (funcionSeleccionada.precioBase * (1 - precioValor)).toFixed(2);
            totalCompra += cantidad * parseFloat(precioConDescuento);
        }
    });

    if (totalEntradas === 0) {
        alert("Debe seleccionar al menos una entrada para proceder con la venta.");
    } else {
        console.log(`Procesando venta para un total de ${totalEntradas} entradas.`);

        // Cerrar el modal actual
        const ventaModal = bootstrap.Modal.getInstance(document.getElementById('ventaModal'));
        ventaModal.hide();

        // Mostrar el modal de detalle de la compra
        mostrarDetalleCompra(totalCompra);
    }
}

function mostrarDetalleCompra(totalCompra) {
    // Mostrar los detalles de la compra en el modal de detalle de compra
    document.getElementById('detalle-pelicula').textContent = `Película: ${nombrepelicula}`;
    document.getElementById('detalle-sala').textContent = `Sala: ${funcionSeleccionada.idSala}`;
    document.getElementById('detalle-hora').textContent = `Hora: ${funcionSeleccionada.hora}hs.`;
    document.getElementById('detalle-total').textContent = `Total: $${totalCompra.toFixed(2)}`;

    // Limpiar el dropdown de formas de pago
    const formaPagoSelect = document.getElementById('formaPago');
    formaPagoSelect.innerHTML = '';

    // Añadir las formas de pago obtenidas desde el endpoint
    formasPago.forEach(forma => {
        const option = document.createElement('option');
        option.value = forma.idFormaPago; // Usa el identificador de la forma de pago
        option.textContent = forma.descripcion; // La descripción de la forma de pago
        formaPagoSelect.appendChild(option);
    });

    // Mostrar el modal de detalle de la compra
    const detalleCompraModal = new bootstrap.Modal(document.getElementById('detalleCompraModal'));
    detalleCompraModal.show();
}


async function confirmarCompra() {
    console.log(`Confirmando compra`);

    // Obtener la información de la compra
    const formaPagoSeleccionada = document.getElementById('formaPago').value; // ID de la forma de pago
    const idCliente = localStorage.getItem('clienteId'); // ID del cliente desde localStorage
    const fechaCompra = new Date().toISOString(); // Fecha de la compra en formato ISO
    const montoTotal = parseFloat(document.getElementById('detalle-total').textContent.replace('Total: $', '')); // Monto total de la compra

    // Validar que el ID de cliente y la forma de pago estén presentes
    if (!idCliente) {
        alert('No se encontró el ID del cliente. Por favor, inicie sesión nuevamente.');
        return;
    }

    if (!formaPagoSeleccionada) {
        alert('Debe seleccionar una forma de pago.');
        return;
    }

    // Crear el objeto de la compra
    const compraData = {
        FechaCompra: fechaCompra,
        MontoTotal: montoTotal,
        IdCliente: parseInt(idCliente),
        IdFormaPago: parseInt(formaPagoSeleccionada)
    };

    try {
        // Realizar el POST al endpoint para registrar la compra
        const response = await fetch('https://localhost:7167/api/Compra', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(compraData)
        });

        if (response.ok) {
            console.log("Compra registrada con éxito.");
            alert('Compra realizada con éxito');
        } else {
            console.error("Error al registrar la compra:", response.statusText);
            alert('Error al registrar la compra.');
        }
    } catch (error) {
        console.error("Error al conectar con el servidor:", error);
        alert('Error al conectar con el servidor.');
    }

    // Cerrar el modal de detalle de la compra después de confirmar
    const detalleCompraModal = bootstrap.Modal.getInstance(document.getElementById('detalleCompraModal'));
    detalleCompraModal.hide();
}


async function obtenerPromociones() {
    try {
        const response = await fetch('https://localhost:7167/api/Funcion');
        if (!response.ok) throw new Error("Error al obtener las promociones");

        promociones = await response.json();
        console.log("Promociones obtenidas:", promociones);
    } catch (error) {
        console.error("Error al cargar promociones:", error);
    }
}

async function obtenerFormasPago() {
    try {
        const response = await fetch('https://localhost:7167/api/Compra');
        if (!response.ok) throw new Error("Error al obtener las formas de pago");

        formasPago = await response.json();
        console.log("Formas de pago obtenidas:", formasPago);
    } catch (error) {
        console.error("Error al cargar formas de pago:", error);
    }
}





