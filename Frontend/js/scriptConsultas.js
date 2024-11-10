
document.addEventListener('DOMContentLoaded', function () {
    // Comprobar si existe un token almacenado
    const token = localStorage.getItem('token');
    
    if (token) {
        // Si hay un token, mostrar el contenido principal y ocultar el formulario de inicio de sesión
        document.getElementById('navbar').style.display = 'block';
        llenarPeliculas();}
});

function logout() {
    // Eliminar el token del localStorage
    localStorage.removeItem("token");
    localStorage.removeItem("clienteId");
    localStorage.removeItem("rol");

    window.location.href = "../index.html";
}

document.getElementById("logoutButton").addEventListener("click", logout);

//AGREGAR ESTO MISMO PERO QUE DIGA CONSULTAx O COMO LO PUSIERON EN EL BACKEND
document.getElementById('consulta1Btn').addEventListener('click', () => {
    ejecutarConsulta('https://localhost:7167/api/Consulta/consulta1');
});

document.getElementById('consulta2Btn').addEventListener('click', () => {
    ejecutarConsulta('https://localhost:7167/api/Consulta/consulta2');
});


function mostrarConsulta(enunciado, consultaSQL) {
    const html = `
        <div class="consulta-container">
            <h5>Enunciado de la consulta:</h5>
            <p>${enunciado}</p>
            <h5>Consulta SQL:</h5>
            <pre>${consultaSQL}</pre>
        </div>
    `;
    document.getElementById('resultadoConsulta').innerHTML = html;
}

//CREAN OTRO IGUAL QUE ESTE PERO CON SUS ENUNCIADOS Y SUS CONSULTAS Y CAMBIEN DONDE DICE getElementById POR EL ID DE SUS BOTON
document.getElementById('consulta1Btn').addEventListener('click', () => {
    const enunciadoConsulta1 = "Listar clientes que hayan comprado entradas para funciones con una promoción por 'menor de edad' y que esté vigente y cuyo monto total sea mayor que el promedio de montos de compras del mes pasado.";
    const consultaSQL1 = `
        SELECT cl.nombre, cl.apellido, SUM(c.montoTotal) AS TotalGastado
        FROM Clientes cl 
        JOIN Compras c ON cl.id_cliente = c.id_cliente
        JOIN Entradas e ON c.id_compra = e.id_compra
        JOIN Funciones f ON e.id_funcion = f.id_funcion
        JOIN Promociones p ON f.id_promocion = p.id_promocion
        WHERE p.descrpcion = 'Descuento Menor Edad'
        AND GETDATE() BETWEEN p.fechaInicio AND p.fechaFin
        GROUP BY cl.nombre, cl.apellido
        HAVING SUM(c.montoTotal) > (
            SELECT AVG(c2.montoTotal)
            FROM Compras c2
            WHERE MONTH(c2.fechaCompra) = MONTH(DATEADD(MONTH, -1, GETDATE()))
            AND YEAR(c2.fechaCompra) = YEAR(GETDATE())
    `;

    mostrarConsulta(enunciadoConsulta1, consultaSQL1);
});

document.getElementById('consulta2Btn').addEventListener('click', () => {
    const enunciadoConsulta2 = "Listar todos los clientes que realizaron más compras que el promedio de clientes durante el año pasado siempre y cuando el cliente no sea menor de edad.";
    const consultaSQL2 = `
        SELECT c.nombre AS Nombre_Cliente, c.apellido AS Apellido_Cliente,
        COUNT(co.id_compra) AS TotalCompras, SUM(co.montoTotal) AS TotalGastado
        FROM Clientes c 
        JOIN Compras co ON c.id_cliente = co.id_cliente 
        JOIN TipoClientes tc on tc.id_tipo_cliente = c.id_tipo_cliente
        GROUP BY c.nombre, c.apellido
        HAVING COUNT(co.id_compra) > (SELECT AVG(cantidad.cantidad_compras)
                                        FROM (SELECT COUNT(co2.id_compra) AS cantidad_compras
                                            FROM Compras co2
                                            GROUP BY co2.id_cliente
                                            ) AS cantidad)

    `;

    mostrarConsulta(enunciadoConsulta2, consultaSQL2);
});


function ejecutarConsulta(url) {
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Error al ejecutar la consulta.');
            }
            return response.json();
        })
        .then(data => {
            mostrarResultado(data);
        })
        .catch(error => {
            console.error('Error:', error);
            document.getElementById('resultadoConsulta').innerHTML += '<p>Error al ejecutar la consulta</p>';
        });
}

function mostrarResultado(data) {
    let html = '<table class="table table-dark table-striped table-hover table-bordered mt-4"><thead><tr>';

    // Crear encabezados de la tabla
    if (data.length > 0) {
        for (const key in data[0]) {
            html += `<th class="text-center">${key}</th>`;
        }
        html += '</tr></thead><tbody>';

        // Crear las filas de la tabla
        data.forEach(row => {
            html += '<tr>';
            for (const key in row) {
                if (key.toLowerCase() === 'total gastado') {
                    const valor = parseFloat(row[key]);
                    if (!isNaN(valor)) {    
                        html += `<td class="text-center">$${valor.toFixed(2)}</td>`; // Agrega el símbolo de peso y formatea a 2 decimales
                    } else {
                        html += `<td class="text-center">$0.00</td>`;
                    }
                } else {
                    html += `<td class="text-center">${row[key]}</td>`;
                }
            }
            html += '</tr>';
        });
        html += '</tbody></table>';
    } else {
        html = '<p>No se encontraron resultados.</p>';
    }

    document.getElementById('resultadoConsulta').innerHTML += html;
}





