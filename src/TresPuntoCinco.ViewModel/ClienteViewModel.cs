using System.Collections.Generic;
using TresPuntoCinco.Model;

namespace TresPuntoCinco.ViewModel
{
	public class ClienteViewModel
	{
		public Cliente DatosCliente { get; set; }
        public IList<Cliente> ListaClientes { get; set; }
	}
}
