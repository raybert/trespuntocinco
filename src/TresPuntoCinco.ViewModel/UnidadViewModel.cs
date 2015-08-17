using System.Collections.Generic;
using TresPuntoCinco.Model;

namespace TresPuntoCinco.ViewModel
{
	public class UnidadViewModel
	{
        public Unidad DatosUnidad { get; set; }
        public IList<Unidad> ListaUnidades { get; set; }
        public IList<TipoUnidad> ListaTipoUnidad { get; set; }
	}
}
