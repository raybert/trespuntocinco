using System.Collections.Generic;
using TresPuntoCinco.Model;

namespace TresPuntoCinco.ViewModel
{
	public class ColaboradorViewModel
	{
        public List<Colaborador> ListaColaboradores { get; set; }
        public List<Capacitacion> ListaCapacitaciones { get; set; }
        public Capacitacion CapacitacionParaEditar { get; set; }
	}
}
