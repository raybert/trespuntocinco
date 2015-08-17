using System.Collections.Generic;
using TresPuntoCinco.Model;

namespace TresPuntoCinco.ViewModel
{
    public class MantenimientoViewModel
	{
        public IList<Mantenimiento> ListaMantenimientos { get; set; }
        public Mantenimiento DatosMantenimiento { get; set; }
	}
}
