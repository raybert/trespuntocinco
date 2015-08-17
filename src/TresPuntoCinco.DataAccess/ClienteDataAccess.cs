using System.Collections.Generic;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;

namespace TresPuntoCinco.DataAccess
{
    public class ClienteDataAccess
    {
        public List<Cliente> ObtenerClientes(bool estado)
        {
            return DbHelper.SelectObject<Cliente>(new { Estado = (estado ? "A" : "I") });
        }

		public Cliente ObtenerClientePorIdentificacion(int idCliente)
		{
			return DbHelper.SelectObjectById<Cliente>(new { IdCliente = idCliente });
		}
	}
}
