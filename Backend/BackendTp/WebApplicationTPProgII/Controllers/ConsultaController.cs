using BackendTp.Data.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

namespace WebApplicationTPProgII.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsultaController : ControllerBase
    {
        private readonly string _connectionString = "Data Source=LAPTOP-9VR6P1V7;Initial Catalog=CINE_2024_BD;Integrated Security=True;Encrypt=False";

        //CREAN OTRO IGUAL QUE ESTE PERO CAMBIAN LA RUTA AL PRINCIPIO DONDE DICE HTTPGET Y LA CONSULTA
        //CUIDADO CON LOS ESPACIOS CUANDO BAJAN DE LINEA LA CONSULTA
        [HttpGet("consulta1")]
        public IActionResult EjecutarConsulta1()
        {
            string consultaSql = "SELECT cl.nombre Nombre, cl.apellido Apellido, SUM(c.montoTotal) AS 'Total Gastado'" + // Primera consulta predefinida
                                " FROM Clientes cl JOIN Compras c ON cl.id_cliente = c.id_cliente" +
                                " JOIN Entradas e ON c.id_compra = e.id_compra" +
                                " JOIN Funciones f ON e.id_funcion = f.id_funcion" +
                                " JOIN Promociones p ON f.id_promocion = p.id_promocion" +
                                " WHERE p.descrpcion = 'Descuento Menor Edad'" +
                                " AND GETDATE() BETWEEN p.fechaInicio AND p.fechaFin" +
                                " GROUP BY cl.nombre, cl.apellido" +
                                " HAVING SUM(c.montoTotal) > ( SELECT AVG(c2.montoTotal)" +
                                                                     " FROM Compras c2" +
                                                                     " WHERE MONTH(c2.fechaCompra) =" +
                                                                    " MONTH(DATEADD(MONTH, -1, GETDATE()))" +
                                                                     " AND YEAR(c2.fechaCompra) = YEAR(GETDATE()))";

            return EjecutarConsulta(consultaSql);
        }

        [HttpGet("consulta2")]
        public IActionResult EjecutarConsulta2()
        {
            string consultaSql = "SELECT c.nombre AS 'Nombre Cliente', c.apellido AS 'Apellido Cliente'," +
                                    " COUNT(co.id_compra) AS 'Total Compras', SUM(co.montoTotal) AS 'Total Gastado'" +
                                    " FROM Clientes c" +
                                    " JOIN Compras co ON c.id_cliente = co.id_cliente" +
                                    " JOIN TipoClientes tc on tc.id_tipo_cliente = c.id_tipo_cliente" +
                                    " GROUP BY c.nombre, c.apellido" +
                                    " HAVING COUNT(co.id_compra) > (SELECT AVG(cantidad.cantidad_compras)" +
                                    " FROM(SELECT COUNT(co2.id_compra) AS cantidad_compras" + 
                                    " FROM Compras co2" +
                                    " GROUP BY co2.id_cliente" +
                                    " ) AS cantidad)" 
;

            return EjecutarConsulta(consultaSql);
        }

        private IActionResult EjecutarConsulta(string consultaSql)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    SqlCommand command = new SqlCommand(consultaSql, connection);
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable resultado = new DataTable();
                    adapter.Fill(resultado);

                    // Convertir DataTable a lista de diccionarios para facilitar la conversión a JSON
                    var resultadoLista = new List<Dictionary<string, object>>();
                    foreach (DataRow row in resultado.Rows)
                    {
                        var fila = new Dictionary<string, object>();
                        foreach (DataColumn column in resultado.Columns)
                        {
                            fila[column.ColumnName] = row[column];
                        }
                        resultadoLista.Add(fila);
                    }

                    return Ok(resultadoLista);
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error al ejecutar la consulta: " + ex.Message);
            }
        }
    }
}
